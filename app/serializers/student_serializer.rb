class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :age, :instructor_id
  has_one :instructor
end
