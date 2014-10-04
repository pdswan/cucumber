module Cucumber
  module Cli
    module BetterOptions
      module CommandDefinitions
        class I18n
          def initialize(output_stream)
            @output_stream = output_stream
          end

          def to_option_parser_args
            [
              :on,
              "--i18n LANG",
              "List keywords for in a particular language",
              "Run with \"i18n help\" to see all languages"
            ]
          end

          def run(lang)
            if lang == "help"
              list_languages_and_exit
            else
              list_keywords_and_exit(lang)
            end
          end

          private

          attr_reader :output_stream

          def list_keywords_and_exit(lang)
            require 'gherkin/i18n'
            output_stream.write(Gherkin::I18n.get(lang).keyword_table)
            Kernel.exit(0)
          end

          def list_languages_and_exit
            require 'gherkin/i18n'
            output_stream.write(Gherkin::I18n.language_table)
            Kernel.exit(0)
          end
        end
      end
    end
  end
end
