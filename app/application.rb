class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    # root url
    if req.path == '/'
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [{ message: "you're on the home page" }.to_json]
      ]

       # get all Restaurant resources 
    elsif req.path == '/restaurants' && req.get?
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ Restaurant.all.to_json ]
      ]

      # create a new resource
    elsif req.path == '/restaurants' && req.post?
      body = JSON.parse(req.body.read)
      restaurant = Restaurant.create(body)
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ restaurant.to_json ]
      ]

       # get a resource by id
    elsif req.path.match(/restaurants/) && req.get?
      id = req.path.split('/')[2]
    
      restaurant = Restaurant.find_by_id(id)
    
      if restaurant 
        return [
          200,
          { 'Content-Type' => 'application/json' },
          [ restaurant.to_json ]
        ]
      else
        return [
          204,
          { 'Content-Type' => 'application/json' },
          [ {}.to_json ]
        ]
      end

       # update a resource by id
    elsif req.path.match(/restaurants/) && req.patch?
      id = req.path.split('/')[2]
      restaurant = Restaurant.find_by_id(id)
      body = JSON.parse(req.body.read)
      
      restaurant.update(body)

      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ restaurant.to_json ]
      ]

       # delete a resource by id
    elsif req.path.match(/restaurants/) && req.delete?
      id = req.path.split('/')[2]
      restaurant = Restaurant.find_by_id(id)

      restaurant.destroy

      return [
        204,
        {},
        ['']
      ]

         ###########################

         #FOOD ROUTES

         # get all Menu resources 
    elsif req.path == '/foods' && req.get?
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ Food.all.to_json ]
      ]

       # create a new resource
    elsif req.path == '/foods' && req.post?
      body = JSON.parse(req.body.read)
      food = Food.create(body)
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ food.to_json ]
      ]

       # get a resource by id
    elsif req.path.match(/foods/) && req.get?
      id = req.path.split('/')[2]
      food = Food.find_by_id(id)

      if food 
        return [
          200,
          { 'Content-Type' => 'application/json' },
          [ food.to_json ]
        ]
      else
        return [
          204,
          { 'Content-Type' => 'application/json' },
          [ {}.to_json ]
        ]
      end
   
     # update a resource by id
    elsif req.path.match(/foods/) && req.patch?
      id = req.path.split('/')[2]
      food = Food.find_by_id(id)
      body = JSON.parse(req.body.read)
      
      food.update(body)

      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ food.to_json ]
      ]

      # delete a resource by id
    elsif req.path.match(/foods/) && req.delete?
      id = req.path.split('/')[2]
      food = Food.find_by_id(id)

      food.destroy

      return [
        204,
        {},
        ['']
      ]
    
      end

    if req.path.match(/test/) 
      return [200, 
      { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
       return [
        404,
        {},
        ['OOps!! Sorry Page not found']
      ]
    end

    res.finish
  end
end