class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new()
  end
  
  def register
    @user = User.new(user_params)
    
    if @user.email and @user.password_digest
      

    else
      flash.now[:danger] = 'もう一度確認してください'
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    @organization = Organization.new(name: @user.name, segment_name: "個人", prefecture: @user.prefecture, city: @user.city, place: @user.place, building: @user.building)

    if @user.save and @organization.save
      flash[:success] = 'ユーザを登録しました。'
      @account = Account.create(user_id: @user.id, organization_id: @organization.id, administratible: true)
      session[:user_id] = @user.id      
  
      redirect_to search_organizations_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @edit = User.find(params[:id])
    @name = @edit.name
    @email = @edit.email
    @password = @edit.password_digest
    @prefecture = @edit.prefecture
    @city = @edit.city
    @place = @edit.place
    @building = @edit.building
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザー は正常に更新されました'
      render :edit
    else
      flash.now[:danger] = 'ユーザー は更新されませんでした'
      render :edit
    end
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:password_digest, :prefecture, :city, :place, :building)
  end
  
end
