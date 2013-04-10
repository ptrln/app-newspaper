module SessionHelper

  def signed_in?
    !current_user.nil?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login(user)
    user.session_token = SecureRandom.hex(16)
    until user.save
      user.session_token = SecureRandom.hex(16)
    end
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    current_user.session_token = nil
    current_user.save
    session[:session_token] = nil
  end
end
