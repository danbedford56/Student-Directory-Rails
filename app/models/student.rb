class Student < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 3, maximum: 9}
end
