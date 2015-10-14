class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    @talks = Talk.all

  end

  def adminpg
    if params[:password] == "hunjun"
      redirect_to '/admin'

    else

      redirect_to '/wrong'

    end
  end

end
