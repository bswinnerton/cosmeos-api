require 'gphoto2' #FIXME: Why doesn't bundler include this?

class Camera
  DELEGATED_METHODS = [:close, :reload, :save, :config, :configuration, :preview]

  extend Forwardable
  def_delegators :camera_connection, *DELEGATED_METHODS

  def initialize
    kill_mac_processes!
  end

  def reload!
    kill_mac_processes!
    @camera_connection = camera_connections.first
  end

  def alive?
    !!camera_connection
  end

  def configurations
    reload
    config.each_with_object({}) { |(k,v), hash| hash[k] = v.value }
  end

  def update(options)
    options.each do |key, value|
      return unless config[key].choices.include? value
      camera_connection[key] = value
    end
    save
  end

  private

  # If a preview was initialized at any point, ensure that we close the
  # shutter now.
  at_exit do
    CAMERA.close if CAMERA.alive?
  end

  # Mac OS X will automatically start a process when a camera is connected,
  # stealing access to the USB. We need to kill it.
  def kill_mac_processes!
    system('killall PTPCamera 1>/dev/null')
  end

  def camera_connections
    GPhoto2::Camera.all
  end

  def camera_connection
    @camera_connection ||= camera_connections.first
  end
end
