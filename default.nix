with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "quick-vpn";

  buildInputs = [
    pkgs.makeWrapper
  ];

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/bin/qv $out/bin
  '';

  postFixup = ''
    wrapProgram $out/bin/qv \
      --set PATH ${lib.makeBinPath [
      findutils
      fzf
      gawk
      gnugrep
      networkmanager
    ]}
  '';
}
