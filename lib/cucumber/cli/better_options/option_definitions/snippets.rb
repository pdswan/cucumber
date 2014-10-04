module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Snippets
          def initialize(*); end

          def key
            :snippets
          end

          def base_value
            true
          end

          def to_option_parser_args
            [
              :on,
              "-i",
              "--no-snippets",
              "Don't print snippets for pending steps."
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
