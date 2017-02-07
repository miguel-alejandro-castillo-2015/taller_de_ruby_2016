require 'rails_helper'

RSpec.describe "task_longs/index", type: :view do
  before(:each) do
    assign(:task_longs, [
      TaskLong.create!(),
      TaskLong.create!()
    ])
  end

  it "renders a list of task_longs" do
    render
  end
end
