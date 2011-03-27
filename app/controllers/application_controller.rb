# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
private
  def unauth(str)
    logger.info "UNAUTH: " + str
    return head(:unauthorized, :reason => str)
  end

  def check_auth_token
    if (not params[:auth_token].blank? and not params[:id].blank?)
      @signup = Signup.find_by_id(params[:id])
      if (@signup != nil and not @signup.auth_token.blank? and @signup.auth_token == params[:auth_token])
        @auth_global = false
        return true
      end
    end
    false
  end
  
  def check_magic_key
    logger.info "CHECK MAGIC KEY"
    if (not params[:magic_key].blank?)
      magic = params[:magic_key]
    elsif (not session[:magic_key].blank?)
      magic = session[:magic_key]
    else
      magic = nil
    end
    if (not ENV['MAGIC_KEY'].blank? and not magic.blank? and magic == ENV['MAGIC_KEY'])
      session[:magic_key] = magic
      @auth_global = true
      return true
    end
    false
  end

  def require_auth_token
    if (check_auth_token)
      return
    end
    return unauth('Invalid parameter: auth_token mismatch')
  end

  def require_magic_key
    if (check_magic_key)
      return
    end
    return unauth('Invalid parameter: bad key')
  end

  def require_magic_key_or_auth_token
    if (check_magic_key)
      return
    end
    if (check_auth_token)
      return
    end
    return unauth('Invalid parameter: bad auth')
  end

  def require_noauth
    # We don't require auth with this filter, but we do want to set @auth_global
    check_magic_key
  end
end
