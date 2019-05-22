class Application
  @@items = ["Apple","Carrots","Pears"]
  @@cart = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
        @@items.each do |item|
          if item 
            resp.write "#{item.price}\n"
          else 
            resp.write "Item not found"
            resp.status = 400
          end
        end
    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      end
        
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end