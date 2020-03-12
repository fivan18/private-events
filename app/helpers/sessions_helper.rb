module SessionsHelper
  def login_user(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def logout
    current_user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    redirect_to signin_path
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      user if user&.authenticated?(cookies[:remember_token])
    end
  end
end
