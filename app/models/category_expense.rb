# frozen_string_literal: true

class CategoryExpense < ApplicationRecord
  belongs_to :category
  belongs_to :expense
end
