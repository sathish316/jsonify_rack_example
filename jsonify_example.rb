require './models/pizza'
require 'scrapify'

JsonifyExampleApp = Rack::Builder.new do
  use Rack::CommonLogger
  run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["For Jsonify usage exampple: Go to /pizzas or /pizzas/margherita"]]}

  map '/pizzas' do
    run Jsonify.new('/pizzas', ::Pizza)
  end
end