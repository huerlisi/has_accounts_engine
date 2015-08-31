class BookingsController < HasAccountsController
  # Scopes
  has_scope :by_text
  has_scope :by_amount, :using => [:from, :to]
  has_scope :by_date, :using => [:from, :to]

  # Actions
  def select_booking
    @booking = Booking.find(params[:id]).dup

    # Clear reference
    @booking.reference  = nil

    increment_booking_code
    # Take value date from form
    @booking.value_date = params[:booking][:value_date]

    render :action => 'edit'
  end

  def select
    @booking = Booking.new(params[:booking])
    increment_booking_code
    @booking_templates = BookingTemplate.where(:type => [nil, 'BookingTemplate']).where("NOT(code LIKE '%:%')").paginate(:page => params[:page])
    @bookings = Booking.where("title LIKE ?", '%' + @booking.title + '%').order('value_date DESC').paginate(:page => params[:page])
  end

  def create
    create! { new_booking_path }
  end

  def copy
    original_booking = Booking.find(params[:id])

    @booking = original_booking.dup

    render 'edit'
  end

  private

  def increment_booking_code
    @booking.code = (Booking.maximum(:code) || 0) + 1
  end
end
