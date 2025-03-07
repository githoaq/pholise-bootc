FROM quay.io/fedora/fedora-bootc:41
RUN dnf install -y [system agents] [dependencies] && dnf clean all
COPY [unpackaged application]
COPY [configuration files]
RUN [config scripts]