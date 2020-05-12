class RankingsController < ApplicationController
  before_action :set_ranking, only: [:show, :edit, :update, :destroy ]
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_ranking, only: [:edit, :update, :destroy]
  
  
  def index
    @rankings = Ranking.all.page(params[:page]).per(18)
  end

  def show
    @votes = Vote.where(item_id: @ranking.items.pluck(:id))
    @users = User.find(@votes.pluck(:user_id))
  end

  def new
    @ranking = Ranking.new
    
    10.times { @ranking.items.build }
  end

  def create
    @ranking = current_user.rankings.build(ranking_params)
    
    if @ranking.save
      flash[:success] = 'ランキングを登録しました。'
      redirect_to root_url
    else
      flash[:danger] = 'ランキングの登録に失敗しました。'
      10.times { @ranking.items.build }
      render :new
    end
  
  end

  def edit
    (10 - @ranking.items.count).times { @ranking.items.build }
  end

  def update
    
    if @ranking.update(ranking_params)
      flash[:success] = 'ランキングを編集しました。'
      redirect_to @ranking
    else
      flash.now[:danger] = 'ランキングの編集に失敗しました。'
      render :edit
    end
  
  end

  def destroy
    @user = @ranking.user
    
    @ranking.destroy
    
    flash[:success] = 'ランキング は正常に削除されました'
    redirect_to user_url(@user)
  end
  
  def search
    if params[:title].present?
      @rankings = Kaminari.paginate_array(Ranking.where('title LIKE ?', "%#{params[:title]}%")).page(params[:page]).per(18)
    else
      @rankings = Ranking.none
    end
  end
  

  
  private
  
  def set_ranking
    @ranking = Ranking.find(params[:id])
  end
  
  def ranking_params
    params.require(:ranking).permit(:title, items_attributes: [:id, :item, :_destroy] )
  end
  
  def correct_ranking
    unless current_user == @ranking.user
      redirect_to root_url
    end
  end
end
