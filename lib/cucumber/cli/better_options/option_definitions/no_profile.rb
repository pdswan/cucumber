module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class NoProfile
          include Values::Single

          def initialize(*); end

          def to_option_parser_args
            [
              :on,
              "-P",
              "--no-profile",
              "Disables all profile loading to avoid using the 'default' profile."
            ]
          end

          def key
            :disable_profile_loading
          end

          def default
            false
          end
        end
      end
    end
  end
end
