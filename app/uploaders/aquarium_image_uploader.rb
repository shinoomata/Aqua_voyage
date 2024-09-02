class AquariumImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_fit: [1600, 1600] # すべてのバージョンに先立ってオリジナルをリサイズ
  process convert: 'jpg'
  process quality: 'auto:low'

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
