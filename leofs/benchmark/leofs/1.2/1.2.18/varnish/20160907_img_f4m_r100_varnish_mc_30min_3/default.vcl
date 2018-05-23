vcl 4.0;
import std;

backend default_leofs {
    .host = "127.0.0.1";
    .port = "8080";
#    .connect_timeout = 0.1s;
#    .first_byte_timeout = 0.1s;

#    .probe = {
#        .url = "/admin/sys/wwwcheck.html";
#        .interval = 15s;
#        .timeout = 1s;
#        .window = 5;
#        .threshold = 5;
#    }
}



acl local_network {
    "localhost";
    "192.168.100.0"/24;
}

sub vcl_recv {
    #some header delete
    unset req.http.cookie;
    unset req.http.Pragma;

    #get head purge only
    if (req.method != "GET" &&
        req.method != "HEAD" &&
        req.method != "PURGE") {
            return (synth(403, "Get/Head/Purge Only"));
    }

    #PURGE method accept localhost and db-net network
    if (req.method == "PURGE") {
        if (!client.ip ~ local_network) {
            return (synth(403, "ACL"));
        }
        return (purge);
    }

    #head method -> GET method
    if (req.method == "HEAD") {
        set req.method = "GET";
        set req.http.magicmarker = "HEAD";
    }

    #dont show server status
    if (req.url ~ "^/server-status.*") {
        return (synth(403, "Server Status"));
    }

    #balancercheck
    if (req.url ~ "^/wwwcheck.html$") {
        set req.url = "/admin/sys/wwwcheck301.html";
        return (pass);
    }

    #netcoolcheck
    if (req.url ~ "^/healthcheck.html$") {
        set req.url = "/admin/sys/healthcheck.html";
        return (pass);
    }

    #robots.txt
    if (req.url ~ "^/robots.txt$") {
        set req.url = "/admin/app/robots.txt";
    }

    #favicon.ico
    if (req.url ~ "^/favicon.ico$") {
        set req.url = "/admin/app/favicon.ico";
    }

    #check cache
    return (hash);
}

sub vcl_hit {
    if (obj.ttl <= 0s) {
        return (pass);
    }

    if (obj.http.Content-Length ~ "^[1-9]") {
    } else {
        std.log ("[ERROR] incorrect cache");
        return (pass);
    }

    return (deliver);
}

sub vcl_miss {
    if (req.method == "PURGE") {
      return (synth(404, "Not in Cache."));
    }

    unset req.http.Accept;
    unset req.http.Accept-Charset;
    unset req.http.Accept-Encoding;
    unset req.http.Accept-Language;
    unset req.http.Cache-Control;
    unset req.http.Connection;
    unset req.http.Cookie;
    unset req.http.If-Modified-Since;
    unset req.http.Referer;
    unset req.http.User-Agent;
    unset req.http.Via;
    unset req.http.X-BlueCoat-Via;
    unset req.http.X-Forwarded-For;
    unset req.http.x-wap-profile;

    return (fetch);
}

sub vcl_backend_response {
    if (bereq.url ~ "html$" || bereq.url ~ "css$" || bereq.url ~ "js$" || bereq.url ~ "txt$") {
        set beresp.do_gzip = true;
    }

    unset beresp.http.Set-Cookie;
    unset beresp.http.Expires;

    set beresp.http.Cache-Control = "max-age=0";
    if (bereq.url ~ "/test/pc/" || bereq.url ~ "/test/sp/" || bereq.url ~ "/test/manga/"
          || bereq.url ~ "/test/common/" || bereq.url ~ "/test/app/" || bereq.url ~ "/test/01/" || bereq.url ~ "/test/02/") {
        set beresp.ttl = 604800s;    # 604800s = 1week
        set beresp.http.Expires = "" + (now + beresp.ttl);
    }

    return (deliver);
}

sub vcl_deliver {
    #unset resp.http.Etag;
    #unset resp.http.Pragma;
    unset resp.http.Via;
    unset resp.http.X-Varnish;
    unset resp.http.X-Vary-Options;
    unset resp.http.X-Powered-By;

    set resp.http.server = "AMS/4.0";
    set resp.http.X-Content-Type-Options = "nosniff";

    return (deliver);
}

sub vcl_backend_error {
    synthetic ("");
    return (deliver);
}

