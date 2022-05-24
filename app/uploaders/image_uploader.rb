class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  version :thumb do 
    process resize_to_fit: [200, 200] 
  end 
 version :thumb50 do 
   process resize_to_fit: [100, 100] 
  end 
end
