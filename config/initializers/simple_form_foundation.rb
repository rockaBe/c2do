# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :foundation, class: :input, hint_class: :field_with_hint, error_class: :error do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    # b.use :label_input
    # b.use :error, wrap_with: { tag: :small }

    # Uncomment the following line to enable hints. The line is commented out by default since Foundation
    # does't provide styles for hints. You will need to provide your own CSS styles for hints.
    # b.use :hint,  wrap_with: { tag: :span, class: :hint }

    ## Inputs
    b.wrapper tag: :div, class: 'large-12 small-12' do |c|
      c.wrapper tag: :div, class: 'row collapse' do |d|
        d.wrapper tag: :div, class: 'large-2 small-4 columns' do |e|
          e.use :label, wrap_with: {tag: :span, class: :prefix}
        end
        d.wrapper tag: :div, class: 'large-10 small-8 columns' do |e|
          e.use :input
        end
      end
      c.wrapper tag: :div, class: 'row collapse' do |d|
        d.wrapper tag: :div, class: 'large-12 small-12 columns' do |e|
          e.use :hint,  wrap_with: { tag: :span, class: :hint }
          e.use :error, wrap_with: { tag: :small, class: :error }
        end
      end
    end
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :foundation
  config.boolean_style = :nested
  # HTML-Tag for error notification helper
  config.error_notification_tag = :div
  # CSS class to add for error notification helper.
  config.error_notification_class = 'alert-box alert'
  # CSS class for buttons
  config.button_class = 'button'
  config.label_class = 'control-label'
  config.form_class = :nice
  config.browser_validations = false
end
