module Payroll
  module Controllers
    module Home
      class Index
        include Payroll::Action

        def call(_params)
          status 201, 'You are in Payroll home'
        end
      end
    end
  end
end
