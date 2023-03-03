# gst-rtsp-docker

[![version)](https://img.shields.io/docker/v/crashvb/gst-rtsp/latest)](https://hub.docker.com/repository/docker/crashvb/gst-rtsp)
[![image size](https://img.shields.io/docker/image-size/crashvb/gst-rtsp/latest)](https://hub.docker.com/repository/docker/crashvb/gst-rtsp)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/gst-rtsp-docker.svg)](https://github.com/crashvb/gst-rtsp-docker/blob/master/LICENSE.md)

## Overview

This docker image contains [GStreamer RTSP Server](https://gst-rtsp.freedesktop.org/modules/gst-rtsp-server.html).

## Entrypoint Scripts

### gst-rtsp

The embedded entrypoint script is located at `/etc/entrypoint.d/gst-rtsp` and performs the following actions:

1. The PKI certificates are generated or imported.
2. A new gstremer configuration is generated using the following environment variables:

 | Variable | Default Value | Description |
 | -------- | ------------- | ----------- |

## Standard Configuration

### Container Layout

```
/
├─ etc/
│  ├─ entrypoint.d/
│  │  └─ gst-rtsp
│  ├─ healthcheck.d/
│  │  └─ gst-rtsp
│  └─ gst-rtsp/
└─ run/
   └─ secrets/
      ├─ gst-rtsp.crt
      ├─ gst-rtsp.key
      └─ gst-rtspca.crt
```

### Exposed Ports

* `554/tcp` - RTSP listening port.

### Volumes

* `/etc/gst-rtsp` - gst-rtsp configuration directory.

## Development

[Source Control](https://github.com/crashvb/gst-rtsp-docker)

