class RankingsController < ApplicationController
  before_action :set_ranking, only: [:show, :edit, :update, :destroy ]
  
  def index
    @rankings = Ranking.all
  end

  def show
  end

  def new
    @ranking = Ranking.new
    
    @item = @ranking.items.build
  end

  def create
    @ranking = Ranking.new(ranking_params)
    
    if @ranking.save
      flash[:success] = 'ランキングを登録しました。'
      redirect_to @ranking
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  
  end

  def edit
  end

  def update
    if @ranking.update(ranking_params)
      flash[:success] = 'ランキングを登録しました。'
      redirect_to @ranking
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @ranking.destroy
    
    flash[:success] = 'User は正常に削除されました'
    redirect_to root_url
  end
  
  private
  
  def set_ranking
    @ranking = Ranking.find([:id])
  end
  
  def company_params
    params.require(:ranking).permit(:title, item_attributes:
      [
        :item
          ]
    )
  end
end
