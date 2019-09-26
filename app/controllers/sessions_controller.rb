class SessionsController <ApplicationController

  def new

  end
  def create
    user = User.find_by(email: params[:session][:email.downcase])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id    #it is used to check session id and stor in cookies
      flash[:success] = "U have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger]="Given details do not match.Please check ur details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "U have successfully logged out"
    redirect_to root_path
  end
end
