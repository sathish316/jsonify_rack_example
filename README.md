# ScrApify

ScrApify is a gem which scraps static html pages and exposes them as JSON APIs

This is a sample Rack application using scrapify to create a RESTful read only service from static page.

## JSON API (Rack application example)

Scrapify comes with a Rack application called Jsonify which can expose scraped models as JSON.

1 Install scrapify

```
$ gem install scrapify
```

2 Define model and attributes

See models/pizza.rb for example

```
class Pizza
  include Scrapify::Base
  attributes :name, css: '.menu li'
end
```

3 In Rack application map the routes you want to expose as JSON using Rack::Builder#map

```
  map '/pizzas' do
    run Jsonify.new('/pizzas', ::Pizza)
  end
```

Jsonify will fetch data from static html sites and expose them as JSON in these urls:

* /pizzas
* /pizzas/:id

Jsonify currently has a limitation where the URLs /pizzas.json and /pizzas/1.json cannot be matched by the same map entry in Rack routes