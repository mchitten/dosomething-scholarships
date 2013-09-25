FactoryGirl.define do
  factory :share_a_stat_post do
    share_a_stat
    my_name { Faker::Name.first_name }
    my_number { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_1 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_2 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_3 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_4 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_5 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
    friend_6 { Faker::PhoneNumber.cell_phone.gsub(/x[0-9]+/, '') }
  end
end
