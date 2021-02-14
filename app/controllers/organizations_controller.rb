class OrganizationsController < ApplicationController
  def index
    @organizations = Organizations.joins(:accounts).where(user_id: session[:user_id])
  end

  def show
  end

  def new
    @user = User.find(current_user.id)
    @organization = Organization.new()

  end

  def create
    @user = User.find(current_user.id)
    @organization = Organization.new(organization_params)
    

    if @organization.save
      flash[:success] = '組織を登録しました。'
      @account = Account.new(user_id: @user.id, organization_id: @organization.id, administratible: true)
      @account.save
      redirect_to login_url
    else
      flash.now[:danger] = '組織の登録に失敗しました。'
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  def search
    if params[:name].present?
      @organizations = Organization.where('name LIKE ?', "%#{params[:name]}%")
    else
      @organizations = Organization.none
    end
  end
  
  def searchtonew
    session[:user_id]=params[:id]
    logger.debug(params[:user_id].to_yaml)
    redirect_to new_organization_url    
  end
  
  
  private

  def organization_params
    params.require(:organization).permit(:name, :segment_name, :prefecture, :city, :place, :building)
  end
end
