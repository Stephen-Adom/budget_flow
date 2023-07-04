class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def total_expenses
    expenses.sum(:amount)
  end
end
