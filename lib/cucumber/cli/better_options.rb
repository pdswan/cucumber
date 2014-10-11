require_relative "better_options/option_definitions"
require_relative "better_options/command_definitions"

require "pry"

module Cucumber
  module Cli
    module BetterOptions
      class Parser
        def initialize(option_definitions, command_definitions)
          @option_definitions = option_definitions
          @command_definitions = command_definitions
        end

        # IDEA
        # BetterOptions becomes Configuration
        # Configuration encompasses options, commands, and environment variables
        def parse(original_args, base_values = option_definitions.base_values)
          args = original_args.dup

          base_values.tap do |options|
            OptionParser.new do |option_parser|
              command_definitions.each do |definition|
                option_parser.public_send(*definition.to_option_parser_args) do |value|
                  definition.run(value)
                end
              end

              option_definitions.each do |definition|
                option_parser.public_send(*definition.to_option_parser_args) do |value|
                  options[definition.key] = definition.append(options[definition.key], value)
                end
              end
            end.parse!(args)

            options[:env_vars] = parse_env_vars(args)
            options[:paths] = build_paths(args, options)
          end
        end

        private

        attr_reader :option_definitions
        attr_reader :command_definitions

        def parse_env_vars(args)
          { }.tap do |env|
            args.delete_if do |arg|
              (arg =~ /^(\w+)=(.*)$/).tap do |match|
                env[$1] = $2 if match
              end
            end
          end
        end

        def build_paths(paths, options)
          paths.map do |path|
            [path, options[:lines]].compact.join(":")
          end
        end
      end

      module_function

      def command_definitions(output_stream)
        CommandDefinitions.build(output_stream)
      end

      def option_definitions(output_stream)
        OptionDefinitions.build(output_stream)
      end

      def from_args(args, output_stream = STDOUT)
        options = Parser.new(
          option_definitions(output_stream),
          command_definitions(output_stream)
        ).parse(args)
      end

      def merge(a, b)
        { }.tap do |merged|
          option_definitions.each do |definition|
            merged.tap do |merged|
              merged[definition.key] = definition.append(a[definition.key], b[definition.key])
            end
          end
        end
      end

      def defaults
        options_definitions.defaults
      end

      def from_profile(profile, profile_loader = ProfileLoader.new)
        from_args(profile_loader.args_from(profile))
      end

      def add_defaults(options)
        options.tap do |options_with_defaults|
          options_definitions.each do |definition|
            if definition.unset?(options_with_defaults[definition.key])
              options_with_defaults[definition.key] = definition.default
            end
          end
        end
      end
    end
  end
end
