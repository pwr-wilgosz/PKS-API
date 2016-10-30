class BusSerializer < ActiveModel::Serializer
  attributes :id, :registration_number, :spaces, :brand
end

