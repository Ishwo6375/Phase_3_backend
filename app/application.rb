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

         #MENU ROUTES

         # get all Menu resources 
    elsif req.path == '/menus' && req.get?
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ Menu.all.to_json ]
      ]

       # create a new resource
    elsif req.path == '/menus' && req.post?
      body = JSON.parse(req.body.read)
      menu = Menu.create(body)
      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ menu.to_json ]
      ]

       # get a resource by id
    elsif req.path.match(/menus/) && req.get?
      id = req.path.split('/')[2]
      menu = Menu.find_by_id(id)

      if menu 
        return [
          200,
          { 'Content-Type' => 'application/json' },
          [ menu.to_json ]
        ]
      else
        return [
          204,
          { 'Content-Type' => 'application/json' },
          [ {}.to_json ]
        ]
      end
   
     # update a resource by id
    elsif req.path.match(/menus/) && req.patch?
      id = req.path.split('/')[2]
      menu = Menu.find_by_id(id)
      body = JSON.parse(req.body.read)
      
      menu.update(body)

      return [
        200,
        { 'Content-Type' => 'application/json' },
        [ menu.to_json ]
      ]

      # delete a resource by id
    elsif req.path.match(/menus/) && req.delete?
      id = req.path.split('/')[2]
      menu = Menu.find_by_id(id)

      menu.destroy

      return [
        204,
        {},
        ['']
      ]
    
      end

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

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