class PreviewAPI < Grape::API
  resource :preview do
    content_type :jpg, 'image/jpeg'
    content_type :jpeg, 'image/jpeg'

    desc 'Returns a JPEG image preview from the camera'
    get do
      CAMERA.preview.data
    end
  end
end
