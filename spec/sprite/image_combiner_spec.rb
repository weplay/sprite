require File.dirname(__FILE__) + '/../spec_helper'

describe Sprite::ImageCombiner do
  before(:all) do
    # build a sprite object with empty config
    @combiner = Sprite::ImageCombiner.new
    
    @image_paths = {
      :good => "#{Sprite.root}/resources/images/topics/good-topic.gif",
      :mid => "#{Sprite.root}/resources/images/topics/mid-topic.gif"
    }
    
    @out = "#{Sprite.root}/output/image_combiner"
  end
  
  context "image handling" do  
    context "image_properties" do
      it "should get image properties" do
        image = @combiner.image_properties(@image_paths[:good])
        image[:path].should == @image_paths[:good]
        image[:width].should == 20
        image[:height].should == 19
      end
    end
  
    context "composite_images" do
      it "should composite two images into one horizontally" do
        image1 = @combiner.image_properties(@image_paths[:good])
        image2 = @combiner.image_properties(@image_paths[:mid])
        image_combined = @combiner.composite_images("#{@out}/combined1.gif", image1, image2, image1[:width], 0)
        
        image_combined[:width].should == 40
        image_combined[:height].should == 19
      end
    
      it "should composite two images into one verically" do
        image1 = @combiner.image_properties(@image_paths[:good])
        image2 = @combiner.image_properties(@image_paths[:mid])
        image_combined = @combiner.composite_images("#{@out}/combined1.gif",image1, image2, 0, image1[:height])
        
        image_combined[:width].should == 20
        image_combined[:height].should == 38
      end
    end
  end
end