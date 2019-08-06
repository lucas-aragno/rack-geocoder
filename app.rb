require "sinatra"
require "geocoder"
require "sinatra/namespace"
require "json"

module GeocodeRack
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace "/api" do
      before do
        content_type 'application/json'
      end

      get "/pais" do
        lat = params[:latitude]
        lng = params[:longitude]
        res = Geocoder.search([lat,lng])
        res.first.address.to_json
      end
    end
  end
end