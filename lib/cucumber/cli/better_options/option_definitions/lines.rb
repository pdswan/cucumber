module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Lines
          def initialize(*); end

          def key
            :lines
          end

          def base_value
            nil
          end

          def to_option_parser_args
            [
              :on,
              "-l",
              "--lines LINES",
              "Run given line numbers. Equivalent to FILE:LINE syntax"
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
