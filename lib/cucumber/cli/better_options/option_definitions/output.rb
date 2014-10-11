module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Output
          include Values::Array

          def initialize(*); end

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
            # FIXME
            # this value should just be set as an option
            # configuration can apply it post defaults
            existing.tap do |existing|
              existing << ["pretty", nil] if existing.empty?
              existing.last[1] = value
            end
          end

          def key
            :formats
          end

          def default
            []
          end
        end
      end
    end
  end
end
