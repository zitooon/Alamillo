# encoding: utf-8
class LoginController < ApplicationController

  skip_before_filter :is_logged, :choose_site
  
  def show
    redirect_to introduction_path if logged?
  end

  def create
    if !params[:code].empty?
      @invitation = Invitation.find(:first, :conditions => {:code => params[:code]})
      if @invitation
        if !@invitation.is_admin? and @invitation.expires_at < Time.now
          flash[:error] = t(:expired_code)
        else
          @invitation.nb_connections += 1
          @invitation.save
          loggin
          redirect_to introduction_path
        end
      else
        flash[:error] = t(:bad_code)
      end
    else
      flash[:error] = t(:no_code)
    end
    redirect_to login_path(:code => params[:code]) if flash[:error]
  end

  def destroy
    logout
  end
  
  def select_site
    if params[:site]
      cookies[:site] = { :value => params[:site], :expires => 6.hours.from_now }     
      redirect_to 'http://'+cookies[:site]
    else
      render :action => :select_site, :layout => 'select_site'
    end
  end

end
