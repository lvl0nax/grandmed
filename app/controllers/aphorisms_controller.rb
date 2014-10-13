class AphorismsController < ApplicationController

  layout 'main_page', only: [:home]

  def home;  end

  def rules
    @aphorisms = Picture.last(5)
  end

  def step_one
    @backgrounds = Background.first(10)
  end

  def step_two
    @aphorisms = Picture.last(5)
    @background = Background.find(params[:background].to_i)
  end

  def make_aphorism
    txt = params[:description]
    bkg = Background.find(params[:image].to_i)
    if (p = Picture.make_with_text(txt, bkg))
      render json: { url: step_three_path(p.id) }
    end
  end

  def step_three
    @aphorisms = Picture.last(5)
    @picture = Picture.find(params[:picture_id])
  end

  def permitted_params
    params.permit [:image, :description, :author]
  end
end
