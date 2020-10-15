{ pkgs ? import <nixpkgs> {} }:
with builtins;
with pkgs;

rustPlatform.buildRustPackage rec {
  pname = "nix-rust-bin";
  version = "0.0.1";

  ignore = map toString [
    ./target
  ];

  src = filterSource (path: type: !elem path ignore) ./.;

  # Try to build once with `nix-build` then replace this with the expected hash.
  cargoSha256 = "1b13jwpf6fphba7ykmcza8wpvbwr0rxkw1qrnll56m4rwas91w2n";

  meta = with stdenv.lib; {
    description = "A hello world application with rust & nix.";
    license = licenses.unlicense;
    maintainers = [ "mp" ];
    platforms = platforms.all;
  };
}
