# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged]

  # Properties
  self.table_name  = 'posts'
  self.primary_key = 'id'

  # Scopes
  scope :published, -> { where(published: true)  }
  scope :drafts,    -> { where(published: false) }

  # Relationships
  belongs_to :user

  def published?
    published.eql?(true) ? 'Publicado' : 'Rascunho'
  end
end
