module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    message = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{message}
    </div>
    HTML

    html.html_safe
  end
end
