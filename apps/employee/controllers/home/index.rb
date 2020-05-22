module Employee
  module Controllers
    module Home
      class Index
        include Employee::Action

        def call(_params)
          status 201, 'You are in Employee home'
        end
      end
    end
  end
end
