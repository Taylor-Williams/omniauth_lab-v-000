class SessionsController < ApplicationController

  def create
    @auth = request.env['omniauth.auth']
    if user = User.find_by(uid: @auth['uid'])
      @user = user
    else
      @user = User.create(email: @auth['info']['email'], name: @auth['info']['name'], uid: @auth['uid'])
    end
    session[:user_id] = @user.id
    render :create
  end

end
