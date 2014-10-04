module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Backtrace
          def initialize(*); end

          def key
            :use_full_backtrace
          end

          def base_value
            false
          end

          def to_option_parser_args
            [
              :on,
              "-b",
              "--backtrace",
              "Show full backtrace for all errors."
            ]
          end

          def append(existing, value)
            value
          end
        end
      end
    end
  end
end
