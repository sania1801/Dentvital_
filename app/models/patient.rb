require 'elasticsearch/model'
class Patient < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :surname, presence: true
  validates :fathername, presence: true
  validates :adress, presence: true
  validates :phonenumber, presence: true
  validates :dob, presence: true
end
