class ApplicationController < ActionController::Base
    
  before_filter :set_locale
		
	def set_locale
    	I18n.locale = params[:locale] || I18n.default_locale
	end

	protect_from_forgery

  def self.default_url_options(options={})
  	logger.debug "default_url_options is passed options: #{options.inspect}\n"
  	{ :locale => I18n.locale }
  end

  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_update_path_for(resource)
  session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

end