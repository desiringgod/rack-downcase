require "rack/downcase/version"

module Rack
  class Downcase
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.get? && (request.path.downcase != request.path)
        destination = request.url.sub(request.path, request.path.downcase)
        [301, {'Location' => destination, 'Content-Type' => 'text/html'}, ["Redirecting to #{destination}"]]
      else
        @app.call(env)
      end
    end
  end
end
