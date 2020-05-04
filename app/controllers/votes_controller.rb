class VotesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @vote = current_user.votes.build
    @ranking = Ranking.find(params[:ranking_id])
    @items = @ranking.items
  end

  def create
    @item = Item.find(params[:item_id])
    @ranking = @item.ranking
    current_user.votes.create!(item_id: @item.id, comment: params[:vote][:comment])
    flash[:success] = '投票しました'
    redirect_to @ranking
  end

  def edit
    @vote = Vote.find(params[:id])
    @ranking = Item.find(@vote.item_id).ranking
    @items = @ranking.items
  end

  def update
    @vote = Vote.find(params[:id])
    @item = Item.find(params[:item_id])
    @ranking = @item.ranking
    @vote.update(item_id: @item.id, comment: params[:vote][:comment])
    flash[:success] = '投票しました'
    redirect_to @ranking
  end
  
  
  private
  
  def vote_params
    params.require(:vote).permit(:comment)
  end
  
end
