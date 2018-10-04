{ pkgs ? import <nixpkgs> {} }: {
  asql = pkgs.callPackage ./asql.nix {};
  x11 = pkgs.recurseIntoAttrs (pkgs.callPackages ./x11 {});
  pb_cli = pkgs.runCommand "pb" {} ''
    install -Dm 555 ${builtins.fetchurl {
      url = https://raw.githubusercontent.com/ptpb/pb_cli/5242382b3d6b5c0ddaf6e4843a69746b40866e57/src/pb.sh;
      sha256 = "146cfsy3mxlzkx8m20fqzrswvgkj2vfgfqrjd0kl6lca33iw758m";
    }} $out/bin/pb
    runHook fixupPhase
  '';
}
