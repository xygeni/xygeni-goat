FROM scratch
ADD alpine-minirootfs-20220715-x86_64.tar.gz /
CMD ["/bin/sh"]

FROM alpine:edge as base

FROM alpine:3.16 as development

FROM alpine:3.16.2 as staging

FROM alpine@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad as production
