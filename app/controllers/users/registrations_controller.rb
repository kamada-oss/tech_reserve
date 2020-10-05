class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to categories_index_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation
      )
    end
end
