module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Lines
          include Values::Single

          def initialize(*); end

          def key
            :lines
          end

          def to_option_parser_args
            [
              :on,
              "-l",
              "--lines LINES",
              "Run given line numbers. Equivalent to FILE:LINE syntax"
            ]
          end

          def default
            nil
          end
        end
      end
    end
  end
end
