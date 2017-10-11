class List < ApplicationRecord
  validates_presence_of :name, :due, :note
end
