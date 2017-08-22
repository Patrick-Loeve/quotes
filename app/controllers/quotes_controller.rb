class QuotesController < ApplicationController
  before_action :set_quote, only: [:edit, :update, :show, :destroy]
  before_action :require_login, except: [ :index, :show, :random_quote ]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @quotes = Quote.all.order("created_at DESC")
  end

  def new
    @quote = Quote.new
  end

  def edit

  end

  def create
    @quote = Quote.new(quote_params)
    @quote.user = current_user
    if @quote.save
      flash[:success] = "Youre created succesfully a new Quote!!"
      redirect_to quote_path(@quote)
    else
      render 'new'
    end

  end

  def update

    if @quote.update(quote_params)
      flash[:notice] = "Your Quote is succesfully updated"
      redirect_to quote_path(@quote)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy

    @quote.destroy
    flash[:notice] = "Quote is succesfully deleted!"
    redirect_to quotes_path
  end

  def random_quote
    @quote = Quote.order("RANDOM()").first
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:quote, :source)
  end

  def require_same_user
    if current_user != @quote.user
      flash[:notice] = "you can not edit quotes from other users"
      redirect_to user_path(current_user)
    end
  end


end
