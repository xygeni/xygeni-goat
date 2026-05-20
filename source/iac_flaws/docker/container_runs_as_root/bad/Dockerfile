FROM alpine:3.16.3

# Create a group and a non root user
RUN addgroup -g 1000 -S my_user && adduser -u 1000 -S my_user -G my_user

# Set non root user
USER root:root

ENTRYPOINT ["my_tool"]
CMD ["--help"]
