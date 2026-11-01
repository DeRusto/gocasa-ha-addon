# Keep the tag equal to `version` in config.yaml.
FROM ghcr.io/derusto/gocasa:1.1.1 AS gocasa

# The upstream image is scratch and runs as UID 65532, but HA mounts /data owned by root
# and passes settings as /data/options.json, so wrap the binary in a small root shell image.
FROM alpine:3.22
RUN apk add --no-cache ca-certificates jq
COPY --from=gocasa /gocasa /gocasa
COPY run.sh /run.sh
ENV ADDR=:8080 DATA_DIR=/data
CMD ["/run.sh"]
