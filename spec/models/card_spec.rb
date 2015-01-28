require 'rails_helper'

RSpec.describe Card, :type => :model do
  it 'validates presence of question' do
    card = Fabricate.build(:card, question: nil)
    card.valid?
    expect(card.errors.messages[:question]).to include "can't be blank"
  end
  it 'validates presence of answer' do
    card = Fabricate.build(:card, answer: nil)
    card.valid?
    expect(card.errors.messages[:answer]).to include "can't be blank"
  end
end
