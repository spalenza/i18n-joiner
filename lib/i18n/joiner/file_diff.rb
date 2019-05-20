require "deepsort"
require "hashdiff"

module I18n
  module Joiner
    class FileDiff
      def initialize(fallback_file, locale_file, output)
        @fallback_file = fallback_file
        @locale_file = locale_file
        @output = output
      end

      def resolve_file!
        return if locale_file.nil?
        unless diff_hash.empty?
          binding.pry
          raise 'afdsa'
        end
        # delete_file
      end

      private

      attr_reader :fallback_file, :locale_file, :output

      def diff_hash
        return @diff_hash if defined?(@diff_hash)
        fallback_hash = load_file(fallback_file)
        locale_hash = load_file(locale_file)

        @diff_hash = HashDiff.
          diff(fallback_hash, locale_hash, case_insensitive: true, strip: true)
      end

      def load_file(file_path)
        _, hash = YAML::load_file(File.new(file_path)).
          deep_sort.
          shift

        hash
      end
    end
  end
end
