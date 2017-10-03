module Formtastic
  module Inputs
    module Base
      module Choices

        #~# def choices_wrapping(&block)
        #~#   template.content_tag(:fieldset,
        #~#     template.capture(&block),
        #~#     choices_wrapping_html_options
        #~#   )
        #~# end
        def choices_wrapping(&block)
          block.call            # muah ha ha, no more fieldset!
        end


        def choices_wrapping_html_options
          { :class => "choices" }
        end

        #~# def choices_group_wrapping(&block)
        #~#   template.content_tag(:ol,
        #~#     template.capture(&block),
        #~#     choices_group_wrapping_html_options
        #~#   )
        #~# end
        def choices_group_wrapping(&block)
          template.capture(&block) # remove wrapping <ol> and all its class - needed for radio buttons on candidate application
        end

        def choices_group_wrapping_html_options
          { :class => "choices-group" }
        end

        #~# def choice_wrapping(html_options, &block)
        #~#   template.content_tag(:li,
        #~#     template.capture(&block),
        #~#     html_options
        #~#   )
        #~# end
        def choice_wrapping(html_options, &block)
          template.content_tag(:div,
            template.capture(&block),
            html_options
          )
        end

        def choice_wrapping_html_options(choice)
          classes = ['choice']
          classes << "#{sanitized_method_name.singularize}_#{choice_html_safe_value(choice)}" if value_as_class?

          { :class => classes.join(" ") }
        end

        def choice_html(choice)
          raise "choice_html() needs to be implemented when including Formtastic::Inputs::Base::Choices"
        end

        def choice_label(choice)
          if choice.is_a?(Array)
            choice.first
          else
            choice
          end.to_s
        end

        def choice_value(choice)
          choice.is_a?(Array) ? choice[1] : choice
        end

        def choice_html_options(choice)
          custom_choice_html_options(choice).merge(default_choice_html_options(choice))
        end

        def default_choice_html_options(choice)
          { :id => choice_input_dom_id(choice) }
        end

        def custom_choice_html_options(choice)
          (choice.is_a?(Array) && choice.size > 2) ? choice[-1] : {}
        end

        def choice_html_safe_value(choice)
          choice_value(choice).to_s.gsub(/\s/, '_').gsub(/[^\w-]/, '').downcase
        end

        def choice_input_dom_id(choice)
          [
            builder.dom_id_namespace,
            sanitized_object_name,
            builder.options[:index],
            association_primary_key || method,
            choice_html_safe_value(choice)
          ].compact.reject { |i| i.blank? }.join("_")
        end

        def value_as_class?
          options[:value_as_class]
        end

        #~# def legend_html
        #~#   if render_label?
        #~#     template.content_tag(:legend,
        #~#       template.content_tag(:label, label_text),
        #~#       label_html_options.merge(:class => "label")
        #~#     )
        #~#   else
        #~#     "".html_safe
        #~#   end
        #~# end
        def legend_html
          if render_label?
            # we took away the <legend> for ???I forget why???
            # we preserve the <label> and add control-label for radio buttons
            # we're not sure that whyever we took away the legend is happy about having the label added back in. It's in our TODOs
            template.content_tag(:label,label_text,
                                 update_class_on_options( label_html_options, add_class:'control-label', remove_class: 'label'))

          else
            "".html_safe
          end
        end


        # Override to remove the for attribute since this isn't associated with any element, as it's
        # nested inside the legend.
        def label_html_options
          super.merge(:for => nil)
        end

        private
        #=># launchcode
        def update_class_on_options(options, add_class:, remove_class:)
          old_class = options[:class] || []
          new_class = old_class.dup
          new_class << add_class if add_class
          new_class = new_class - [remove_class] if remove_class
          options.merge(class: new_class)
        end
      end
    end
  end
end
