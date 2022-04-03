class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_museum

  def create
    current_user.follows.create!(museum: @museum)

    render turbo_stream: turbo_stream.replace(
      'follow-button',
      partial: 'follows/follow_button',
      locals: { museum: @museum, follow: true },
    )
  end

  def destroy
    follow = current_user.follows.find_by!(museum_id: @museum.id)
    follow.destroy!

    render turbo_stream: turbo_stream.replace(
      'follow-button',
      partial: 'follows/follow_button',
      locals: { museum: @museum, follow: false },
    )
  end

  private

  def set_museum
    @museum = Museum.find(params[:museum_id])
  end
end