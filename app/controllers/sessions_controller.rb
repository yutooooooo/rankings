class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = [:session][:password]
    
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    seccion[:iser_id] = nil
    flash[:success] ='ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def login(emial, password)
    @useer = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
