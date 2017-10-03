module Formtastic
  module Inputs

    # Outputs a simple `<label>` with a HTML5 `<input type="email">` wrapped in the standard
    # `<li>` wrapper. This is the default input choice for attributes with a name matching
    # `/email/`, but can be applied to any text-like input with `:as => :email`.
    #
    # @example Full form context and output
    #
    #   <%= semantic_form_for(@user) do |f| %>
    #     <%= f.inputs do %>
    #       <%= f.input :email_address, :as => :email %>
    #     <% end %>
    #   <% end %>
    #
    #   <form...>
    #     <fieldset>
    #       <ol>
    #         <li class="email">
    #           <label for="user_email_address">Email address</label>
    #           <input type="email" id="user_email_address" name="user[email_address]">
    #         </li>
    #       </ol>
    #     </fieldset>
    #   </form>
    #
    # @see Formtastic::Helpers::InputsHelper#input InputsHelper#input for full documentation of all possible options.
    class OriginalEmailInput
      include Base
      include Base::Stringish
      include Base::Placeholder

      def to_html
        input_wrapping do
          label_html <<
          builder.email_field(method, input_html_options)
        end
      end
    end
    class EmailInput < OriginalEmailInput
      def input_html_options
        s = super
        old_class = s[:class]
        new_class = old_class.present? ? (old_class + ' form-control') : 'form-control'
        s.merge(class: new_class)
      end

      def label_html_options
        update_class_on_super(super, add_class:'control-label', remove_class: 'label')
      end

      private
      def update_class_on_super(the_super, add_class:, remove_class:)
        old_class = the_super[:class] || []
        new_class = old_class.dup
        new_class << add_class if add_class
        new_class = new_class - [remove_class] if remove_class
        the_super.merge(class: new_class)
      end
    end

  end
end
