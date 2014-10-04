module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class SnippetType
          def initialize(*); end

          def key
            :snippet_type
          end

          def base_value
            nil
          end

          def to_option_parser_args
            [
              :on,
              "-I",
              "--snippet-type TYPE",
              "Use different snippet type (Default: regexp). Available types:",
              *Cucumber::RbSupport::RbLanguage.cli_snippet_type_options
            ]
          end

          def append(existing, value)
            value.to_sym
          end
        end
      end
    end
  end
end
