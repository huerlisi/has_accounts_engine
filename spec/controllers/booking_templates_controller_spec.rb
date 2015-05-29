require 'spec_helper'

shared_examples "booking template" do
end

describe BookingTemplatesController do
  before(:all) do
    Factory.create(:booking_template)
  end

  describe "list all" do
    it "booking templates" do
      get :index
      expect(assigns(:booking_templates)).to_not be_nil
      expect(assigns(:booking_templates)).to_not be_empty
      expect(assigns(:booking_templates).first).to be_a_kind_of(BookingTemplate)
    end
  end

  describe "create" do
    it "a booking template successfully" do
      title = 'Kreditkarten Einnahmen'
      code = 'day:card turnover'
      matcher = 'test'
      credit_account = Factory.create(:eft_account)
      debit_account = Factory.create(:service_account)
      post :create, {:booking_template => {:title => title,
                                           :code => code,
                                           :matcher => matcher,
                                           :credit_account_id => credit_account.id,
                                           :debit_account_id => debit_account.id}}
      expect(response).to redirect_to('/booking_templates')
      expect(assigns(:booking_template).title).to eq(title)
    end
  end

  describe "update" do
    it "a booking template successfully" do
      booking_template = Factory.create(:invoice_booking_template)
      new_title = 'title'
      put :update, {:id => booking_template.id, :booking_template => {:title => new_title}}
      expect(response).to redirect_to('/booking_templates')
      expect(assigns(:booking_template).title).to eq(new_title)
    end
  end
end
