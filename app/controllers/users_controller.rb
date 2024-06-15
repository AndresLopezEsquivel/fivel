class UsersController < ApplicationController
  def profile
    @user_languages = UserLanguage.where(user: current_user)
  end

  def new_language
    @user_language = UserLanguage.new
  end

  def create_language
    @user_language = UserLanguage.new(language_params)
    @user_language.user = current_user
    if @user_language.save!
      redirect_to profile_path, notice: "Language created succesfully"
    else
      render :new_language, status: :unprocessable_entity
    end
  end

  private

  def language_params
    params.require(:user_language).permit(:language, :level)
  end
end
