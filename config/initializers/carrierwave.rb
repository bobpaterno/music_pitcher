CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development? 
    config.storage = :file
    config.enable_processing = false
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AWS_ACCESS_SECRET']
    }
    config.storage = :fog
    config.fog_public     = false
    if Rails.env.production?
      config.storage = :fog
      config.fog_directory  = 'music-pitcher-tfm'
    end
  end
end