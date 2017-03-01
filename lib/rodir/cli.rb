module Rodir
  class CLI
    class << self
      def run
        otree = ObjectTree.create(BasicObject)
        tree = otree.tree
        modules = ObjectSpace.each_object(Module).to_a

        require 'readline'
        require 'pathname'

        current = { path: Pathname.new("BasicObject"), klass: BasicObject }
        Readline.completion_append_character = nil
        Readline.completion_proc = proc { |word| tree[current[:path].to_s].map(&:to_s).grep(/\A#{Regexp.quote word}/) }
        Readline.completion_case_fold = true

        while input = Readline.readline("Ruby@#{RUBY_VERSION} /#{current[:path]}$ ", true)
          result = parse_command(input)
          command = result[:command]
          entries = tree[current[:path].to_s]

          case command
            when /exit|quit/
              break
            when /cls|clear/
              puts "\e[H\e[2J"
            when /ls|dir/
              entries.each do |klass|
                if klass.instance_of?(Class)
                  puts %Q(<#{"C".colorize(:green)}>\t#{klass})
                else
                  puts %Q(<#{"M".colorize(:red)}>\t#{klass})
                end
              end
            when /pwd/
              puts current[:path]
            when /whoami/
              puts current[:klass]
            when /methods/
              puts current[:klass].instance_methods(false).map(&:to_sym)
            when /tree/
              puts ObjectTree.create(current[:klass])
            when /cd/
              path = current[:path] + result[:args]

              if tree[path.to_s].nil?
                puts "cd: no such class or module: #{result[:args]}"
              else
                current = { path: path, klass: modules.find { |k| k.to_s == path.basename.to_s } }
              end
            else
              if !command.empty?
                puts "`#{command}' command not found"
              end
          end

          Readline.completion_proc = proc { |word| tree[current[:path].to_s].map(&:to_s).grep(/\A#{Regexp.quote word}/) }
        end
      end

      def parse_command(input)
        /\A(?<command>[a-zA-Z]+)(?<args>[[:space:]]+.*)?\Z/ =~ input.chomp
        { command: command.to_s, args: args.to_s.strip }
      end
    end
  end
end
