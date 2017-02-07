require 'rails_helper'

RSpec.describe "task_temps/index", type: :view do
  before(:each) do
    assign(:task_temps, [
      TaskTemp.create!(
        :porcentaje_avance => 2
      ),
      TaskTemp.create!(
        :porcentaje_avance => 2
      )
    ])
  end

  it "renders a list of task_temps" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
