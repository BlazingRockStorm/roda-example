require './models/Post'

class App < Roda
  plugin :json
  plugin :json_parser
  plugin :all_verbs

  route do |r|
    r.on 'posts' do
      r.is String do |id|
        r.get do
          post = Post.find(id)
          { message: 'Post Created successfully', data: { post: post } }
        end

        r.put do
          # Handle PUT /posts/$ID
          post = Post.find(id)
          post.update(title: r.params['title'], content: r.params['content'])
          { message: 'Post Updated successfully', data: { post: post } }
        end

        r.patch do
          # Handle PATCH /posts/$ID
          post = Post.find(id)
          post.update(title: r.params['title'], content: r.params['content'])
          { message: 'Post Updated successfully', data: { post: post } }
        end

        r.delete do
          # Handle DELETE /posts/$ID
          post = Post.find(id)
          post.destroy
          { message: 'Post Deleted successfully' }
        end
      end

      r.get do
        Post.all
      end

      r.post do
        # Handle POST /posts
        post = Post.new(title: r.params['title'], content: r.params['content'])
        post.save
        { message: 'Post Created successfully', data: { post: post } }
      end
    end
  end
end
