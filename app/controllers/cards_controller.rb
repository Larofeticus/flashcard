class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all.paginate(page: params[:page], per_page: 50)
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end
  
  # GET /cards/random
  def random
    @card = Card.find(Card.all.pluck(:id).sample)
  end

  # GET /cards/new
  def new
    if current_user
      @card = Card.new
    else
      redirect_to root_path, warning: 'Not for you.'
    end
  end

  # GET /cards/1/edit
  def edit
    if current_user
      @card = Card.find(params[:id])
    else
      @card = nil
      redirect_to root_path, warning: 'Not for you.'
    end
  end

  # POST /cards
  # POST /cards.json
  def create
    if current_user
      @card = Card.new(card_params)

      respond_to do |format|
        if @card.save
          format.html do
            flash[:success] = 'Card was successfully created.' 
            redirect_to new_card_path            
          end
          format.json { render :show, status: :created, location: @card }
        else
          format.html { render :new }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, warning: 'Not for you.'
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    if current_user
      respond_to do |format|
        if @card.update(card_params)
          format.html { redirect_to @card, notice: 'Card was successfully updated.' }
          format.json { render :show, status: :ok, location: @card }
        else
          format.html { render :edit }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, warning: 'Not for you.'
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    if current_user
      @card.destroy
      respond_to do |format|
        format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, warning: 'Not for you.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:question, :answer, :citation)
    end
end
