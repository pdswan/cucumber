module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Snippets
          include Values::Single

          def initialize(*); end

          def key
            :snippets
          end

          def to_option_parser_args
            [
              :on,
              "-i",
              "--no-snippets",
              "Don't print snippets for pending steps."
            ]
          end

          def default
            true
          end
        end
      end
    end
  end
end
