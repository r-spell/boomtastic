# encoding: utf-8
require 'spec_helper'

describe 'number input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    @new_post.class.stub(:validators_on).with(:title).and_return([
      active_model_numericality_validator([:title], {:only_integer=>false, :allow_nil=>false, :greater_than=>2})
    ])
  end

  describe "all cases" do

    before do
      concat(
      semantic_form_for(@new_post) do |builder|
        concat(builder.input(:title, :as => :number))
      end
      )
    end

    it 'has expected DOM structure' do
      output_buffer.should_not have_tag('label.label')
      output_buffer.should have_tag('form div.form-group.number.input label.control-label', :count => 1)
      output_buffer.should have_tag('form div.form-group.number.input input', :count => 1)
    end

  end

end

