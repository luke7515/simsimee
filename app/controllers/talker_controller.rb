class TalkerController < ApplicationController
  def index
    @chats = Chat.all
    @talks = Talk.all
    tt = Chat.where(chat_content: params[:keyword]).sample
    if tt != nil
      @tempask = tt.chat_content
      @tempid = tt.id
    else
      @tempask = nil
      @tempid = nil
    end
  end
  def create
    if Talk.exists?(:ask => params[:ask])
      talk = Talk.where(ask: params[:ask]).sample

      Chat.create(chat_content: talk.ask, chat_type: "user")
      Chat.create(chat_content: talk.answer, chat_type: "cpu")

      redirect_to :root
    else
      redirect_to "/learn"
    end
  end

  def wrong
    @temp = 'Wrong PassWord'
  end
end
