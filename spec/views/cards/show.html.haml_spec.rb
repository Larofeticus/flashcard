require 'rails_helper'

RSpec.describe "cards/show", :type => :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :question => "Faker::Lorem.sentence",
      :answer => "Faker::Lorem.sentence",
      :citation => "Faker::Internet.url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@card.question}/)
    expect(rendered).to match(/#{@card.answer}/)
    expect(rendered).to match(/#{@card.citation}/)
  end
end
