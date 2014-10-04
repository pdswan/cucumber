module Cucumber
  module Cli
    module BetterOptions
      module CommandDefinitions
        class Version
          def initialize(output_stream)
            @output_stream = output_stream
          end

          def to_option_parser_args
            [
              :on_tail,
              "--version",
              "Show version."
            ]
          end

          def run(_)
            output_stream.puts Cucumber::VERSION
            Kernel.exit(0)
          end

          private

          attr_reader :output_stream
        end
      end
    end
  end
end
