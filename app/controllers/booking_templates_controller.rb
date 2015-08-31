class BookingTemplatesController < HasAccountsController
  # Actions
  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  def new_booking
    booking_params = params[:booking] || {}
    booking_params[:value_date] ||= Date.today
    booking_params[:code]       ||= (Booking.maximum(:code) || 0) + 1
    booking_parameters = @booking_template.booking_parameters(booking_params)

    redirect_to new_booking_path(:booking => booking_parameters)
  end
end
