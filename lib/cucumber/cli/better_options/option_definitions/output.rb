module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Output
          def initialize(*); end

          def base_value
            []
          end

          def to_option_parser_args
            [
              :on,
              "-o",
              "--out [FILE|DIR]",
              "Write output to a file/directory instead of STDOUT. This option",
              "applies to the previously specified --format, or the",
              "default format if no format is specified. Check the specific",
              "formatter's docs to see whether to pass a file or a dir."
            ]
          end

          def append(existing, value)
            existing.tap do |existing|
              existing << ["pretty", nil] if existing.empty?
              existing.last[1] = value
            end
          end

          def key
            :formats
          end
        end
      end
    end
  end
end
