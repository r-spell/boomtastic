# encoding: utf-8
require 'spec_helper'

describe 'password input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    concat(semantic_form_for(@new_post) do |builder|
      concat(builder.input(:title, :as => :password))
    end)
  end

  describe "when no object is provided" do
    before do
      concat(semantic_form_for(:project, :url => 'http://test.host/') do |builder|
        concat(builder.input(:title, :as => :password))
      end)
    end

    it 'has expected dom structure' do
      output_buffer.should have_tag('form div.form-group input.form-control', count: 2) # not really sure why it occurs twice, TBH
    end
  end
end

