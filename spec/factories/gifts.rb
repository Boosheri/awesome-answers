FactoryBot.define do
  factory :gift do
    sender_id { 1 }
    receiver_id { 1 }
    amout { 1.5 }
    txn_id { "MyString" }
  end
end
