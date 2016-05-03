class Paper < ActiveRecord::Base
  self.primary_key = 'paperid'
  validates :paperid, presence: true, length: { minimum: 4 }, uniqueness: true
  validates :secr, presence: true, length: { minimum: 4 }
  validates :abstract, presence: true, length: { minimum: 15, maximum: 115 }, on: :update
  validates :controverse1, presence: true, length: { minimum: 15, maximum: 115 }, on: :update
end
