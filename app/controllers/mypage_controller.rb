class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def comment_index
    @comments = @user.comments
  end

  def edit_profile
  end

  def update_profile
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to comment_index_mypage_path, notice: 'プロフィールを更新しました'
    else
      if @user.password.empty? && @user.errors.exclude?(:image) &&
         @user.errors.exclude?(:nickname) && @user.errors.exclude?(:introduction) &&
         @user.errors.exclude?(:email)
        @user.save(validate: false)
        redirect_to comment_index_mypage_path, notice: 'プロフィールを更新しました'
      else
        render :edit_profile
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :image,
        :nickname,
        :introduction,
        :email,
        :password,
        :password_confirmation
      )
    end
end
