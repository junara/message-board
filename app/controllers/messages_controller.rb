class MessagesController < ApplicationController

before_action :set_message , only: [:edit, :update, :destroy]

  def index
    @message = Message.new #create時に使う入れ物を用意している。
    # Messageを全て取得する。
    #複数形には意味があるのか？
    @messages = Message.all #viewで使うmessagesテーブルの内容を全て入れておく。
    # @messages = Message.find(4) #viewで使うmessagesテーブルの内容を全て入れておく。
    
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

  def edit
  end
  
  def show
      @message = Message.find(params[:id]) #URLから直接paramsを読んでいる。
      render 'show'
  end
  
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end
