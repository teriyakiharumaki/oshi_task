class OshiProfilesController < ApplicationController
  before_action :require_login
  before_action :set_oshi_profile, only: %i[edit update destroy]

  def new
    @oshi_profile = OshiProfile.new
  end

  def create
    @oshi_profile = current_user.build_oshi_profile(oshi_profile_params)
    if @oshi_profile.save
      AiCommentGenerator.new.generate_and_save_all(@oshi_profile)
      flash[:success] = "推しプロフィールが設定されました！"
      redirect_to mypage_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @oshi_profile.update(oshi_profile_params)
      AiCommentGenerator.new.generate_and_save_all(@oshi_profile)
      flash[:success] = "推しプロフィールが更新されました！"
      redirect_to mypage_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @oshi_profile.destroy
      flash[:success] = "推しプロフィールを削除しました！"
      redirect_to mypage_path
    else
      redirect_to mypage_path
    end
  end

  private

  def set_oshi_profile
    @oshi_profile = current_user.oshi_profile
  end

  def oshi_profile_params
    params.require(:oshi_profile).permit(:name, :personality, :generation, :gender, :pronoun, :avatar, :avatar_cache)
  end
end
