require "spec_helper"

RSpec.describe Employee::Views::ApplicationLayout, type: :view do
  let(:layout)   { Employee::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('Employee')
  end
end
