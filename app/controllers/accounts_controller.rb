class AccountsController < HasAccountsController
  # Scopes
  has_scope :by_date, :using => [:from, :to], :default => proc { |c| c.session[:has_scope] }
  has_scope :by_text

  has_scope :page, :only => :index

  def index
    @accounts = collection.includes(:account_type).includes(:credit_bookings, :credit_bookings).page(params[:page]).per_page(100)
  end

  def show
    @account = Account.find(params[:id])
    @bookings = apply_scopes(Booking).includes(:debit_account => :account_type, :credit_account => :account_type).by_account(@account)
    @bookings = @bookings.page(params[:page] || 1)
    @bookings = @bookings.per_page(params[:per_page].to_i) if params[:per_page].present?

    if params[:only_credit_bookings]
      @bookings = @bookings.where(:credit_account_id => @account.id)
    end
    if params[:only_debit_bookings]
      @bookings = @bookings.where(:debit_account_id => @account.id)
    end
    @carry_booking = @bookings.all.first
    @saldo = @account.saldo(@carry_booking, false)

    if @account.profit_account? && params[:by_date] && params[:by_date][:to]
      @saldo -= @account.saldo(Date.parse(params[:by_date][:from]), false)
    end

    show!
  end

  def csv_bookings
    @account = Account.find(params[:id])
    @bookings = apply_scopes(Booking).by_account(@account)
    send_csv @bookings, :only => [:value_date, :title, :comments, :amount, 'credit_account.code', 'debit_account.code'], :filename => "%s-%s.csv" % [@account.code, @account.title]
  end

  def edit_bookings
    @account = Account.find(params[:id])
    @bookings = apply_scopes(Booking).by_account(@account)
  end

  def update_bookings
    bookings = params[:bookings]

    bookings.each do |id, attributes|
      attributes.merge!({:credit_account_id => Account.find_by_code(attributes[:credit_account_code]).id})
      attributes.merge!({:debit_account_id => Account.find_by_code(attributes[:debit_account_code]).id})
      Booking.find(id).update_attributes(attributes)
    end

    account = Account.find(params[:id])
    redirect_to account
  end
end
