module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Tags
          def initialize(*); end

          def base_value
            []
          end

          def to_option_parser_args
            [
              :on,
              "-t TAG_EXPRESSION",
              "--tags TAG_EXPRESSION",
              "Only execute the features or scenarios with tags matching TAG_EXPRESSION.",
              "Scenarios inherit tags declared on the Feature level. The simplest",
              "TAG_EXPRESSION is simply a tag. Example: --tags @dev. When a tag in a tag",
              "expression starts with a ~, this represents boolean NOT. Example: --tags ~@dev.",
              "A tag expression can have several tags separated by a comma, which represents",
              "logical OR. Example: --tags @dev,@wip. The --tags option can be specified",
              "several times, and this represents logical AND. Example: --tags @foo,~@bar --tags @zap.",
              "This represents the boolean expression (@foo || !@bar) && @zap.",
              "\n",
              "Beware that if you want to use several negative tags to exclude several tags",
              "you have to use logical AND: --tags ~@fixme --tags ~@buggy.",
              "\n",
              "Positive tags can be given a threshold to limit the number of occurrences.",
              "Example: --tags @qa:3 will fail if there are more than 3 occurrences of the @qa tag.",
              "This can be practical if you are practicing Kanban or CONWIP."
            ]
          end

          def append(existing, value)
            existing << value
          end

          def key
            :tag_expressions
          end
        end
      end
    end
  end
end
