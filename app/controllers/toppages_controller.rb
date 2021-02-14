class ToppagesController < ApplicationController
   def index
    if logged_in?
      #@account = current_user.accounts(segment_name: "個人")
      #@room = current_user.build  # form_with 用
      #@rooms = @account.rooms.order(id: :desc).page(params[:page])
    end
   end
end
