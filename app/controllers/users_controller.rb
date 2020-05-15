class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :creatings]
  before_action :require_user_logged_in, only: [:edit, :update, :show, :creatings]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    rankings = Ranking.find(@user.votes.order(created_at: :desc).includes(:item).pluck(:ranking_id))
    @rankings = Kaminari.paginate_array(rankings).page(params[:page]).per(18)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :edit
    end
    
  end

  def creatings
    @created_rankings = @user.rankings.order(created_at: :desc).page(params[:page]).per(18)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    unless current_user == @user
      redirect_to root_url
    end
  end

end
