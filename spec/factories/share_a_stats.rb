# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share_a_stat do
    title "MyString"
    message "MyText"
    image "MyString"
    scholarship false
    tip "MyString"
    mc_alpha 1
    mc_beta 1
    redirect "MyString"
    redirect_message "MyText"
    campaign_id 1
    color_scheme "MyString"
    logo "MyString"
    logo_text "MyString"
    shortform_image "MyString"
    shortform_bucket "MyString"
    sponsor_image "MyString"
    published false
  end
end
