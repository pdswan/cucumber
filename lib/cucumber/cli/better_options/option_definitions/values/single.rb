module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        module Values
          module Single
            def base_value
              nil
            end

            def append(a, b)
              b
            end
          end
        end
      end
    end
  end
end

