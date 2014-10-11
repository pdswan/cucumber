module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        module Values
          module Array
            def base_value
              []
            end

            def append(a, b)
              a << b
            end
          end
        end
      end
    end
  end
end

