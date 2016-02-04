module Scenic
  module Adapters
    class Mysql

      module TablesDefinition

        def tables(name = nil, database = nil, like = nil)
          sql = "SELECT table_name FROM information_schema.tables"

          wheres = ["table_type = 'BASE TABLE'"]

          if database
            wheres << "table_schema = #{quote_table_name(database)}"
          else
            wheres << "table_schema = SCHEMA()"
          end
          wheres << "table_name LIKE #{quote(like)}" if like

          sql << " WHERE #{wheres.join(' AND ')}" if wheres.present?

          execute_and_free(sql, 'SCHEMA') do |result|
            result.collect { |field| field.first }
          end
        end
      end
    end
  end
end
