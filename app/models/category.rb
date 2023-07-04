# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates :name, presence: true
end
