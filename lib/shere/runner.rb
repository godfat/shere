
module Shere; end
module Shere::Runner
  module_function
  def options
    @options ||=
    [['-p, --port PORT', 'Which port Nginx should listen on (default 4331)'],
     ['-h, --host HOST', 'Which host Nginx should use       (default _)'   ],
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

      when /^-h=?(.+)?/, /^--host=?(.+)?/
        opts[:host] = $1 || argv.shift

      when '--help'
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
    maxn = options.transpose.first.map(&:size).max
    maxd = options.transpose.last .map(&:size).max
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
