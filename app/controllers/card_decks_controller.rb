class CardDecksController < ApplicationController
  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    @card_decks = current_user.card_decks
  end

  # GET /card_decks/1
  # GET /card_decks/1.json
  def show
    @card_deck = CardDeck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card_deck }
    end
  end

  # GET /card_decks/new
  # GET /card_decks/new.json
  def new
    @card_deck = CardDeck.new()
    @category = Category.find_by_index('$bucket','_').first
    @card_deck.category_key = @category.key
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card_deck }
    end
  end

  # GET /card_decks/1/edit
  def edit
    @categories = Category.select_options 
    @card_deck = CardDeck.find(params[:id])
  end

  # POST /card_decks
  # POST /card_decks.json
  def create
    logger.info params[:card_deck]
    @card_deck = CardDeck.new(params[:card_deck].merge({:user_key => session[:current_user]}))

    respond_to do |format|
      if @card_deck.save!
        format.html { redirect_to @card_deck, notice: 'Card deck was successfully created.' }
        format.json { render json: @card_deck, status: :created, location: @card_deck }
      else
        format.html { render action: "new" }
        format.json { render json: @card_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /card_decks/1
  # PUT /card_decks/1.json
  def update
    @card_deck = CardDeck.find(params[:id])

    respond_to do |format|
      if @card_deck.update_attributes(params[:card_deck])
        format.html { redirect_to @card_deck, notice: 'Card deck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_decks/1
  # DELETE /card_decks/1.json
  def destroy
    @card_deck = CardDeck.find(params[:id])
    @card_deck.destroy

    respond_to do |format|
      format.html { redirect_to card_decks_url }
      format.json { head :no_content }
    end
  end
end
