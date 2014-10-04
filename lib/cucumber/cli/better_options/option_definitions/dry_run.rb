module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class DryRun
          def initialize(*); end

          def key
            :dry_run
          end

          def base_value
            false
          end

          def to_option_parser_args
            [
              :on,
              "-d",
              "--dry-run",
              "Invokes formatters without executing the steps."
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
