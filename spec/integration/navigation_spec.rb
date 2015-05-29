require 'spec_helper'

describe "Navigation" do
  include Capybara::DSL

  it "should be a valid app" do
    expect(::Rails.application).to be_a(Dummy::Application)
  end
end
