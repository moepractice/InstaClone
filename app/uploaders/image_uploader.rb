class ImageUploader < CarrierWave::Uploader::Base
  
  storage :file
  process :resize_to_limit => [500,500]
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  process resize_to_fit: [600, nil]
  
  version :thumb do
  process resize_to_fit: [300, nil]
  end
end
 
  def extension_white_list
       %w(jpg jpeg gif png)
  end
