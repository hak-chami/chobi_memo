module ApplicationHelper
  def bootstrap_class(flash_type)
    case flash_type
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
