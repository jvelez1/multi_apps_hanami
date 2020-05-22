require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/hr_system'
require_relative '../apps/web/application'
require_relative '../apps/payroll/application'
require_relative '../apps/employee/application'

Hanami.configure do
  mount Employee::Application, at: '/employee'
  mount Payroll::Application, at: '/payroll'
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/hr_system_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/hr_system_development'
    #    adapter :sql, 'mysql://localhost/hr_system_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/hr_system/mailers'

    # See https://guides.hanamirb.org/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
