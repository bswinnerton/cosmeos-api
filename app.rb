require './config/environment'

module Cosmeos
  class CameraAPI < Grape::API
    version 'v1', using: :path
    format :json

    namespace :camera do
      mount ConfigurationAPI
      mount PreviewAPI
    end
  end
end
