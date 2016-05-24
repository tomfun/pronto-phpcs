require 'pronto'
require 'json'

module Pronto
  class Phpcs < Runner
    def run
      return [] unless @patches

      @patches.select { |patch| patch.additions > 0 }
        .select { |patch| php_file?(patch.new_file_full_path) }
        .map { |patch| inspect(patch) }
        .flatten.compact
    end

    def inspect(patch)
      options = ENV["PHPCS_STANDARD"] ? ENV["PHPCS_STANDARD"] : "Symfony2"

      phpcs_out = `phpcs #{patch.new_file_full_path} --standard="#{options}" --report=json`
      phpcs_out = JSON.parse(phpcs_out)
      phpcs_out = phpcs_out["files"]
      phpcs_out = phpcs_out["#{patch.new_file_full_path}"]
      phpcs_out = phpcs_out["messages"]

      phpcs_out.map do |offence|
        patch.added_lines.select { |line| line.new_lineno == offence['line'] }
          .map { |line| new_message(offence, line) }
      end
    end

    def new_message(offence, line)
      path = line.patch.delta.new_file[:path]
      level = :warning

      Message.new(path, line, level, offence['message'], nil, self.class)
    end

    def php_file?(path)
      %w(.php .phar).include? File.extname(path)
    end
  end
end
