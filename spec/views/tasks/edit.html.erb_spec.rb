# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/edit' do
  let(:task) do
    Task.create!(
      title: 'MyString',
      description: 'MyString',
      user: nil,
      status: 'MyString'
    )
  end

  before do
    assign(:task, task)
  end

  it 'renders the edit task form' do
    render

    assert_select 'form[action=?][method=?]', task_path(task), 'post' do
      assert_select 'input[name=?]', 'task[title]'

      assert_select 'input[name=?]', 'task[description]'

      assert_select 'input[name=?]', 'task[user_id]'

      assert_select 'input[name=?]', 'task[status]'
    end
  end
end
