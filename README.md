# Scenic Mysql Adapter

This gem adds MySQL support for the wonderful [Scenic](https://github.com/thoughtbot/scenic) gem by Thoughtbot.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scenic'
gem 'scenic_mysql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scenic_mysql

## Usage

Add an initializer with the following code:

```ruby
# This code overwrites Mysql2Adapter's `database` method,
# which pulls back all tables with views.
#
# The new method returns only tables, without the views.
#
ActiveRecord::ConnectionAdapters::Mysql2Adapter.send(
  :include, Scenic::Adapters::Mysql::TablesDefinition
)

# Tell Scenic to use MySQL instead of the defaulted PostgreSQL.
Scenic.configure do |config|
  config.database = Scenic::Adapters::Mysql.new
end
```

Note that the adapter currently does not support materialized views for MySQL.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/startweaving/scenic_mysql.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
