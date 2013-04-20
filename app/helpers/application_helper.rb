module ApplicationHelper
  def list_id
    "list_#{suffix}"
  end
  
  def footer_id
    "footer_#{suffix}"
  end
  
  def cancel_button_tag(url = "", &block)
    button_tag t(:cancel), :type => "button", :class => (is_xhr? ? "remote_cancel_button" : "cancel_button"), :data => {:url => url}, &block
  end
end
