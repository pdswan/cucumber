require_relative "command_definitions/I18n"
require_relative "command_definitions/version"

module Cucumber
  module Cli
    module BetterOptions
      module CommandDefinitions
        module_function

        def build(output_stream)
          [
            I18n.new(output_stream),
            Version.new(output_stream)
          ]
        end
      end
    end
  end
end
