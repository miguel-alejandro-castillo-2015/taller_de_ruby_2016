require 'rails_helper'

RSpec.describe "task_temps/new", type: :view do
  before(:each) do
    assign(:task_temp, TaskTemp.new(
      :porcentaje_avance => 1
    ))
  end

  it "renders new task_temp form" do
    render

    assert_select "form[action=?][method=?]", task_temps_path, "post" do

      assert_select "input#task_temp_porcentaje_avance[name=?]", "task_temp[porcentaje_avance]"
    end
  end
end
