class BookSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :title, :description, :created_at
end
