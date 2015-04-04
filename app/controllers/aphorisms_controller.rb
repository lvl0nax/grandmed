class AphorismsController < ApplicationController

  layout 'main_page', only: [:home]

  def home;  end

  def rules
    @aphorisms = Picture.last(5)
  end

  def step_one
    @backgrounds = Background.all
  end

  def step_two
    @aphorisms = Picture.order(rating: :desc).first(5)
    @background = Background.find(params[:background].to_i)
  end

  def make_aphorism
    txt = params[:description]
    bkg = Background.find(params[:image].to_i)
    if (p = Picture.make_with_text(txt, bkg, params[:color], params[:align]))
      render json: { url: step_three_path(p.id) }
    end
  end

  def update_aphorism
    pic = Picture.find params[:id]
    if pic.update(
          author: params[:author],
          username: params[:username],
          post_id: params[:post_id]
        )
      render json: {status: :ok}
    end
  end

  def step_three
    @aphorisms = Picture.order(rating: :desc).first(5)
    @picture = Picture.find(params[:picture_id])
  end

  def vk_answer
    file = "public/uploads/picture/image/#{params[:photo].split('/')[-2]}/#{params[:photo].split('/').last}"
    app = VK::Application.new(app_id: 4617493)
    x = app.upload( url: params[:upload_url], file1: [file, 'image/jpeg'] )
    render json: x.body
  end

  def rating
    @page = (params[:page] || 1).to_i
    @aphorisms = Picture.where.not(author: nil).order('rating DESC NULLS LAST').page(@page).per 5
  end

  def permitted_params
    params.permit [:image, :description, :author, :username, :post_id]
  end
end
