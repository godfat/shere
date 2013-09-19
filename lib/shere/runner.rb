
module Shere; end
module Shere::Runner
  module_function
  def options
    @options ||=
    [['-p, --port PORT', 'Which port Nginx should listen on (default 4331)'],
     ['-o, --host HOST', 'Which host Nginx should use       (default _)'   ],
     ['-u, --user USER', 'Which user Nginx should use' \
                                              ' (if having root privilege)'],
     ['    --help'     , 'Print this message'                              ],
     ['-v, --version'  , 'Print the version'                               ]]
  end

  def run argv=ARGV.dup
    opts = parse(argv)
    require 'shere'
    Shere.run(opts)
  end

  def parse argv
    opts = {}
    until argv.empty?
      case arg = argv.shift
      when /^-p=?(.+)?/, /^--port=?(.+)?/
        opts[:port] = $1 || argv.shift

      when /^-o=?(.+)?/, /^--host=?(.+)?/
        opts[:host] = $1 || argv.shift

      when /^-u=?(.+)?/, /^--user=?(.+)?/
        opts[:user] = $1 || argv.shift

      when '-h', '--help'
        puts(help)
        exit

      when '-v', '--version'
        require 'shere/version'
        puts(Shere::VERSION)
        exit

      else
        opts[:root] = arg
      end
    end
    opts
  end

  def help
    optt = options.transpose
    maxn = optt.first.map(&:size).max
    maxd = optt.last .map(&:size).max
    "Usage: shere ROOT\n" +
    options.map{ |(name, desc)|
      if desc.empty?
        name
      else
        sprintf("  %-*s  %-*s", maxn, name, maxd, desc)
      end
    }.join("\n")
  end
end
