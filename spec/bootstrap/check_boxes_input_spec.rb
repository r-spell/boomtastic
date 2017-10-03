# encoding: utf-8
require 'spec_helper'

describe 'check_boxes input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe 'for a has_many association' do
    before do
      @output_buffer = ''
      mock_everything

      concat(semantic_form_for(@fred) do |builder|
        concat(builder.input(:posts, :as => :check_boxes, :value_as_class => true, :required => true))
      end)
    end

    it 'has a working output buffer, yo yo' do
      output_buffer.should_not have_tag('form div.choice label.label')
      output_buffer.should have_tag('form div.check_boxes.form-group label.control-label', :count => 1)
      # output_buffer.should have_tag('form div.form-group', :count => 1)
      # output_buffer.should have_tag('form div.form-group span.form-wrapper label', :count => 1)
      # output_buffer.should have_tag('form div.form-group span.form-wrapper label', :count => 1)
      # output_buffer.should have_tag('form div.form-group span.form-wrapper label', :count => 1)
      # output_buffer.should have_tag('form div.form-group span.form-wrapper label', :count => 1)
    end

    describe "each choice" do
      it 'check checkbox and label for each choice' do
        output_buffer.should have_tag('form div.check_boxes.form-group  div.checkbox label.choice')
      end
    end
  end
end
