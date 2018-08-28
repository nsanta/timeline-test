class TweetsController < ApplicationController
  before_action :load_resource , only: [:edit, :update, :destroy]

  def index
    @resources = Tweet.chronological.with_owner.page(params[:page])
  end

  def new
    @resource = Tweet.new
  end

  def create
    @resource = Tweet.new(permitted_params_for_create)
    @resource.owner = current_user
    if @resource.save
      redirect_to tweets_path, flash: { success: 'Tweet created' }
    else
      render :new, flash: { error: 'Tweet not created.' }
    end
  end

  def update
    if @resource.update(permitted_params_for_update)
      redirect_to tweets_path, flash: { success: 'Tweet updated' }
    else
      render :edit, flash: { error: 'Tweet not updated.' }
    end
  end

  def destroy
    flash = if @resource.destroy
              { success: 'Tweet deleted' }
            else
              { error: 'Tweet not deleted' }
            end
    redirect_back(fallback_location: root_path, flash: flash)
  end

  private

  def load_resource
    @resource = Tweet.find(params[:id])
  end

  def permitted_params_for_create
    params.require(:tweet).permit(:message)
  end

  def permitted_params_for_update
    permitted_params_for_create
  end
end
