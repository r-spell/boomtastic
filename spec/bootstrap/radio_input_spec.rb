# encoding: utf-8
require 'spec_helper'

describe 'radio input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe 'for belongs_to association' do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:author, :as => :radio, :value_as_class => true, :required => true))
      end)
    end

    it 'has expected DOM structure' do
      output_buffer.should_not have_tag('.radio.form-group')
      output_buffer.should have_tag('form div.radio_buttons.form-group label.control-label', :count => 1)
      # output_buffer.should have_tag('form div.email.form-group span.form-wrapper', :count => 1)
      # output_buffer.should have_tag('form div.radio_buttons.form-group input.form-control', :count => 1)
    end

    # We decided not to do label.choice because it is outside of the scope of our project.
    describe "each choice" do
      it 'check inner radio and label for each choice' do
        output_buffer.should have_tag('form div.radio_buttons.form-group  div.radio label input')
      end
    end
  end
end
