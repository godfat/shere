
module Shere
  module_function
  def run opts={}
    root = File.expand_path(opts[:root] || '.')
    port = opts[:port] || 4331
    host = opts[:host] || '_'
    user = opts[:user]

    require 'tmpdir'
    tmpdir = Dir.mktmpdir
    File.open("#{tmpdir}/nginx.conf", 'w'){ |conf|
      conf.puts(nginx_config(root, port, host, user, tmpdir))
    }
    sh('nginx', '-c', "#{tmpdir}/nginx.conf")
    puts("PID: #{File.read("#{tmpdir}/nginx.pid")}")
    puts("http://#{local_ip}:#{port}")
  end

  def local_ip
    require 'socket'
    Socket.getaddrinfo(Socket.gethostname, 'echo', Socket::AF_INET)[0][3]
  end

  def root_privilege?
    require 'etc'
    Etc.getpwuid(Process.uid).name == 'root'
  end

  def sh *commands
    puts commands.join(' ')
    system(*commands)
  end

  def nginx_config root, port, host, user, tmpdir=Dir.mktmpdir
    if user
      if root_privilege?
        "user  #{user};\n"
      else
        puts "\e[31m[WARN] Since you don't have root privilege,"
        puts "       switching user to `#{user}' is not possible.\e[0m"
        ''
      end
    else
      ''
    end +
<<-NGINX
worker_processes  2;

error_log         #{tmpdir}/nginx_error.log;
pid               #{tmpdir}/nginx.pid;

events {
    worker_connections  1024;
}

http {
    #{nginx_mime_types}
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] $request '
                      '"$status" $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log                   #{tmpdir}/nginx_access.log  main;

    fastcgi_temp_path            #{tmpdir}/fcgi_temp;
    client_body_temp_path        #{tmpdir}/client_body 1 2;
    proxy_temp_path              #{tmpdir}/proxy_temp;

    client_header_timeout        10m;
    client_body_timeout          10m;
    send_timeout                 10m;

    connection_pool_size         256;
    client_header_buffer_size    1k;
    large_client_header_buffers  4 2k;
    request_pool_size            4k;

    output_buffers               1 32k;
    postpone_output              1460;

    sendfile                     on;
    tcp_nopush                   on;
    tcp_nodelay                  on;

    keepalive_timeout            75 20;
    ignore_invalid_headers       on;

    gzip                         on;
    gzip_min_length              1100;
    gzip_buffers                 4 8k;
    gzip_types                   text/plain text/css application/xhtml+xml application/javascript;

    server {
        listen                   #{port};
        server_name              #{host};
        index                    index.xhtml index.html index.htm;

        location / {
          root                   "#{root}";
          autoindex              on;
        }
    }
}
NGINX
  end

  def nginx_mime_types
<<-NGINX
types {
    # text
    text/plain                            txt;
    text/html                             html htm shtml;
    text/css                              css;
    text/xml                              xml;

    # images
    image/gif                             gif;
    image/jpeg                            jpeg jpg;
    image/png                             png;
    image/tiff                            tif tiff;
    image/vnd.microsoft.icon              ico;

    # common application
    application/atom+xml                  atom;
    application/rss+xml                   rss;
    application/xhtml+xml                 xhtml;

    application/javascript                js;
    application/postscript                ps eps ai;
    application/rtf                       rtf;

    application/x-shockwave-flash         swf;
    application/pdf                       pdf;
    application/java-archive              jar war ear;

    application/zip                       zip;
    application/x-gzip                    gz;
    application/x-tar                     tar;
    application/x-rar-compressed          rar;

    application/vnd.mozilla.xul+xml       xul;
    application/msword                    doc;
    application/vnd.ms-excel              xls;
    application/vnd.ms-powerpoint         ppt;

    # audio
    audio/midi                            mid midi kar;
    audio/mpeg                            mp3;
    audio/ogg                             ogg;
    audio/aac                             m4a;

    audio/vnd.rn-realaudio                ra;

    audio/x-wav                           wav;
    audio/x-ms-wma                        wma;

    # video
    video/mpeg                            mpeg mpg;
    video/quicktime                       mov;
    video/mp4                             mp4;

    video/x-ms-wmv                        wmv;
    video/x-ms-asf                        asx asf;
    video/x-aif                           aif aiff aifc;
    video/x-msvideo                       avi;

    # others
    text/mathml                           mml;
    text/vnd.sun.j2me.app-descriptor      jad;
    text/vnd.wap.wml                      wml;
    text/x-component                      htc;

    image/x-portable-pixmap               ppm;
    image/x-portable-graymap              pgm;
    image/x-portable-bitmap               pbm;
    image/x-portable-anymap               pnm;
    image/x-xwindowdump                   xwd;
    image/x-xpixmap                       xpm;
    image/x-xbitmap                       xbm;

    image/vnd.wap.wbmp                    wbmp;
    image/x-jng                           jng;
    image/x-ms-bmp                        bmp;

    video/3gpp                            3gpp 3gp;
    video/x-flv                           flv;
    video/x-mng                           mng;

    application/mac-binhex40              hqx;
    application/vnd.wap.wmlc              wmlc;

    application/x-cocoa                   cco;
    application/x-java-archive-diff       jardiff;
    application/x-java-jnlp-file          jnlp;
    application/x-makeself                run;
    application/x-perl                    pl pm;
    application/x-pilot                   prc pdb;

    application/x-redhat-package-manager  rpm;
    application/x-sea                     sea;
    application/x-stuffit                 sit;
    application/x-tcl                     tcl tk;
    application/x-x509-ca-cert            der pem crt;
    application/x-xpinstall               xpi;

    application/octet-stream              bin exe dll;
    application/octet-stream              deb;
    application/octet-stream              dmg;
    application/octet-stream              eot;
    application/octet-stream              iso img;
    application/octet-stream              msi msp msm;
}
NGINX
  end
end
