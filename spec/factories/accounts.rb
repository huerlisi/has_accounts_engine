FactoryGirl.define do
  factory :account do
    code  '0000'
    title 'Test Account'
    association :account_type
  end

  factory :accounts_payable, :parent => :account do
    code  '2000'
    title 'Accounts Payable'
    association :account_type, :factory => :outside_capital
  end

  factory :cash_account, :parent => :account do
    code  '1000'
    title 'Cash'
    association :account_type, :factory => :current_assets
  end

  factory :eft_account, :parent => :account do
    title 'EFT Kontokorrent'
    code '1021'
    association :account_type, :factory => :current_assets
  end

  factory :service_account, :class => Account do
    title 'Dienstleistungsertrag'
    code '3200'
    association :account_type, :factory => :earnings
  end

  factory :material_account, :parent => :account do
    title "Materialaufwand"
    code  "4000"
    association :account_type, :factory => :costs
  end

  factory :credit_account, :class => Account do
    title "Kreditoren"
    code  "2000"
    association :account_type, :factory => :outside_capital
  end

  factory :debit_account, :class => Account do
    title 'direct account'
    code '1100'
    association :account_type, :factory => :current_assets
  end
end
