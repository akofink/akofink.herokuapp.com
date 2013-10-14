class MediaController < ApplicationController
  def index
    @title = "Media"
    @new_medium = medium
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def create
    protect_content!

    medium = Medium.new(medium_params)
    if medium.save
      log "Created New Media Entry: #{medium}"
    end
    redirect_to Medium
  end

  def destroy
    if medium.delete
      log "Destroyed Media Entry: #{medium}"
    end
    redirect_to '/media'
  end

  private

  def protect_content!
    medium_params[:content] = medium_params[:content].gsub!(/\/\//, '')
  end

  def medium_params
    params.require(:medium).permit(:title, :content)
  end

  def medium
    @medium ||= (params[:id] && Medium.find(params[:id])) || Medium.new
  end
end
