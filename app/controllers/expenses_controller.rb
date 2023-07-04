class ExpensesController < AuthController
  def index
    @category = Category.includes(:expenses, :category_expenses).find(params[:category_id])
  end
end
