FactoryGirl.define do
  factory :illness do
    patient
    doctor
    illness_request
  end
end
