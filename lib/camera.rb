require 'gphoto2' #FIXME: Why doesn't bundler include this?

class Camera
  class CameraFellAsleep < StandardError; end

  attr_accessor :type

  def initialize(type)
    kill_mac_processes!
    @type = type
  end

  def reload!
    kill_mac_processes!
    @gphoto_camera = gphoto_cameras.first
  end

  def configurations
    reload
    config.each_with_object({}) { |(k,v), hash| hash[k] = v.value }
  end

  private

  at_exit do
    return unless CAMERA

    # If a preview was initialized at any point, ensure that we close the
    # shutter.
    CAMERA.close
  end

  def method_missing(method, *args)
    raise CameraFellAsleep unless gphoto_camera

    gphoto_camera.send(method, *args) if gphoto_camera.respond_to?(method)
  end

  # Mac OS X will automatically start a process when a camera is connected,
  # stealing access to the USB.
  def kill_mac_processes!
    system('killall PTPCamera 1>/dev/null')
  end

  def gphoto_cameras
    GPhoto2::Camera.where(model: /#{type}/i)
  end

  def gphoto_camera
    @gphoto_camera ||= gphoto_cameras.first
  end
end
