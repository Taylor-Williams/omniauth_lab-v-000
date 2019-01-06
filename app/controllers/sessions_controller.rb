class SessionsController < ApplicationController

  def create
    @auth = request.env['omniauth.auth']
    if user = User.find_by(email: @auth['info']['email'])
      @user = user
    else
      @user = User.new(email: @auth['info']['email'], name: @auth['info']['name'], uid: @auth['uid'])
    end
    session[:user_id] = @user.id
    render :create
  end

end
