class UsersController < ApplicationController
  before_action :set_user_language, only: [:edit_language, :update_language, :destroy_language]
  before_action :set_user_skill, only: [:edit_skill, :update_skill, :destroy_skill]
  before_action :set_user_education, only: [:edit_education, :update_education, :destroy_education]
  before_action :set_user_certification, only: [:edit_certification, :update_certification, :destroy_certification]

  def profile
    @user_languages = UserLanguage.where(user: current_user)
    @user_skills = UserSkill.where(user: current_user)
    @user_educations = UserEducation.where(user: current_user)
    @user_certifications = UserCertification.where(user: current_user)
    @user_services = current_user.services
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

  def create_skill
    @user_skill = UserSkill.new(skill_params)
    @user_skill.user = current_user
    if @user_skill.save!
      redirect_to profile_path, notice: "Skill added succesfully"
    else
      render :new_skill, status: :unprocessable_entity
    end
  end

  def edit_skill
  end

  def update_skill
    if @user_skill.update(skill_params)
      redirect_to profile_path, notice: 'Skill was successfully updated.'
    else
      render :edit_skill
    end
  end

  def destroy_skill
    @user_skill.destroy
    redirect_to profile_path, notice: 'Skill was successfully deleted.'
  end

  def new_education
    @user_education = UserEducation.new
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

  def edit_education
  end

  def update_education
    if @user_education.update(education_params)
      redirect_to profile_path, notice: 'Education was successfully updated.'
    else
      render :edit_education
    end
  end

  def destroy_education
    @user_education.destroy
    redirect_to profile_path, notice: 'Education was successfully deleted.'
  end

  def new_certification
    @user_certification = UserCertification.new
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

  def edit_certification
  end

  def update_certification
    if @user_certification.update(certification_params)
      redirect_to profile_path, notice: 'Certification was successfully updated.'
    else
      render :edit_certification
    end
  end

  def destroy_certification
    @user_certification.destroy
    redirect_to profile_path, notice: 'Certification was successfully deleted.'
  end

  def show
    @user = User.find(params[:id])
    @user_languages = UserLanguage.where(user: @user)
    @user_skills = UserSkill.where(user: @user)
    @user_educations = UserEducation.where(user: @user)
    @user_certifications = UserCertification.where(user: @user)
    @user_services = @user.services
  end

  private

  def set_user_language
    @user_language = UserLanguage.find(params[:language_id])
  end

  def language_params
    params.require(:user_language).permit(:language, :level)
  end

  def set_user_skill
    @user_skill = UserSkill.find(params[:skill_id])
  end

  def skill_params
    params.require(:user_skill).permit(:skill, :level)
  end

  def set_user_education
    @user_education = UserEducation.find(params[:education_id])
  end

  def education_params
    params.require(:user_education).permit(:country, :college, :title, :major, :year)
  end

  def set_user_certification
    @user_certification = UserCertification.find(params[:certification_id])
  end

  def certification_params
    params.require(:user_certification).permit(:certification, :company, :year)
  end
end
