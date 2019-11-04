ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  # This is the default Rails error wrapper, but it's not nice
  #html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe

  html = ''

  form_fields = [
    'textarea',
    'input',
    'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')
  elements.each do |e|
    if e.node_name.eql? 'label'
      # Labels
      #html = %(<div class="control-group error">#{e}</div>).html_safe

    elsif form_fields.include? e.node_name
      # Add the error class directly to the element
      e.add_class("error")

      if e.get_attribute("type") == "checkbox"
        # Checkboxes can't have a border, so we'll need to skip these for now unless we make them more complicated
        html = e.to_s

      elsif instance.error_message.kind_of?(Array)
        # Add a hint error after the field
        # If there were multiple errors on an element, we'll combine them into one string
        html = %(#{e}<p class="form-hint error">&nbsp;#{instance.send(:sanitized_method_name).humanize} #{instance.error_message.uniq.join(', ')}</p>)

      else
        # Add a hint error after the field
        html = %(#{e}<p class="form-hint error">&nbsp;#{instance.send(:sanitized_method_name).humanize} #{instance.error_message}</p>)
      end

    else
      # For everything else, we'll ignore the error styling
      html = e.to_s
    end
  end

  html.html_safe
end
