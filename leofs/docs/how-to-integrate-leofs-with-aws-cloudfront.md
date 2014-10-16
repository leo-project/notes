## How to integrate LeoFS with AWS CloudFront
There is nothing to do for integrating LeoFS with AWS CloudFront.
If you want to customize TTL by the Origin, You can customize TTL on AWS Web Console.
If you want to customize TTL in units finer than the Origin, 
It's time to use `http_custom_header.conf`.

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

In this case, assuming that AWS CloudFront settings already have been enabled and thare is a file at `bucket/static/path_to_file`,
if a user browse that file via AWS CloudFront, AWS CloudFront will receive a response from the Origin(LeoFS) with customized http headers like this.

```mime
Cache-Control: public, max-age=43200;
X-OriginalHeader: OriginalValue;
```

As a result, AWS CloudFront cache that file for 12 hours and forward the response with the customized http headers to the user.

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

