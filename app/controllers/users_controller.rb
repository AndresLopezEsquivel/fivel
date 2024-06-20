class UsersController < ApplicationController
  before_action :set_user_language, only: [:edit_language, :update_language, :destroy_language]

  def profile
    @user_languages = UserLanguage.where(user: current_user)
    @user_skills = UserSkill.where(user: current_user)
    @user_educations = UserEducation.where(user: current_user)
    @user_certifications = UserCertification.where(user: current_user)
  end

  def new_language
    @user_language = UserLanguage.new
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

  def edit_language
  end

  def update_language
    if @user_language.update(language_params)
      redirect_to profile_path, notice: 'Language was successfully updated.'
    else
      render :edit_language
    end
  end

  def destroy_language
    @user_language.destroy
    redirect_to profile_path, notice: 'Language was successfully deleted.'
  end

  def new_skill
    @user_skill = UserSkill.new
  end

  def new_education
    @user_education = UserEducation.new
  end

  def new_certification
    @user_certification = UserCertification.new
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

  def create_education
    @user_education = UserEducation.new(education_params)
    @user_education.user = current_user
    if @user_education.save!
      redirect_to profile_path, notice: "Education created succesfully"
    else
      render :new_education, status: :unprocessable_entity
    end
  end

  def create_certification
    @user_certification = UserCertification.new(certification_params)
    @user_certification.user = current_user
    if @user_certification.save!
      redirect_to profile_path, notice: "Certification created succesfully"
    else
      render :new_certification, status: :unprocessable_entity
    end
  end

  private

  def set_user_language
    @user_language = UserLanguage.find(params[:language_id])
  end

  def language_params
    params.require(:user_language).permit(:language, :level)
  end

  def skill_params
    params.require(:user_skill).permit(:skill, :level)
  end

  def education_params
    params.require(:user_education).permit(:country, :college, :title, :major, :year)
  end

  def certification_params
    params.require(:user_certification).permit(:certification, :company, :year)
  end
end
