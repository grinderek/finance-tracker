class FriendsController < ApplicationController

  def search
    if params[:friend].present?
      @friend = User.check_db(params[:friend])
      if @friend
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