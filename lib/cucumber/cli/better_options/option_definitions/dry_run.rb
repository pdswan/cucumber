module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class DryRun
          include Values::Single

          def initialize(*); end

          def key
            :dry_run
          end

          def to_option_parser_args
            [
              :on,
              "-d",
              "--dry-run",
              "Invokes formatters without executing the steps."
            ]
          end

          def default
            false
          end
        end
      end
    end
  end
end
