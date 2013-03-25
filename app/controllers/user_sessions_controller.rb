# encoding: utf-8
class UserSessionsController < ApplicationController
	before_filter :require_user,  :only => :destroy
	before_filter :require_no_user,  :only => [:new, :create]

	def new
	  @user_session = UserSession.new
	end

	def create
	  @user_session = UserSession.new(params[:user_session])
	  if @user_session.save
	    flash[:notice] = "Login successful!"
	    #redirect_to "/users/show/#{@current_user.id}"
	    redirect_back_or_default account_url(@current_user)
	  else
	    render :status => 401, :nothing => true
	  end
	end

	def destroy
	  current_user_session.destroy
	  flash[:notice] = "Logout successful!"
	  redirect_back_or_default "/"
	end

	private
	  def current_user_session
	    return @current_user_session if defined?(@current_user_session)
	    @current_user_session = UserSession.find
	  end

	  def current_user
	    return @current_user if defined?(@current_user)
	    @current_user = current_user_session && current_user_session.user
	  end

	  def require_user
	    unless current_user
	      store_location
	      redirect_to "/"
	      return false
	    end
	  end

	  def require_no_user
	    if current_user
	      store_location
	      redirect_to "/"
	      return false
	    end
	  end

	  def store_location
	    session[:return_to] = request.request_uri
	  end

	  def redirect_back_or_default(default)
	    redirect_to(session[:return_to] || default)
	    session[:return_to] = nil
	  end
end
