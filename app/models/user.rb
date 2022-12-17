# frozen_string_literal: true

class User < ApplicationRecord
  # Properties
  self.table_name  = 'users'
  self.primary_key = 'id'

  # Relationships
  has_many :posts, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
