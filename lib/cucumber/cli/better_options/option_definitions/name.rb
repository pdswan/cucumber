module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Name
          include Values::Array

          def initialize(*); end

          def to_option_parser_args
            [
              :on,
              "-n NAME",
              "--name NAME",
              "Only execute the feature elements which match part of the given name.",
              "If this option is given more than once, it will match against all the",
              "given names."
            ]
          end

          def append(existing, value)
            super(existing, Regexp.new(value))
          end

          def key
            :name_regexps
          end

          def default
            []
          end
        end
      end
    end
  end
end
