class Admin::AdministratorController < AdminController
  def create
    @user = User.find(params[:user_id])
    @user.admin!
    redirect_to admin_user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.approved!
    redirect_to admin_user_path(@user)
  end
end
