{ stdenv }:

{
  sddm-sugar-theme-custom = stdenv.mkDerivation rec {
    version = "0.1";
    name = "sddm-sugar-theme-custom";
    src = ./sddm/themes/sugar-candy;
    installPhase = ''
      mkdir -p $out/share/sddm/themes/sugar-candy/
      cp -r * $out/share/sddm/themes/sugar-candy/
    '';
  };
}
