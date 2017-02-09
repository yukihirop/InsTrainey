module ApplicationHelper

  def document_title
    if @title.present?
      "#{@title} - InsTrainey"
    else
      "InsTrainey"
    end
  end
end
