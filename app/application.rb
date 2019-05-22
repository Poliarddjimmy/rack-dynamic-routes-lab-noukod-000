class Application
  @@items = ["Apple","Carrots","Pears"]
  @@cart = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
        if @@item.empty?
          resp.write "Item not found"
          resp.status = 400
        else
          @@items.each do |item|
            resp.write "#{item.price}\n"
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