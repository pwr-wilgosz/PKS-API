FactoryGirl.define do
  factory :bus do
    sequence(:registration_number) {|i| "DW  AAA#{i}" }
    brand 'Mercedes'
    spaces '45'
  end
end

