FROM crashvb/supervisord:202201080446@sha256:8fe6a411bea68df4b4c6c611db63c22f32c4a455254fa322f381d72340ea7226 as builder
RUN docker-apt build-essential git libgstrtspserver-1.0-dev && \
	git clone https://github.com/johnnyxwan/gst-rtsp-cli.git && \
	cd gst-rtsp-cli && \
	make

FROM crashvb/supervisord:202201080446@sha256:8fe6a411bea68df4b4c6c611db63c22f32c4a455254fa322f381d72340ea7226
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:8fe6a411bea68df4b4c6c611db63c22f32c4a455254fa322f381d72340ea7226" \
	org.opencontainers.image.base.name="crashvb/supervisord:202201080446" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Image containing GStreamer RTSP Server." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/gst-rtsp-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/gst-rtsp" \
	org.opencontainers.image.url="https://github.com/crashvb/gst-rtsp-docker"

# Install packages, download files ...
#RUN docker-apt libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio ssl-cert
COPY --from=builder /gst-rtsp-cli/dist/gst-rtsp-cli /usr/local/bin/
COPY gst-rtsp-wrapper /usr/local/bin/
RUN docker-apt gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools gstreamer1.0-libav gstreamer1.0-rtsp libgstrtspserver-1.0-0

# Configure: gst-rtsp
ENV GST_RTSP_CONFIG=/etc/gst-rtsp
RUN mkdir --parent ${GST_RTSP_CONFIG}

# Configure: supervisor
COPY supervisord.gst-rtsp.conf /etc/supervisor/conf.d/gst-rtsp.conf

# Configure: entrypoint
#COPY entrypoint.gst-rtsp /etc/entrypoint.d/gst-rtsp

# Configure: healthcheck
COPY healthcheck.gst-rtsp /etc/healthcheck.d/gst-rtsp

EXPOSE 554/tcp

VOLUME ${GST_RTSP_CONFIG}
