class App < Roda
  plugin :json

  route do |r|
    r.get "hello" do
      { message: "Hello, world!" }
    end
  end
end
