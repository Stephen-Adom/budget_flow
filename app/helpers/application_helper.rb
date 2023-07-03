module ApplicationHelper
  def check_if_valid(errors, label)
    return "invalid" if errors.any? && errors[label].present?
  end
end
