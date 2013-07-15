# encoding: UTF-8

class SimpleBookingsController < ApplicationController
  # GET /bookings/new
  def new
    params[:booking] ||= {}

    if invoice_id = params[:invoice_id]
      params[:booking][:reference_id] = invoice_id
      params[:booking][:reference_type] = 'Invoice'
    end

    if template_id = params[:booking_template_id]
      template = BookingTemplate.find(template_id)
      @booking = template.build_booking(params[:booking])
    else
      @booking = Booking.new
    end
    @booking.value_date = Date.today

    render 'show_modal'
  end

  # PUT /booking
  def create
    if params[:invoice_id]
      @invoice = Invoice.find(params[:invoice_id])
      @booking = @invoice.bookings.build(params[:booking])
    else
      @booking = Booking.new(params[:booking])
    end

    if @booking.save
      flash[:notice] = 'Buchung erfasst.'
    end

    redirect_to @invoice
  end
end
