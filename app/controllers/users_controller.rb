class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was successfully created"}
      else
        format.html { render 'users/new' }
      end
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{ redirect_to user_path(@user), notice: "User was successfully updated" }
      else
        format.html{ render 'users/edit'}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html{ redirect_to users_path, notice: "User was successfully deleted" }
      else
        format.html{ redirect_to users_path}
      end
    end

  end

end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :cellphone)
end

def set_user
  @user = User.find(params[:id])

end