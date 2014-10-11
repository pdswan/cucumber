module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Exclude
          include Values::Array

          def initialize(*); end

          def to_option_parser_args
            [
              :on,
              "-e",
              "--exclude PATTERN",
              "Don't run feature files or require ruby files matching PATTERN"
            ]
          end

          def append(existing, value)
            super(existing, Regexp.new(value))
          end

          def key
            :excludes
          end

          def default
            []
          end
        end
      end
    end
  end
end
