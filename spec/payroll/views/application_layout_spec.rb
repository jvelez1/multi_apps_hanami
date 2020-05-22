require "spec_helper"

RSpec.describe Payroll::Views::ApplicationLayout, type: :view do
  let(:layout)   { Payroll::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('Payroll')
  end
end
