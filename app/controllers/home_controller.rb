class HomeController < AuthController
  def index
    @categories = Category.includes(:category_expenses).where(author: current_user)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(author: current_user, name: category_params[:name], icon: category_params[:icon])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category was successfully created." }
      else
        puts @category.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
