class SessionsController < ApplicationController
  
  skip_before_filter :authenticate, :only => [:new, :create, :failure]

  
  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      @user = User.find(session[:user_id]).add_provider(auth_hash)
   
      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up
      if auth = Authorization.find_by_auth_hash(auth_hash)
   
        # Create the session
        @user = auth.user
        session[:user_id] = @user.id
     
        render :text => "Welcome #{@user.full_name}!"
      else
        @user = User.new
        render :text => "An account already exists for you, please log in to add new authentication providers."
      end
    end
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

  def failure
    render :text => "Sorry, but you didn't allow access for our app!"
  end
end
