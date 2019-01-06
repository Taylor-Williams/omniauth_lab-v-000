class SessionsController < ApplicationController

  def create
    @auth = request.env['omniauth.auth']
    binding.pry
    if user = User.find_by(email: @auth['info']['email'])
      @user = user
    else
      @user = User.create(email: @auth['info']['email'], name: @auth['info']['name'], uid: @auth['uid'])
    end
    session[:user_id] = @user.id
    binding.pry
    render :create
  end

end
