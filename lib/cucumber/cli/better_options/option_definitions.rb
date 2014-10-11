require_relative "option_definitions/values/single"
require_relative "option_definitions/values/array"

require_relative "option_definitions/require"
require_relative "option_definitions/formats"
require_relative "option_definitions/output"
require_relative "option_definitions/tags"
require_relative "option_definitions/name"
require_relative "option_definitions/exclude"
require_relative "option_definitions/lines"
require_relative "option_definitions/snippet_type"
require_relative "option_definitions/snippets"
require_relative "option_definitions/dry_run"
require_relative "option_definitions/backtrace"
require_relative "option_definitions/profiles"
require_relative "option_definitions/no_profile"

module Cucumber
  module Cli
    module BetterOptions
      module OptionDefinitions
        module_function

        def build(output_stream)
          # TODO
          # remove output stream
          # from any of these that
          # don't need it
          Collection.new([
            Formats.new(output_stream),
            Require.new(output_stream),
            Output.new(output_stream),
            Tags.new(output_stream),
            Name.new(output_stream),
            Exclude.new(output_stream),
            Lines.new(output_stream),
            SnippetType.new(output_stream),
            Snippets.new(output_stream),
            DryRun.new(output_stream),
            Backtrace.new(output_stream),
            Profiles.new(output_stream),
            NoProfile.new(output_stream)
          ])
        end

        class Collection
          include Enumerable

          def initialize(definitions)
            @definitions = definitions
          end

          def each(&block)
            definitions.each(&block)
          end

          def base_values
            definitions.inject({ }) do |base_values, definition|
              base_values.tap do |base_values|
                base_values[definition.key] = definition.base_value
              end
            end
          end

          def defaults
            definitions.inject({ }) do |defaults, definition|
              defaults.tap do |defaults|
                defaults[definition.key] = definition.default
              end
            end
          end

          private

          attr_reader :definitions
        end
      end
    end
  end
end
