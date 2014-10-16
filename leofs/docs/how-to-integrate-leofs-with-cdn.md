## How to integrate LeoFS with CDN
There is nothing special to do for integrating LeoFS with CDN.
Since almost CDN service providers take care of a CacheControl Header received from a Origin to determine how long a file should be cached on their edge servers,
So if you want to modify TTL according to URLs, 
you can do it by using `http_custom_header.conf`.

## How to use `http_custom_header.conf`

- Append the following line to your `leo_gateway.conf`

```ini
http.headers_config_file = ./etc/http_custom_header.conf
```

- Arrange the `http_custom_header.conf` into the path specified at `leo_gateway.conf`

## How to write `http_custom_header.conf`
The syntax is a subset of a Nginx configuration.
You can use location contexts to specify TTL and add any headers by the path like this.

```nginx
location bucket/static {
    expires    12h;
    add_header Cache-Control public;
    add_header X-OriginalHeader OriginalValue;
}
```

In this case, assuming that a CDN service already have been enabled and thare is a file at `bucket/static/path_to_file`,
if a user browse that file via the CDN, the CDN will receive a response from the Origin(LeoFS) with customized http headers like this.

```mime
Cache-Control: public, max-age=43200;
X-OriginalHeader: OriginalValue;
```

As a result, the CDN cache that file for 12 hours and forward the response with the customized http headers to the user.

## Usecases
- Specify TTL by the bucket
```nginx
location bucket1 {
    expires    1h;
    add_header Cache-Control public;
}
location bucket2 {
    expires    1d;
    add_header Cache-Control public;
}
location bucket3 {
    expires    1h30m;
    add_header Cache-Control private;
}
```

## Appendix

### Syntax for the expire field
LeoFS supports a part of [measurement units](http://nginx.org/en/docs/syntax.html) which can be used in Nginx configuration.
Following time intervals can be specified.
- s seconds
- m minutes
- h hours
- d days

### List of verified CDN services
LeoFS development team tested the following CDN services with LeoFS.
But other CDN services also should work.
If you have some troubles, please let us know.

- [AWS CloudFront](http://aws.amazon.com/cloudfront/)
