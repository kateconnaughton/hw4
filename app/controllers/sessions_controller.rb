class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"]})
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        redirect_to "/posts"
      else
        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end
end
        
     