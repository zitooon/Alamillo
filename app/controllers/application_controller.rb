# encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
    
  before_filter :set_locale 
  before_filter :choose_site
  before_filter :log_invitation_info
  before_filter :is_logged

  private

  def choose_site
    unless Rails.env.development?
      if params[:referer] and params[:referer] == 'las7encinas'
        cookies[:site] = { :value => 'www.elalamillo.com', :expires => 6.hours.from_now }     
      end
      redirect_to select_site_path if !cookies[:site] or cookies[:site] == 'www.las7encinas.com'
    end
  end
  
  def is_logged
    redirect_to login_path unless logged?
  end

  def log_invitation_info
    if logged?
      invitation = Invitation.find(session[:invitation_id])
      invitation.nb_pages_seen += 1
      invitation.save
    end
  end
 
  def set_locale
    # Try to get the locale from the parameters, from the session, and then from the navigator
    if params[:locale]
      I18n.locale = params[:locale]
    elsif session[:locale]
      I18n.locale = session[:locale]
    else
      I18n.locale = extract_locale_from_accept_language_header
    end
    session[:locale] = I18n.locale
  end
 
  private 
 
  def extract_locale_from_accept_language_header 
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first 
  end 

  protected
  def logged?
    session[:logged]
  end

  def loggin
    session[:logged] ||= true
    session[:invitation_id] = @invitation.id
    session[:admin] = @invitation.is_admin?
  end

  def logout
    session[:logged] = nil
    session[:invitation_id] = nil
    session[:admin] = nil
    redirect_to introduction_path
  end

end