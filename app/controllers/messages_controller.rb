class MessagesController < ApplicationController
  def index
    @messages = Message.order(id: :desc).page(params[:page]).per(3)
  end

  def show
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def destroy
  end
end
