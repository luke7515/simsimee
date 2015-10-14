class LearnController < ApplicationController
  def index
    @talks = Talk.all
  end
  def create
    Talk.create(ask: params[:ask], answer: params[:answer])

    redirect_to :root
  end
  
  def destroy 
    Talk.find(params[:ip]).destroy
    redirect_to '/admin'
  end
  def edit
    @temp = Talk.find(params[:ip])
    
  end
  def update
    pp = Talk.find(params[:ip])
    pp.ask = params[:ask]
    pp.answer = params[:answer]
    pp.save
    redirect_to '/admin'
  end

end
