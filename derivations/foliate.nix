{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  gettext,
  glib,
  gjs,
  ninja,
  gtk4,
  webkitgtk_6_0,
  gsettings-desktop-schemas,
  wrapGAppsHook4,
  desktop-file-utils,
  gobject-introspection,
  glib-networking,
  pkg-config,
  libadwaita,
}:
stdenv.mkDerivation rec {
  pname = "foliate";
  # version = "3.1.1";
  version = "3.3.0";

  src = fetchFromGitHub {
    # owner = "axlEscalada";
    owner = "johnfactotum";
    repo = "foliate";
    # rev = "884046bd12ec88ab9f8b2304752a78cafc16e47e";
    rev = "9ab7cf0f47dd67049357b8405cd88b30fa18d282";
    # sha256 = "sha256-3zYFSvbvhqmzNcNgicqpeULy4o7nyznSYM2k6hCL1Mk=";
    sha256 = "sha256-xOo+DVBWkJOCELDdCO7n909usU0JX2hNOrbAqNu7tLQ=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    desktop-file-utils
    gobject-introspection
    meson
    ninja
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    gettext
    gjs
    glib
    glib-networking
    gsettings-desktop-schemas
    gtk4
    libadwaita
    webkitgtk_6_0
  ];

  meta = with lib; {
    description = "A simple and modern GTK eBook reader";
    homepage = "https://johnfactotum.github.io/foliate";
    changelog = "https://github.com/axlEscalada/foliate/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ onny ];
    mainProgram = "foliate";
  };
}
