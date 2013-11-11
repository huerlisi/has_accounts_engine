module HasAccountsHelper
  include ActionView::Helpers::NumberHelper
  def currency_fmt(value)
    # We often do get -0.0 but don't like it
    value = 0.0 if value.to_s.match %r{^-[0.]*$}

    number = number_with_precision(value, :precision => 2, :separator => '.', :delimiter => "'")
  end
end
