# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/index' do
  before do
    assign(:tasks, [
             Task.create!(
               title: 'Title',
               description: 'Description',
               user: nil,
               status: 'Status'
             ),
             Task.create!(
               title: 'Title',
               description: 'Description',
               user: nil,
               status: 'Status'
             )
           ])
  end

  it 'renders a list of tasks' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Status'.to_s), count: 2
  end
end
