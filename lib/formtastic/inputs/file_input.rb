module Formtastic
  module Inputs

    # Outputs a simple `<label>` with a `<input type="file">` wrapped in the standard
    # `<li>` wrapper. This is the default input choice for objects with attributes that appear
    # to be for file uploads, by detecting some common method names used by popular file upload
    # libraries such as Paperclip and CarrierWave. You can add to or alter these method names
    # through the `file_methods` config, but can be applied to any input with `:as => :file`.
    #
    # Don't forget to set the multipart attribute in your `<form>` tag!
    #
    # @example Full form context and output
    #
    #   <%= semantic_form_for(@user, :html => { :multipart => true }) do |f| %>
    #     <%= f.inputs do %>
    #       <%= f.input :avatar, :as => :file %>
    #     <% end %>
    #   <% end %>
    #
    #   <form...>
    #     <fieldset>
    #       <ol>
    #         <li class="file">
    #           <label for="user_avatar">Avatar</label>
    #           <input type="file" id="user_avatar" name="user[avatar]">
    #         </li>
    #       </ol>
    #     </fieldset>
    #   </form>
    #
    # @see Formtastic::Helpers::InputsHelper#input InputsHelper#input for full documentation of all possible options.
    class OriginalFileInput
      include Base
      def to_html
        input_wrapping do
          label_html <<
          builder.file_field(method, input_html_options)
        end
      end
    end

    class FileInput < OriginalFileInput
      # NOTE: if you put form-control on input for file it makes admin edit page messed up
      def label_html_options
        s = super
        old_class = s[:class] || []
        new_class = old_class + ['control-label']
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
