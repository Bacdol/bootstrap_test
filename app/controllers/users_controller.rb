# encoding: utf-8
class UsersController < ApplicationController
	before_filter :require_user,  :only => [:show, :edit, :update]
  before_filter :require_no_user, :only => [:reset_pwd, :create]
  
    def index
      @users = User.all(:limit => 20)
      respond_to do |f| 
        f.html {}
        f.json {render :json => @users }
      end
    end

    def new
      @user = User.new
      @user.status = Status.find(:first, :conditions => {:name => "Validé"})
    end

    def create
      @user = User.new(params[:user])

      # Saving without session maintenance to skip
      # auto-login which can't happen here because
      # the User has not yet been activated
      if !@user.has_existing_email?
        if @user.save
          UserMailer.welcome_email(@user).deliver
          render :nothing => true
        else
          render :status => 500
        end
      else
        render :status => 400, :json => @user.errors
      end

    end

    def show
      @user = current_user
      juser = {"resultat" => {"status" => "connected"}, "current_user" => [@user]}
      respond_to do |format|
        format.html {render :layout => true}
        format.json {render :json => juser}
      end 
    end

    def edit
      @user = current_user
    end

    def subscribe_step_2
      @user = current_user # makes our views "cleaner" and more consistent
      @user.attributes = params[:user]
      @user.password = params[:password] if !params[:password].blank? and params[:password] == params[:password_confirmation]
      @user.password = params[:password_confirmation] if !params[:password_confirmation].blank? and params[:password] == params[:password_confirmation]
      @user.birthday = DateTime.new(params[:birth_year].to_i, params[:birth_month].to_i, params[:birth_day].to_i) if !params[:birth_year].blank? && !params[:birth_month].blank? && !params[:birth_day].blank?
      if @user.valid?
        if @user.save
          if request.xhr?
            render :nothing => true
          else
            redirect_to :back
          end
        else
          render :status => 500
        end
      else
        render :status => 400, :json => @user.errors
      end
    end

    def update
      @user = current_user # makes our views "cleaner" and more consistent
      @user.attributes = params[:user]
      @user.password = params[:password] if !params[:password].blank? and params[:password] == params[:password_confirmation]
      @user.password = params[:password_confirmation] if !params[:password_confirmation].blank? and params[:password] == params[:password_confirmation]
      @user.birthday = DateTime.new(params[:birth_year].to_i, params[:birth_month].to_i, params[:birth_day].to_i) if !params[:birth_year].blank? && !params[:birth_month].blank? && !params[:birth_day].blank?
      if @user.valid?
        if @user.save
          redirect_to @user
        else
          redirect_to edit_user_path(@user)
        end
      else
        render :status => 400, :json => @user.errors
      end
    end

  def reset_pwd
    user = User.find_by_email params[:email]

    if user
      new_pwd = Array.new(8/2) { rand(256) }.pack('C*').unpack('H*').first

      #if Rails.env.production?
        if UserMailer.resetpwd_email(user, new_pwd).deliver
          user.password = new_pwd
          user.password_confirmation = new_pwd
          if user.save
            UserSession.find.destroy
            render :nothing => true
          else
            render :status => 500, :text => "Problem during operation"
          end
        else
          render :status => 400, :text => "Password couldn't be sent to your email address"
        end
      #end
    else
      render :status => 400, :text => "Password doesn't exist"
    end
  end
end
