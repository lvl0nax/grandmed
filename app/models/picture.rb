class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  require 'RMagick'
  include Magick

  scope :best, -> { where.not(author: nil).order('rating DESC NULLS LAST') }

  def self.make_with_text(text, bkgnd, color = '#fff', pos = 'center')
    align = {
              'left'   => NorthWestGravity,
              'right'  => NorthEastGravity,
              'center' => NorthGravity
            }
    pic = Picture.new
    img =  ImageList.new('public'+bkgnd.image_url(:big))
    txt = Draw.new
    str = text.gsub(/(.{1,#{38}})(\s+|$)/, "\\1\n").strip.first(270)
    img.annotate(txt, 500,290,13,50, str){
      txt.pointsize = 26
      txt.font_family = 'Liberation Sans'
      #txt.stroke = '#000000'
      txt.font_weight = 700
      txt.fill = color
      txt.gravity = align[pos]
    }

    img.write('test.jpg')
    pic.description = text
    pic.image = File.open('test.jpg')
    pic.save! ? pic : nil
  end
end
