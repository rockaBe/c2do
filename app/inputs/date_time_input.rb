class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
  	puts ">>>>>>>>>>>> \n>> input_html_options =>\n> #{input_html_options}\n>>>>>>>>>>>>"
  	puts "*********** \n* input_type => \n* #{input_type}\n***********"
  	input_html_options[:class].push('small-2 with-picker') if input_html_options[:class]
    
    unless string?
    	input_html_classes.unshift("string")
      input_html_options[:type] ||= input_type if html5?
    end

    @builder.text_field(attribute_name, input_html_options)
  end

  private

  	def string?
      input_type == :string
    end

   def label_target
     position = case input_type
     when :date, :datetime
       date_order = input_options[:order] || I18n.t('date.order')
       date_order.first.to_sym
     else
       :hour
     end

     position = ActionView::Helpers::DateTimeSelector::POSITION[position]
     "#{attribute_name}_#{position}i"
   end
end