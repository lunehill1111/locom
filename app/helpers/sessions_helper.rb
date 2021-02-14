module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end
  
  def current_room
    @current_room ||= Room.find_by(id: session[:room_id])
  end

  def logged_in?
    !!current_user
  end
  
  def room_selected
    !!current_room
    
  end
  
end
