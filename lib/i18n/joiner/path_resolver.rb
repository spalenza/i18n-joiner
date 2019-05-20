module I18n
  module Joiner
    class PathResolver
      def initialize(locales_path, fallback_locale, resolve_locale)
        @locales_path = locales_path
        @fallback_locale = fallback_locale
        @resolve_locale = resolve_locale
      end

      def match_files
        resolve_locale_files.map do |file|
          {
            fallback: find_fallback_file(file),
            resolve: file
          }
        end
      end

      private

      attr_reader :locales_path, :fallback_locale, :resolve_locale

      def find_fallback_file(file_path)
        path_file =
          "#{Pathname.new(file_path).dirname.to_s}/#{fallback_locale}.yml"

        fallback_files.find { |file| file == path_file }
      end

      def resolve_locale_files
        @resolve_locale_files ||=
          Dir["#{locales_path}/**/#{resolve_locale}.yml"]
      end

      def fallback_files
        @fallback_files ||=
          Dir["#{locales_path}/**/#{fallback_locale}.yml"]
      end
    end
  end
end
