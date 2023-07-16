class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements
  has_many :reviews
  has_many :favourite_recipes, dependent: :destroy
  has_many :recipes, through: :favourite_recipes
  has_many :dishes, foreign_key: :created_by_id, class_name: 'Recipe'

  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w(m f) }
end
