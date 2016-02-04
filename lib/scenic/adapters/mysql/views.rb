module Scenic
  module Adapters
    class Mysql

      # Fetches defined views from the mysql connection.
      # @api private
      class Views
        def initialize(connection)
          @connection = connection
        end

        def current_database
          @connection.current_database
        end

        # All of the views that this connection has defined.
        #
        # This will include materialized views if those are supported by the
        # connection.
        #
        # @return [Array<Scenic::View>]
        def all
          views_from_mysql.map(&method(:to_scenic_view))
        end

        private

        attr_reader :connection

        def views_from_mysql
          connection.select_rows(<<-SQL)
            SELECT table_name, view_definition
            FROM information_schema.views
            WHERE table_schema = SCHEMA()
          SQL
        end

        def to_scenic_view(result)
          table_name, view_def = result

          Scenic::View.new(
            name: table_name,
            definition: scrub_view_def(view_def)
          )
        end

        # Sometimes MySQL will include the database name
        # in view definitions.  This scrubs it out.
        #
        def scrub_view_def(view_def)
          view_def.strip.gsub(/([\`]*#{current_database}[\`]*\.)/i, '')
        end
      end
    end
  end
end
