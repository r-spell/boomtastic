module Formtastic
  module Inputs

    # Outputs a simple `<label>` with a `<input type="password">` wrapped in the standard
    # `<li>` wrapper. This is the default input choice for all attributes matching `/password/`, but
    # can be applied to any text-like input with `:as => :password`.
    #
    # @example Full form context and output
    #
    #   <%= semantic_form_for(@user) do |f| %>
    #     <%= f.inputs do %>
    #       <%= f.input :password, :as => :password %>
    #     <% end %>
    #   <% end %>
    #
    #   <form...>
    #     <fieldset>
    #       <ol>
    #         <li class="password">
    #           <label for="user_password">Password</label>
    #           <input type="password" id="user_password" name="user[password]">
    #         </li>
    #       </ol>
    #     </fieldset>
    #   </form>
    #
    # @see Formtastic::Helpers::InputsHelper#input InputsHelper#input for full documentation of all possible options.
    class OriginalPasswordInput
      include Base
      include Base::Stringish
      include Base::Placeholder

      def to_html
        input_wrapping do
          label_html <<
          builder.password_field(method, input_html_options)
        end
      end
    end

    class PasswordInput < OriginalPasswordInput
      def input_html_options
        s = super
        old_class = s[:class]
        new_class = old_class.present? ? (old_class + ' form-control') : 'form-control'
        s.merge(class: new_class)
      end

      def label_html_options
        update_class_on_options(super, add_class:'control-label', remove_class: 'label')
      end
    end

  end
end
