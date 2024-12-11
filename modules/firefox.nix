{
  pkgs,
  username,
  ...
}: {
  # Firefox configuration
  home.file.".mozilla/firefox/default/user.js".text = ''
    // Desactivar la página de nueva pestaña por defecto
    user_pref("browser.newtabpage.enabled", false);
    user_pref("browser.startup.homepage", "about:blank");

    // Desactivar telemetría y reportes
    user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
    user_pref("browser.newtabpage.activity-stream.telemetry", false);
    user_pref("browser.ping-centre.telemetry", false);
    user_pref("toolkit.telemetry.enabled", false);
    user_pref("toolkit.telemetry.unified", false);

    // Mejorar privacidad
    user_pref("privacy.trackingprotection.enabled", true);
    user_pref("network.cookie.cookieBehavior", 1);
    user_pref("privacy.donottrackheader.enabled", true);

    // Desactivar autoplay de videos
    user_pref("media.autoplay.default", 5);
    user_pref("media.autoplay.blocking_policy", 2);

    // Mejorar rendimiento
    user_pref("browser.cache.disk.enable", true);
    user_pref("browser.cache.memory.enable", true);
    user_pref("browser.cache.memory.capacity", 524288);
    user_pref("browser.sessionhistory.max_entries", 50);

    // Interfaz y UX
    user_pref("browser.compactmode.show", true);
    user_pref("browser.uidensity", 1);  // 0=normal, 1=compact, 2=touch
    user_pref("browser.tabs.closeWindowWithLastTab", false);
    user_pref("browser.tabs.loadBookmarksInTabs", true);
    user_pref("browser.urlbar.suggest.bookmark", true);
    user_pref("browser.urlbar.suggest.history", true);
    user_pref("browser.urlbar.suggest.openpage", false);

    // Descargas
    user_pref("browser.download.useDownloadDir", true);
    user_pref("browser.download.always_ask_before_handling_new_types", true);

    // PDF
    user_pref("pdfjs.defaultZoomValue", "page-width");
    user_pref("pdfjs.enableScripting", false);

    // Desarrollo
    user_pref("devtools.theme", "dark");
    user_pref("devtools.toolbox.host", "right");
    user_pref("devtools.webconsole.input.editor", true);
  '';

  # Firefox userChrome.css
  home.file.".mozilla/firefox/default/chrome/userChrome.css".text = ''
    /* Ocultar barra de título cuando está maximizado */
    #main-window[sizemode="maximized"] #titlebar {
      visibility: collapse !important;
    }

    /* Hacer la barra de pestañas más compacta */
    .tab-content {
      padding-top: 2px !important;
      padding-bottom: 2px !important;
    }

    /* Reducir el padding de la barra de navegación */
    #nav-bar {
      padding-top: 1px !important;
      padding-bottom: 1px !important;
    }

    /* Ocultar botones innecesarios de la barra de herramientas */
    #back-button,
    #forward-button,
    #reload-button,
    #stop-button,
    #home-button,
    #library-button,
    #sidebar-button {
      display: none !important;
    }
  '';
}
