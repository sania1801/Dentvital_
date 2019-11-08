require 'elasticsearch/model'
class Patient < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :orders, dependent: :destroy

  validates :name, :surname, :fathername, :adress, :phonenumber, :dob, presence: true
  
end
