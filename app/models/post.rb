
class Post < Sequel::Model(:posts)
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def persisted?
    !new?
  end

  def to_param
    id.to_s if id
  end
end