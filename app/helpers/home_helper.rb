module HomeHelper
  def recent_expenses
    CategoryExpense.includes(:category, :expense).where(expense: { author: current_user, created_at: 1.week.ago..Time.now })
      .order(created_at: :desc)
  end
end
