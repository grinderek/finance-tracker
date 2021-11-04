class FriendsController < ApplicationController

  def search
    if params[:friend].present?
      @friend = User.check_db(params[:friend])
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/result_friends'}
        end
      end
    end
  end

end