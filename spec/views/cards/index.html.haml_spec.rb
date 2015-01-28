require 'rails_helper'

RSpec.describe "cards/index", :type => :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        :question => "hello",
        :answer => "nope",
        :citation => "blah.com"
      ),
      Card.create!(
        :question => "hello",
        :answer => "nope",
        :citation => "blah.com"
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", :text => "hello".to_s, :count => 2
    assert_select "tr>td", :text => "nope".to_s, :count => 2
    assert_select "tr>td", :text => "blah.com".to_s, :count => 2
  end
end
