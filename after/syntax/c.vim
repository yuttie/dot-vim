" grep -oh '[^ "]+deprecated_errors' gtk-vim-syntax/*.vim | sort | uniq
let clutter_deprecated_errors = 1
let gconf_deprecated_errors = 1
let gdk_deprecated_errors = 1
let gdkpixbuf_deprecated_errors = 1
let gimp_deprecated_errors = 1
let gio_deprecated_errors = 1
let glib_deprecated_errors = 1
let gnomedesktop_deprecated_errors = 1
let gnomevfs_deprecated_errors = 1
let gobject_deprecated_errors = 1
let gstreamer_deprecated_errors = 1
let gtk_deprecated_errors = 1
let gtksourceview_deprecated_errors = 1
let jsonglib_deprecated_errors = 1
let libglade_deprecated_errors = 1
let libgnome_deprecated_errors = 1
let libgnomeui_deprecated_errors = 1
let librsvg_deprecated_errors = 1
let libsoup_deprecated_errors = 1
let libwnck_deprecated_errors = 1
let pango_deprecated_errors = 1
let vte_deprecated_errors = 1

if version >= 600
  runtime! syntax/atk.vim
  runtime! syntax/atspi.vim
  runtime! syntax/cairo.vim
  runtime! syntax/clutter.vim
  runtime! syntax/dbusglib.vim
  runtime! syntax/evince.vim
  runtime! syntax/gail.vim
  runtime! syntax/gconf.vim
  runtime! syntax/gdk.vim
  runtime! syntax/gdkpixbuf.vim
  runtime! syntax/gimp.vim
  runtime! syntax/gio.vim
  runtime! syntax/glib.vim
  runtime! syntax/gnomedesktop.vim
  runtime! syntax/gnomevfs.vim
  runtime! syntax/gobject.vim
  runtime! syntax/gobjectintrospection.vim
  runtime! syntax/goocanvas.vim
  runtime! syntax/gstreamer.vim
  runtime! syntax/gtk.vim
  runtime! syntax/gtkglext.vim
  runtime! syntax/gtksourceview.vim
  runtime! syntax/jsonglib.vim
  runtime! syntax/libglade.vim
  runtime! syntax/libgnome.vim
  runtime! syntax/libgnomecanvas.vim
  runtime! syntax/libgnomeui.vim
  runtime! syntax/libgsf.vim
  runtime! syntax/libnotify.vim
  runtime! syntax/liboil.vim
  runtime! syntax/librsvg.vim
  runtime! syntax/libsoup.vim
  runtime! syntax/libunique.vim
  runtime! syntax/libwnck.vim
  runtime! syntax/orbit2.vim
  runtime! syntax/pango.vim
  runtime! syntax/poppler.vim
  runtime! syntax/vte.vim
  runtime! syntax/xlib.vim
endif
