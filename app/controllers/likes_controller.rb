class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture

  def create
    current_user.likes.create!(picture: @picture)

    render turbo_stream: turbo_stream.replace(
      'like-button',
      partial: 'likes/like_button',
      locals: { picture: @picture, like: true },
    )
  end

  def destroy
    like = current_user.likes.find_by!(picture_id: @picture.id)
    like.destroy!

    render turbo_stream: turbo_stream.replace(
      'like-button',
      partial: 'likes/like_button',
      locals: { picture: @picture, like: false },
    )
  end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end