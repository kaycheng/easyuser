class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        redirect_to '/login'
    end
  end

  def destroy
    session.destroy
    redirect_to '/login'
  end
end