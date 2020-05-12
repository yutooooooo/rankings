class VotesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_vote, only: [:edit, :update]
  before_action :correct_vote, only: [:edit, :update]

  
  def new
    @vote = current_user.votes.build
    @ranking = Ranking.find(params[:ranking_id])
    @items = @ranking.items
  end

  def create
    @vote = current_user.votes.build(item_id: params[:item_id], comment: params[:vote][:comment])

    if @vote.save
      flash[:success] = '投票しました'
      @item = Item.find(params[:item_id])
      @ranking = @item.ranking
      redirect_to @ranking
    else 
      flash[:danger] = '投票に失敗しました'
      @ranking = Ranking.find(params[:ranking_id])
      @items = @ranking.items
      render :new
    end
  end

  def edit
    @ranking = Item.find(@vote.item_id).ranking
    @items = @ranking.items
  end

  def update
    if @vote.update(item_id: params[:item_id], comment: params[:vote][:comment])
      flash[:success] = '投票しました'
      @item = Item.find(params[:item_id])
      @ranking = @item.ranking
      redirect_to @ranking
    else 
      flash[:danger] = '投票に失敗しました'
      @ranking = Ranking.find(params[:ranking_id])
      @items = @ranking.items
      render :new
    end
  end
  
  
  private
  
  def vote_params
    params.require(:vote).permit(:comment)
  end
  
  def set_vote
    @vote = Vote.find(params[:id])
  end 
  
  def correct_vote
    unless current_user == @vote.user
      redirect_to root_url
    end
  end
end
