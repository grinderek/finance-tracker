class FriendsController < ApplicationController

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/result_friends'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "There is not such user"
          format.js { render partial: 'users/result_friends'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Enter name or email to search"
        format.js { render partial: 'users/result_friends'}
      end
    end
  end

end