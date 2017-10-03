module Formtastic
  module Inputs
    # Outputs a series of select boxes for the fragments that make up a date (year, month, day).
    #
    # @see Formtastic::Inputs::Base::Timeish Timeish module for documentation of date, time and datetime input options.
    class OriginalDateSelectInput
      include Base
      include Base::Timeish

      # We don't want hour and minute fragments on a date input
      def time_fragments
        []
      end

      def hidden_date_fragments
        default_date_fragments - date_fragments
      end

      def hidden_fragments
        hidden_date_fragments.map do |fragment|
          template.hidden_field_tag(hidden_field_name(fragment), fragment_value(fragment), :id => fragment_id(fragment), :disabled => input_html_options[:disabled] )
        end.join.html_safe
      end

      def fragment_value(fragment)
        if fragment == :year
          Time.now.year
        else
          '1'
        end
      end
    end

    class DateSelectInput < OriginalDateSelectInput
      def input_html_options
        s = super
        old_class = s[:class]
        new_class = old_class.present? ? (old_class + ' form-control') : 'form-control'
        s.merge(class: new_class)
      end

      def wrapper_html_options
        s = super
        old_class = s[:class]
        new_class = old_class.present? ? (old_class + ' form-group') : 'form-group'
        s.merge(class: new_class)
      end
    end
  end
end
