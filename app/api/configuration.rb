class ConfigurationAPI < Grape::API
  resource :configuration do
    desc 'Return all configuration options'
    get do
      CAMERA.configurations
    end

    desc 'Updates camera settings with passed paramaters'
    post do
      if CAMERA.update(params.reject { |k| k == 'route_info' })
        CAMERA.configurations
      else
        #TODO: Pass back errors
      end
    end
  end
end
