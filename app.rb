require './models/Post'

class App < Roda
  plugin :json
  plugin :all_verbs

  route do |r|
    r.on "posts" do
      r.get do
        Post.all
      end

      # r.is String do |id|
      #   r.get do
      #     post = Post.find(id)
      #     post || r.halt(404)
      #   end

      #   r.post do
      #     # Handle POST /posts/$ID
      #   end

      #   r.put do
      #     # Handle PUT /posts/$ID
      #   end

      #   r.patch do
      #     # Handle PATCH /posts/$ID
      #   end

      #   r.delete do
      #     # Handle DELETE /posts/$ID
      #   end
      # end
    end
  end
end
