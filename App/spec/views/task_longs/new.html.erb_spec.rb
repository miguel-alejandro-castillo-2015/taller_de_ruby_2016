require 'rails_helper'

RSpec.describe "task_longs/new", type: :view do
  before(:each) do
    assign(:task_long, TaskLong.new())
  end

  it "renders new task_long form" do
    render

    assert_select "form[action=?][method=?]", task_longs_path, "post" do
    end
  end
end
