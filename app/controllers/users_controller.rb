class UsersController < ApplicationController

  def index  
  end

  def create
    @user.id = user.new(
      user_id: @current_user.id
    )
  end

  def pay_method_select
  end
end
