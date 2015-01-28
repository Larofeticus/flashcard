require 'rails_helper'

RSpec.describe "cards/edit", :type => :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :question => "Faker::Lorem.sentence",
      :answer => "Faker::Lorem.sentence",
      :citation => ""
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_question[name=?]", "card[question]"
      assert_select "input#card_answer[name=?]", "card[answer]"
      assert_select "input#card_citation[name=?]", "card[citation]"
    end
  end
end
