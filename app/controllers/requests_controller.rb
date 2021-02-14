class RequestsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    account = Account.find(params[:requested_id])
    current_account.requestto(account)
    flash[:success] = 'つながりをリクエストしました'
    redirect_to accounts_communicator_url
  end
  
  def destroy
    account = Account.find(params[:requested_id])
    current_account.unrequestto(account)
    flash[:success] = 'リクエストを解除しました。'
    redirect_to accounts_communicator_url
  end  
  

  def index
  end

  def show
  end
  

   

end
