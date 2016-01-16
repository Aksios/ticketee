module ApplicationHelper
  def title(*attr)
    if attr.any?
      content_for :title do
        (attr << 'Ticketee').join(' - ')
      end
    end
  end
end
