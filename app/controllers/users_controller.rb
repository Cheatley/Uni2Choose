class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  #breadcrumbs
  add_crumb "Home", '/'
  
  #user's individual My profile page
  def show
    #breadcrumbs
    add_crumb "My Profile", user_path, links: false
    @user = current_user
        #breadcrumbs
    add_crumb "My Profile", user_path
    add_crumb "My Saved Searches", save_search_path, links: false
    @showsearches = Search.all.where(users_id: current_user)
  end
  
  #user's saved searches page
  def save_search
    #breadcrumbs
    add_crumb "My Profile", user_path
    add_crumb "My Saved Searches", save_search_path, links: false
    @showsearches = Search.all.where(users_id: current_user)
  end
  
  #user's edit my personal details
  def edit
    authorize! :update, @user
  end
  #user's edit my personal details
  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #delete a user functionality, admin can delete users through their access to the admin dashboard
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
  #devise to access the right user
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :dob, :postcode, :gender, :id ] 
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end