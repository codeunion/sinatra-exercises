require 'data_mapper'
DataMapper.setup(:default, "sqlite:recipes.db")

class Recipe
  include DataMapper::Resource
  property :id,           Serial
  property :created_by,   String
  property :title,        String
  property :description,  String
  property :instructions, Text
  property :created_at,   DateTime
end

DataMapper.finalize
DataMapper.auto_upgrade!
