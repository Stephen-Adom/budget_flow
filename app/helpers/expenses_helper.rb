module ExpensesHelper
  def format_date(created_at)
    # format date in the format 12 Apr 2014
    created_at.strftime("%d %b %Y")
  end
end
