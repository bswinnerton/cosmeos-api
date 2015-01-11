require './app'

desc 'API Routes'
task :routes do
  Cosmeos::CameraAPI.routes.each do |api|
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{path}"
  end
end
