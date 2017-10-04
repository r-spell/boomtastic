# encoding: utf-8
require 'spec_helper'

describe 'date select input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

# Pretty much the same as few of formtastic-bootstrap tests but took out form-wrapper as we are not targeting it in our project
  describe "general" do

    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:year, :month, :day]))
      end)
    end

    it 'should have a label with the label text inside the form-group' do
      output_buffer.should have_tag('form div.form-group label.control-label', /Publish at/)
      output_buffer.should have_tag('form div.form-group label.control-label[@for="post_publish_at"]')
    end

    it 'should not associate the legend label with the first select' do
      output_buffer.should_not have_tag('form div.form-group label.control-label[@for="post_publish_at_1i"]')
    end

    it 'should not have three labels for year, month and day' do
      output_buffer.should_not have_tag('form div.form-group  label', :count => 3)
      output_buffer.should_not have_tag('form div.form-group label', /year/i)
      output_buffer.should_not have_tag('form div.form-group label', /month/i)
      output_buffer.should_not have_tag('form div.form-group label', /day/i)
    end

    it 'should have three selects for year, month and day' do
      output_buffer.should have_tag('form div.form-group select', :count => 3)
    end
  end
end
