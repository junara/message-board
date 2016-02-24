class MessagesController < ApplicationController
  def index
    @message = Message.new #create時に使う入れ物を用意している。
    # Messageを全て取得する。
    #複数形には意味があるのか？
    @messages = Message.all #viewで使うmessagesテーブルの内容を全て入れておく。
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージ保存しました。'
    else
      #メッセージのvalidationでエラーが出たとき
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end
