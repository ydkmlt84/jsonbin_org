## NAME

[`MaintainerrJSONBin`](https://jsonbin.maintainerr.info) - A personal JSON store as a RESTful service

## SYNOPSIS

To save data, you'll first need to <a href="/_/login">sign in</a> to get an API key.

## DESCRIPTION

`MaintainerrJSONBin` is a personal key/value JSON store as a service. Protected behind authentication and API key requests, data is stored as JSON and can be deep linked. A permissioning model also allows specific paths to your store to become public to share with others.

The aim of the project is to provide a simplified data store for tinkerers.

**Important:** MaintainerrJSONBin is a fork of another project, and changed for Branding and to be placed in a Docker Container. If you have questions, please get [in touch](#author).

## Authentication

By default all user store data is protected behind auth either via browser sign in, or an `authorization` token. The token is your [`apikey`](/_/me/apikey). For example:

```
curl -X POST https://jsonbin.maintainerr.info/ \
     -H 'Authorization: token abcd-xyz-123' \
     -d '{ url: "https://maintainerr.info" }'
```

## Endpoints

A private namespace URL "`_`" is used for MaintainerrJSONBin specific endpoints:

* [`/_/help`](/_/help) This page.
* [`/_/login`](/_/login) Auth with github.
* [`/_/logout`](/_/logout) Clear your session.
* [`/_/me`](/_/me) Your full profile.
* [`/_/me/apikey`](/_/me/apikey) Your API key.
* [`/_/me/apikey`](/_/me/apikey) DELETE to revoke your current key.
* [`/_/me/username`](/_/me/username) Your username.
* [`/_/me/public`](/_/me/public) Your public paths.
* [`/_/me/:path`](/_/me/) Deep link to profile properties.

The following methods with your `authorization` header will access your data store against `https://jsonbin.maintainerr.info/:username/`:

* `GET` return given path mapped to a JSON path.
* `POST` store the payload (supports JSON and files).
* `PATCH` merge the payload with the endpoint.
* `DELETE` store path.

By default all endpoints are private, but you can modify a specific entry point to be public by default by changing the permissions:

* PUT `/:username/:path/_perms` make the `:path` public.
* DELETE `/:username/:path/_perms` make `:path` private.
* GET `/:username/:path/_perms` check permissions of `:path`.

Public endpoints accept `GET` requests without the `authorization` header.

## Example usage

You can use MaintainerrJSONBin as a shared clipboard across machines. Creating an alias to upload `STDIN` via `curl` could be posted to a public URL:

```
alias jsonbin="curl -X 'POST' \
      -H'authorization: token abcd-xyz-123' \
      -F'content=@-' \
      https://jsonbin.maintainerr.info/maintainerr/clipboard"
echo "foo" | jsonbin
```

## BUGS

This project lives at [github/jsonbin_org](https://github.com/ydkmlt84/jsonbin_org). Please report bugs to [github/jsonbin_org/issues](https://github.com/ydkmlt84/jsonbin_org/issues).

## AUTHOR
**Current** Author of THIS Fork -> 
ydkmlt84 &lt;[ydkmlt84@maintainerr.info](mailto:ydkmlt84@maintainerr.info)&gt;

**Original** Author of JSONBIN ->
Remy Sharp &lt;[Remy Sharp Github](https://github.com/remy)&gt;
