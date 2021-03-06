class UsersController < ApplicationController
require 'plivo_messenger'

 skip_before_filter :authenticate, :only => [:new, :create]
 
 # GET /users
 # GET /users.json
  def index
    unless current_user && current_user.is_admin?
      redirect_to :home
      return
    end

    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def profile
    redirect_to home_path unless current_user 
    @user = current_user
    render action: "show"
  end

  def certifications
    redirect_to home_path unless current_user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    
    @certifications = @user.certifications.all
    @certifications.each do |cert|
      cert.belongs_to_user = true
    end
    if @certifications.length == 0
      @certifications = Certification.all
    else
      @certifications = @certifications.concat(Certification.where('id not in (?)',@certifications))
    end
    respond_to do |format|
      format.html
      format.json { render json: {post_uri: "/users/#{@user.id}/add_certification", certs: (@certifications.map{|p| p.full_display})}.to_json }
    end
  end

  def assets
    redirect_to home_path unless current_user
    @user = current_user

    respond_to do |format|
      format.html
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /users/1/add_certification
  # POST /users.json
  def add_certification
    @user = User.find(params[:id])
    cert = Certification.find_by_id(params[:user][:cert_id])

    respond_to do |format|
      if cert.nil?
        format.html { redirect_to @user, error: 'Invalid certification ID.' }
        format.json { render json: @user, status: :unprocessable_entity }
      elsif !@user.certifications.include?(cert)
        @user.certifications << cert
        PlivoMessenger.send_msg(@user.phone, "You signed up for #{cert.name}!")
        format.html { redirect_to @user, notice: "User was assigned certification #{cert.name}." }
        format.json { head :no_content }
      else
        format.html { redirect_to @user, notice: "User already has certification #{cert.name}." }
        format.json { head :no_content }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
