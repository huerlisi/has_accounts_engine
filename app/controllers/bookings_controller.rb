class BookingsController < HasAccountsController
  # Scopes
  has_scope :by_code
  has_scope :by_text
  has_scope :by_amount, :using => [:from, :to]
  has_scope :by_date, :using => [:from, :to]

  def create
    create! { new_booking_path }
  end

  def copy
    original_booking = Booking.find(params[:id])

    @booking = original_booking.dup
    increment_booking_code

    render 'edit'
  end

  private

  def increment_booking_code
    @booking.code = (Booking.maximum(:code) || 0) + 1
  end
end
