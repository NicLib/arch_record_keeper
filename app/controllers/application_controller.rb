class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  #Refuses view if not logged in
  def refuse_view
      if !current_user
          redirect_to(root_path)
          flash.now[:danger] = 'Must be logged in'
      end
  end
end
