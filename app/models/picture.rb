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
    # 18 is length of strings in the image text
    str = text.gsub(/(.{1,#{18}})(\s+|$)/, "\\1\n").strip.first(270)
    # 240 width of the text rectangle
    # 290 height of the text rectangle
    img.annotate(txt, 240,290,13,50, str){
      txt.pointsize = 26
      txt.font_family = 'Liberation Sans'
      #txt.stroke = '#000000'
      txt.font_weight = 700
      txt.fill = color
      txt.gravity = NorthGravity # align[pos]
    }

    img.write('test.jpg')
    pic.description = text
    pic.image = File.open('test.jpg')
    pic.save! ? pic : nil
  end
end
