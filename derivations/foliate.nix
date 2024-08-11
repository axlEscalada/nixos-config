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
  version = "3.1.1";

  src = fetchFromGitHub {
    owner = "axlEscalada";
    repo = "foliate";
    rev = "884046bd12ec88ab9f8b2304752a78cafc16e47e";
    sha256 = "sha256-3zYFSvbvhqmzNcNgicqpeULy4o7nyznSYM2k6hCL1Mk=";
    fetchSubmodules = true;
  };

  # Explicitly fetch submodules
  # postFetch = ''
  #   cd $out
  #   git submodule init
  #   git submodule update
  # '';
  #
  # preBuild = ''
  #   echo "Contents of src/foliate-js:"
  #   ls -la src/foliate-js
  #   if [ ! -f src/foliate-js/comic-book.js ]; then
  #     echo "Error: comic-book.js not found in src/foliate-js/"
  #     echo "Current directory contents:"
  #     ls -R
  #     exit 1
  #   fi
  # '';

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
    maintainers = with maintainers; [onny];
    mainProgram = "foliate";
  };
}
