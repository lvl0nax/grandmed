class AphorismController < ApplicationController
  def step_one
    @backgrounds = Background.first(10)
  end
end
