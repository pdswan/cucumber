module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Exclude
          def initialize(*); end

          def base_value
            []
          end

          def to_option_parser_args
            [
              :on,
              "-e",
              "--exclude PATTERN",
              "Don't run feature files or require ruby files matching PATTERN"
            ]
          end

          def append(existing, value)
            existing << Regexp.new(value)
          end

          def key
            :excludes
          end
        end
      end
    end
  end
end
