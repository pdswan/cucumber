module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Require
          include Values::Array

          def initialize(*); end

          def to_option_parser_args
            [
              :on,
              "-r LIBRARY|DIR",
              "--require LIBRARY|DIR",
              "Require files before executing the features. If this",
              "option is not specified, all *.rb files under",
              "the \"features\" directory will be loaded auto-",
              "matically. Automatic loading is disabled when this",
              "option is specified, and all loading becomes explicit.",
              "Files under directories named \"support\" are always",
              "loaded first.",
              "This option can be specified multiple times."
            ]
          end

          def append(existing, value)
            super.tap do |_|
              # TODO
              # this should go somewhere else
              if(Cucumber::JRUBY && File.directory?(value))
                require 'java'
                $CLASSPATH << value
              end
            end
          end

          def key
            :require
          end

          def default
            ["features"]
          end
        end
      end
    end
  end
end
