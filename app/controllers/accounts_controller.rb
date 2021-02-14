class AccountsController < ApplicationController
  def index
  end

  def show
     @account = Account.find(session[:account_id])
     
     
  end

  def new
    @account = Account.new()
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = 'アカウント登録に成功しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'アカウント登録に失敗しました。'
      render :new
    end    
  end

  def edit
    
  end

  def update
  end

  def destroy
  end
  
  def search
    if params[:name].present?
      @accounts = Account.joins(:organization).where('name LIKE ?', "%#{params[:name]}%")
    else
      @accounts = Account.none
    end
    render :communicator
  end
  
  def communicator
    if params[:name].present?
      @accounts = Account.joins(:organization).where('name LIKE ?', "%#{params[:name]}%")
    else
      @accounts = Account.none  
    end
  end
  
  def reject
    account = Account.find(params[:requested_id])
    current_account.rejectto(account)
    flash[:success] = 'つながりを却下しました'
  end
  
  def accept
    account = Account.find(params[:requested_id])
    current_account.unrequestto(account)
    flash[:success] = '新しいつながりができました'
    @room = Room.new()
    @room.save
  end
  
  private

  def account_params
    params.require(:account).permit(:user_id, :organization_id, :administratible)
  end
end