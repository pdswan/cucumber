module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        class Formats
          INDENT = ' ' * 53
          FORMATS = {
            'html'        => ['Cucumber::Formatter::Html',        'Generates a nice looking HTML report.'],
            'pretty'      => ['Cucumber::Formatter::Pretty',      'Prints the feature as is - in colours.'],
            'progress'    => ['Cucumber::Formatter::Progress',    'Prints one character per scenario.'],
            'rerun'       => ['Cucumber::Formatter::Rerun',       'Prints failing files with line numbers.'],
            'usage'       => ['Cucumber::Formatter::Usage',       "Prints where step definitions are used.\n" +
                              "#{INDENT}The slowest step definitions (with duration) are\n" +
                              "#{INDENT}listed first. If --dry-run is used the duration\n" +
                              "#{INDENT}is not shown, and step definitions are sorted by\n" +
                              "#{INDENT}filename instead."],
                              'stepdefs'    => ['Cucumber::Formatter::Stepdefs',    "Prints All step definitions with their locations. Same as\n" +
                                                "#{INDENT}the usage formatter, except that steps are not printed."],
                                                'junit'       => ['Cucumber::Formatter::Junit',       'Generates a report similar to Ant+JUnit.'],
                                                'json'        => ['Cucumber::Formatter::Json',        'Prints the feature as JSON'],
                                                'json_pretty' => ['Cucumber::Formatter::JsonPretty',  'Prints the feature as prettified JSON'],
                                                'debug'       => ['Cucumber::Formatter::Debug',       'For developing formatters - prints the calls made to the listeners.']
          }
          MAX_KEY_LENGTH = FORMATS.keys.map(&:length).max

          def initialize(output_stream)
            @output_stream = output_stream
          end

          def to_option_parser_args
            [
              :on,
              "-f FORMAT",
              "--format FORMAT",
              "How to format features (Default: pretty). Available formats:",
              *help_message
            ]
          end

          def key
            :formats
          end

          def append(existing, value)
            existing << [value, output_stream]
          end

          def base_value
            []
          end

          private

          attr_reader :output_stream

          def help_message
            FORMATS.map do |key, value|
              "  #{key}#{indentation_for(key)} : #{value}"
            end + [
                "Use --format rerun --out rerun.txt to write out failing",
                "features. You can rerun them with cucumber @rerun.txt.",
                "FORMAT can also be the fully qualified class name of",
                "your own custom formatter. If the class isn't loaded,",
                "Cucumber will attempt to require a file with a relative",
                "file name that is the underscore name of the class name.",
                "Example: --format Foo::BarZap -> Cucumber will look for",
                "foo/bar_zap.rb. You can place the file with this relative",
                "path underneath your features/support directory or anywhere",
                "on Ruby's LOAD_PATH, for example in a Ruby gem."
              ]
          end

          def indentation_for(key)
            " " * (MAX_KEY_LENGTH - key.length)
          end
        end
      end
    end
  end
end
