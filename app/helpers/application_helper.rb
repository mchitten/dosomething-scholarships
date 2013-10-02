module ApplicationHelper
  def breadcrumb
    render partial: 'breadcrumb', formats: [:html]
  end
end
