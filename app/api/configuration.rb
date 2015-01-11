class ConfigurationAPI < Grape::API
  resource :configuration do
    desc 'Return all configuration options'
    get do
      CAMERA.configurations
    end
  end
end
