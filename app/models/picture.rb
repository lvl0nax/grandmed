class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  require 'RMagick'
  include Magick

  def self.make_with_text(text, bkgnd)
    pic = Picture.new
    img =  ImageList.new('public'+bkgnd.image_url(:thumb))
    txt = Draw.new
    str = text.gsub(/(.{1,#{36}})(\s+|$)/, "\\1\n").strip
    img.annotate(txt, 0,0,0,50, str){
      txt.pointsize = 25
      txt.stroke = '#000000'
      txt.fill = '#ffffff'
      txt.gravity = NorthGravity
    }

    img.write('test.jpg')
    pic.description = text
    pic.image = File.open('test.jpg')
    pic.save!
  end
end
