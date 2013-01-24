class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
#  before_filter :admin_user,     only: :destroy

#  # GET /users
#  # GET /users.json
#  def index
#    @users = User.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @users }
#    end
#  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 20)
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
	@question = @user.questions.paginate(page: params[:page], :per_page => 10)

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

#  # GET /users/1/edit
#  def edit
#    @user = User.find(params[:id])
#  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


#  # POST /users
#  # POST /users.json
#  def create
#    @user = User.new(params[:user])
#
#    respond_to do |format|
#      if @user.save
#        format.html { redirect_to @user, notice: 'User was successfully created.' }
#        format.json { render json: @user, status: :created, location: @user }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to SoapBox!"
      redirect_to @user
    else
      render 'new'
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

#  # DELETE /users/1
#  # DELETE /users/1.json
#  def destroy
#    @user = User.find(params[:id])
#    @user.destroy
#
#    respond_to do |format|
#      format.html { redirect_to users_url }
#      format.json { head :no_content }
#    end
#  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def correct_user
      @this_user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@this_user)
    end

#    def admin_user
#      redirect_to(root_path) unless current_user.admin?
#    end

end
