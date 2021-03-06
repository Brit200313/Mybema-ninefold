# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string(255)
#  section_id :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :article do
    body { Faker::Lorem.sentence(20) }
    title { Faker::Lorem.sentence(4) }
    section
  end
end
