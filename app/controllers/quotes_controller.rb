class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit

  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      flash[:notice] = "Youre created succesfully a new Quote!!"
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

    @quote = Quote.find(params[:id])

  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    flash[:notice] = "Quote is succesfully deleted!"
    redirect_to quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:quote, :source)
  end



end
