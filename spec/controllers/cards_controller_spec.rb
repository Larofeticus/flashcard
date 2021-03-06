require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CardsController, :type => :controller do
  before do
    @user = Fabricate(:user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Card. As you add validations to Card, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { question: 'how many', answer: 'too many' } }

  let(:invalid_attributes) { { question: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: @user.id } }
  let(:invalid_session) { { } }

  describe "GET index" do
    it "assigns all cards as @cards" do
      card = Card.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:cards)).to eq([card])
    end
  end

  describe "GET show" do
    it "assigns the requested card as @card" do
      card = Card.create! valid_attributes
      get :show, {:id => card.to_param}, valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe "GET new" do
    it "assigns a new card as @card" do
      get :new, {}, valid_session
      expect(assigns(:card)).to be_a_new(Card)
    end
    it 'redirects to root when not user' do
      get :new, {}, invalid_session
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET edit" do
    it "assigns the requested card as @card" do
      card = Card.create! valid_attributes
      get :edit, {id: card.to_param}, valid_session
      expect(assigns(:card)).to eq(card)
    end
    it 'redirects to root when not user' do
      card = Card.create! valid_attributes
      get :edit, {id: card.to_param}, invalid_session
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, {card: valid_attributes}, valid_session
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, {:card => valid_attributes}, valid_session
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end

      it "redirects to the created card" do
        post :create, {:card => valid_attributes}, valid_session
        expect(response).to redirect_to(Card.last)
      end

      it "does not create from bad user" do
        expect { post :create, { card: valid_attributes }, invalid_session }.to change(Card, :count).by(0)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        post :create, {:card => invalid_attributes}, valid_session
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        post :create, {:card => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { question: 'smell that?' } }

      it "updates the requested card" do
        card = Card.create! valid_attributes
        put :update, {id: card.to_param, card: new_attributes}, valid_session
        card.reload
        expect(card.question).to eq new_attributes[:question]
      end

      it "assigns the requested card as @card" do
        card = Card.create! valid_attributes
        put :update, {id: card.to_param, card: valid_attributes}, valid_session
        expect(assigns(:card)).to eq(card)
      end

      it "redirects to the card" do
        card = Card.create! valid_attributes
        put :update, {id: card.to_param, card: valid_attributes}, valid_session
        expect(response).to redirect_to(card)
      end

      it "does not update from bad user" do
        card = Card.create! valid_attributes
        put :update, { id: card.to_param, card: new_attributes }, invalid_session
        card.reload
        expect(card.question).to eq valid_attributes[:question]
      end
    end

    describe "with invalid params" do
      it "assigns the card as @card" do
        card = Card.create! valid_attributes
        put :update, {:id => card.to_param, :card => invalid_attributes}, valid_session
        expect(assigns(:card)).to eq(card)
      end

      it "re-renders the 'edit' template" do
        card = Card.create! valid_attributes
        put :update, {:id => card.to_param, :card => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested card" do
      card = Card.create! valid_attributes
      expect {
        delete :destroy, {:id => card.to_param}, valid_session
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = Card.create! valid_attributes
      delete :destroy, {:id => card.to_param}, valid_session
      expect(response).to redirect_to(cards_url)
    end

    it 'does not destroy for bad user' do
      card = Card.create! valid_attributes
      expect { delete :destroy, {id: card.to_param}, invalid_session}.to change(Card, :count).by(0)
    end
    it 'redirects to root for bad user' do
      card = Card.create! valid_attributes
      delete :destroy, {id: card.to_param}, invalid_session
      expect(response).to redirect_to(root_path)
    end
  end

end
