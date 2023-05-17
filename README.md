# gst-rtsp-docker

[![version)](https://img.shields.io/docker/v/crashvb/gst-rtsp/latest)](https://hub.docker.com/repository/docker/crashvb/gst-rtsp)
[![image size](https://img.shields.io/docker/image-size/crashvb/gst-rtsp/latest)](https://hub.docker.com/repository/docker/crashvb/gst-rtsp)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/gst-rtsp-docker.svg)](https://github.com/crashvb/gst-rtsp-docker/blob/master/LICENSE.md)

## Overview

This docker image contains [GStreamer RTSP Server](https://gst-rtsp.freedesktop.org/modules/gst-rtsp-server.html).

## Entrypoint Scripts

None.

## Standard Configuration

### Container Layout

```
/
└─ etc/
   ├─ healthcheck.d/
   │  └─ gst-rtsp
   ├─ gst-rtsp/
   └─ supervisor/
      └─ config.d/
         └─ gst-rtsp.conf
```

### Exposed Ports

* `554/tcp` - RTSP listening port.

### Volumes

* `/etc/gst-rtsp` - gst-rtsp configuration directory.

## Development

[Source Control](https://github.com/crashvb/gst-rtsp-docker)

