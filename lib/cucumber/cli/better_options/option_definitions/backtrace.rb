module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Backtrace
          include Values::Single

          def initialize(*); end

          def key
            :use_full_backtrace
          end

          def to_option_parser_args
            [
              :on,
              "-b",
              "--backtrace",
              "Show full backtrace for all errors."
            ]
          end

          def unset?(existing)
            existing == base_value
          end

          def default
            false
          end
        end
      end
    end
  end
end
