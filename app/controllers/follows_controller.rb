class FollowsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    if @user.present?
      current_user.follow!(@user)
      begin
        ModelMailer.new_follower_notification(@user, current_user).deliver
        respond_to do |format|
          format.js
        end
      rescue StandardError => e
        logger.error 'Unable to send new follower notification'
        logger.error "#{e.backtrace.first}: #{e.message} (#{e.class})"
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.present?
      follow = current_user.follows.get_follow(@user).first if current_user.follows
      if follow
        follow.destroy
      end
    end
    render 'create'
  end	
end
