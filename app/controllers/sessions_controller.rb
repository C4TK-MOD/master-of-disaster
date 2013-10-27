class SessionsController < ApplicationController
  
  skip_before_filter :authenticate, :only => [:new, :create, :failure]

  
  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      @user = User.find(session[:user_id])
      @user.add_provider(auth_hash)

      if !@user.valid?
        redirect_to edit_user_path @user
      else
        render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
      end

    elsif auth = Authorization.find_or_create(auth_hash)
   
      # Create the session
      @user = auth.user
      session[:user_id] = @user.id
      
      if @user.finish_setup? || !@user.valid?
        redirect_to edit_user_path @user
      else
        render :text => "Welcome #{@user.full_name}!"
      end

    else
      render :text => "An account already exists for you, please log in to add new authentication providers."
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
