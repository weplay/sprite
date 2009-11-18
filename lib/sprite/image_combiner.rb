module Sprite
  class ImageCombiner
    def initialize
      require 'sprite/sprite_magick'
    end

    def composite_images(path_to_write, dest_image, src_image, x, y)
      require 'ruby-debug'
      debugger
      
      width = [src_image[:width] + x, dest_image[:width]].max
      height = [src_image[:height] + y, dest_image[:height]].max
      
      # image = Sprite::Magick::Image.new(width, height)
      # image.opacity = Magick::MaxRGB
      
      src = Sprite::Magick::Image.from_file(src_image[:path])
      dest = Sprite::Magick::Image.from_file(dest_image[:path])
      
      output_image = Sprite::Magick::Composite.new(src, dest, 'png', :gravity => "SouthEast")
      # image.composite!(dest_image, 0, 0, Magick::OverCompositeOp)
      # image.composite!(src_image, x, y, Magick::OverCompositeOp)
      
      output_image
    end

    # # Image Utility Methods
    # def get_image(image_filename)
    #   image = Magick::Image::read(image_filename).first
    # 
    #   image
    # end

    def image_properties(image_path)
      img = Sprite::Magick::Image.from_file(image_path)
      {:path => image_path, :width => img[:width], :height => img[:height]}
    end
        
    #  IMAGEMAGICK FROM THE COMMAND LINE
    # identify => find properties for an image
    # composite => combine 2 images

  end
end