FactoryGirl.define do
  factory :share_a_stat do
    title { Faker::Lorem.words.join(" ") }
    message { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.to_s + '/spec/mocks/mock.png', 'image/png') }
    tip { Faker::Lorem.sentence }
    mc_alpha { 5.times.map { Random.rand(11) }.join }
    mc_beta { 5.times.map { Random.rand(11) }.join }
    redirect ""
    redirect_message { Faker::Lorem.sentence }
    color_scheme "blue"
    published true
    rules { Rack::Test::UploadedFile.new(Rails.root.to_s + '/spec/mocks/rules.txt', 'text') }
  end
end
