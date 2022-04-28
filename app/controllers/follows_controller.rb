class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_museum

  def create
    current_user.follows.create!(museum: @museum)

    render turbo_stream: turbo_stream.replace(
      params[:html_id],
      partial: 'follows/follow_button',
      locals: { museum: @museum, html_id: params[:html_id] },
    )
  end

  def destroy
    follow = current_user.follows.find_by!(museum_id: @museum.id)
    follow.destroy!

    render turbo_stream: turbo_stream.replace(
      params[:html_id],
      partial: 'follows/follow_button',
      locals: { museum: @museum, html_id: params[:html_id] },
    )
  end

  private

  def set_museum
    @museum = Museum.find(params[:museum_id])
  end
end