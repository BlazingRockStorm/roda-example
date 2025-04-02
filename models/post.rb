require 'mongoid'

class Post
  include Mongoid::Document
  include Mongoid::Timestamps # This adds created_at and updated_at fields automatically

  # Fields
  field :title, type: String
  field :content, type: String

  def self.all
    collection.find.to_a
  end

  # Improve JSON serialization
  def as_json(options = {})
    {
      id: id.to_s,
      title: title,
      content: content,
      created_at: created_at.try(:utc).try(:iso8601),
      updated_at: updated_at.try(:utc).try(:iso8601)
    }
  end
end
