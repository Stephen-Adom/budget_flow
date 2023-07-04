class ExpensesController < AuthController
  def index
    @category = Category.find(params[:category_id])
    @expenses = Expense.includes(category_expenses: :category)
      .where(category_expenses: { category_id: params[:category_id] }).order(created_at: :desc)
  end

  def new
    @expense = Expense.new
    @category_id = params[:category_id]
    @selected_categories = [params[:category_id]]
  end

  def create
    @expense = Expense.new(author: current_user, name: expense_params[:name], amount: expense_params[:amount])

    respond_to do |format|
      if @expense.save
        update_category_expenses(@expense)

        format.html { redirect_to category_expenses_path(category_id: params[:category_id]), notice: "Expense was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def update_category_expenses(expense)
    params[:category_ids].each do |selected_category|
      CategoryExpense.create(category_id: selected_category, expense_id: expense.id)
    end
  end
end
