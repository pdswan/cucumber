module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Profiles
          include Values::Array

          def initialize(*); end

          def to_option_parser_args
            [
              :on,
              "-p PROFILE",
              "--profile PROFILE",
              "Pull commandline arguments from cucumber.yml which can be defined as",
              "strings or arrays.  When a 'default' profile is defined and no profile",
              "is specified it is always used. (Unless disabled, see -P below.)",
              "When feature files are defined in a profile and on the command line",
              "then only the ones from the command line are used."
            ]
          end

          def key
            :profiles
          end

          def default
            ["default"]
          end
        end
      end
    end
  end
end
