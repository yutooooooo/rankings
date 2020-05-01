class VotesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @ranking = Ranking.find(params[:ranking_id])
    @items = @ranking.items
  end

  def create
    @item = Item.find(params[:item_id])
    @ranking = @item.ranking
    current_user.vote(@item)
    flash[:success] = '投票しました'
    redirect_to @ranking
  end

  def edit
  end

  def update
  end
  
  
end
