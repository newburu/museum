class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture

  def create
    current_user.likes.create!(picture: @picture)

    render turbo_stream: turbo_stream.replace(
      params[:html_id],
      partial: 'likes/like_button',
      locals: { picture: @picture, html_id: params[:html_id], count_flg: params[:count_flg] },
    )
  end

  def destroy
    like = current_user.likes.find_by!(picture_id: @picture.id)
    like.destroy!

    render turbo_stream: turbo_stream.replace(
      params[:html_id],
      partial: 'likes/like_button',
      locals: { picture: @picture, html_id: params[:html_id], count_flg: params[:count_flg] },
    )
  end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end