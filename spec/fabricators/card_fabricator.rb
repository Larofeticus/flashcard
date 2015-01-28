Fabricator(:card) do
  question { Faker::Lorem.sentence }
  answer { Faker::Lorem.sentence }
  citation { Faker::Internet.url }
end
