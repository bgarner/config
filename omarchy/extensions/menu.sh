# >>> omarchy-theme-marketplace
show_style_menu() {
  case $(menu "Style" "󰸌  Theme\n󰣇  Theme Marketplace\n󰟵  Unlock\n  Font\n  Background\n  Hyprland\n󱄄  Screensaver\n  About") in
  *"Theme Marketplace"*) show_theme_marketplace_menu ;;
  *Theme*) show_theme_menu ;;
  *Unlock*) omarchy-launch-walker -m menus:omarchyunlocks --width 800 --minheight 400 ;;
  *Font*) show_font_menu ;;
  *Background*) show_background_menu ;;
  *Hyprland*) open_in_editor ~/.config/hypr/looknfeel.conf ;;
  *Screensaver*) show_screensaver_menu ;;
  *About*) show_about_menu ;;
  *) show_main_menu ;;
  esac
}

show_theme_marketplace_menu() {
  omarchy-theme-marketplace
}
# <<< omarchy-theme-marketplace
