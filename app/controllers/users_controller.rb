class UsersController < ApplicationController
  def profile
    @user_languages = UserLanguage.where(user: current_user)
    @user_skills = UserSkill.where(user: current_user)
  end

  def new_language
    @user_language = UserLanguage.new
  end

  def new_skill
    @user_skill = UserSkill.new
  end

  def create_language
    @user_language = UserLanguage.new(language_params)
    @user_language.user = current_user
    if @user_language.save!
      redirect_to profile_path, notice: "Language added succesfully"
    else
      render :new_language, status: :unprocessable_entity
    end
  end

  def create_skill
    @user_skill = UserSkill.new(skill_params)
    @user_skill.user = current_user
    if @user_skill.save!
      redirect_to profile_path, notice: "Skill added succesfully"
    else
      render :new_skill, status: :unprocessable_entity
    end
  end

  private

  def language_params
    params.require(:user_language).permit(:language, :level)
  end

  def skill_params
    params.require(:user_skill).permit(:skill, :level)
  end
end
