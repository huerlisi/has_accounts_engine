module HasAccounts
  module Model
    extend ActiveSupport::Concern
    
    included do
      class_inheritable_accessor :direct_account

      has_many :bookings, :as => :reference, :dependent => :destroy do
        # TODO: duplicated in Booking (without parameter)
        def direct_balance(value_date = nil, direct_account = nil)
          return BigDecimal.new('0') unless proxy_owner.direct_account
          
          direct_account ||= proxy_owner.direct_account
          balance = BigDecimal.new('0')

          direct_bookings = scoped
          direct_bookings = direct_bookings.where("value_date <= ?", value_date) if value_date

          for booking in direct_bookings.all
            balance += booking.accounted_amount(direct_account)
          end

          balance
        end
      end
    end

    module ClassMethods
    end
    
    module InstanceMethods
      # Delegate to class
      def direct_account
        self.class.direct_account
      end

      # Build booking
      def build_booking(params = {}, template_code = nil)
        template_code ||= self.class.to_s.underscore + ':invoice'
        booking_template = BookingTemplate.find_by_code(template_code)
        
        # Prepare booking parameters
        booking_params = {
          :value_date      => value_date,
          :reference_type  => self.class.name,
          :reference_id    => self.id
        }
        booking_params.merge!(params)

        # Build and assign booking
        booking = booking_template.build_booking(booking_params)
        bookings << booking
        
        booking
      end

      def balance(value_date = nil)
        bookings.direct_balance(value_date)
      end
    end
  end
end
