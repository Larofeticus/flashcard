require 'rails_helper'

RSpec.describe "cards/new", :type => :view do
  before(:each) do
    assign(:card, Card.new(
      :question => "",
      :answer => "",
      :citation => ""
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "input#card_question[name=?]", "card[question]"

      assert_select "input#card_answer[name=?]", "card[answer]"

      assert_select "input#card_citation[name=?]", "card[citation]"
    end
  end
end
