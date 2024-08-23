class AquariumImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  
    version :thumb do
      process resize_to_fit: [200, 200]
    end
  
    version :medium do
      process resize_to_fit: [400, 400]
    end
  
    version :large do
      process resize_to_fit: [800, 800]
    end
  end
  