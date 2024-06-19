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

  private

  def language_params
    params.require(:user_language).permit(:language, :level)
  end

  def education_params
    params.require(:user_education).permit(:degree, :school, :graduation_year)
  end

  def certification_params
    params.require(:user_certification).permit(:name, :year)
  end
end
