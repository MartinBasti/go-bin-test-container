FROM registry.access.redhat.com/ubi8/go-toolset:1.19.13-2.1697656138 as builder

RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@latest



FROM scratch

COPY --from=builder  /opt/app-root/src/go/bin/gocyclo /gocyclo

ENTRYPOINT ["/gocyclo"]
