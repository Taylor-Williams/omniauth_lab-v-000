class SessionsController < ApplicationController

  def create
    u_hash = request.env['omniauth.auth']
    if user = User.find_by(email: u_hash['info']['email'])
      @user = user
    else
      @user = User.new(email: u_hash['info']['email'], name: u_hash['info']['name'])
    end
    redirect_to root_path
  end

end
