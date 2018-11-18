# build cardano-node
FROM nixos/nix as builder

RUN nix-env -i git

ARG VERSION

RUN git clone --depth 1 -b release/${VERSION} https://github.com/input-output-hk/cardano-sl.git /root/cardano-sl

COPY nix.conf /etc/nix/nix.conf

RUN cd /root/cardano-sl \
	&& mkdir /root/out \
	&& nix-build -A connectScripts.mainnet.explorer > /root/out/cardano.path \
	&& nix-store --export $(nix-store -qR $(cat /root/out/cardano.path)) | bzip2 > /root/out/cardano.closure.bz2

# main image
FROM nixos/nix

COPY --from=builder /root/out /root/in
RUN bzcat /root/in/cardano.closure.bz2 | nix-store --import
RUN ln -s $(cat /root/in/cardano.path) /bin/run

RUN adduser -D -u 1000 runner
USER runner
WORKDIR /opt/data

ENTRYPOINT ["run"]
