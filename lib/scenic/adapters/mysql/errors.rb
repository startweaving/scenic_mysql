module Scenic
  module Adapters
    class Mysql
      # Raised when a materialized view operation is attempted on a database
      # version that does not support materialized views.
      #
      class MaterializedViewsNotSupportedError < StandardError
        def initialize
          super("Materialized views not yet supported for MySQL")
        end
      end

      # Raised when attempting a concurrent materialized view refresh on a
      # database version that does not support that.
      #
      # Concurrent materialized view refreshes are supported on Postgres 9.4 or
      # newer.
      class ConcurrentRefreshesNotSupportedError < StandardError
        def initialize
          super("Concurrent refreshes not yet supported for MySQL")
        end
      end
    end
  end
end
