require './config/environment'
require_relative 'lib/camera'

module Cosmeos
  module Camera

    class API < Grape::API
      version 'v1', using: :header, vendor: 'camera'
      format :json
      prefix :api

      namespace :camera do
        resource :configuration do
          desc 'Return all configuration options'
          get do
            CAMERA.configurations
          end
        end

        resource :preview do
          content_type :jpg, 'image/jpeg'
          content_type :jpeg, 'image/jpeg'

          desc 'Returns a JPEG image preview from the camera'
          get do
            CAMERA.preview.data
          end
        end
      end
    end

  end
end
