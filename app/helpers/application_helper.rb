module ApplicationHelper
  def full_title(page_title)
    if page_title.blank?
      Const::BASE_TITLE
    else
      "#{page_title} - #{Const::BASE_TITLE}"
    end
  end

  def reset_tag(value = "Reset form", options = {})
    options = options.stringify_keys
    tag :input, { type: "reset", value: value }.update(options)
  end
end
