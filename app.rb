require './models/Post'

class App < Roda
  plugin :json
  plugin :json_parser
  plugin :all_verbs

  route do |r|
    r.on 'posts' do
      r.get do
        Post.all
      end

      r.post do
        # Handle POST /posts
        post = Post.new(title: r.params['title'], content: r.params['content'])
        post.save
        { message: 'Post Created successfully', data: { post: post } }
      end

      r.is String do |id|
      #   r.get do
      #     # Handle GET /posts/$ID
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
      end
    end
  end
end
