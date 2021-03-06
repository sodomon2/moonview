--[[--
 @package   MoonView
 @filename  moonview.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      03.03.2021 18:05:16 -04
]]

lgi	      = require("lgi")
Gtk	      = lgi.require('Gtk', '3.0')
Gdk       = lgi.require('Gdk', '3.0')
GLib      = lgi.require('GLib', '2.0')
Gio       = lgi.require('Gio', '2.0')
GdkPixbuf = lgi.require('GdkPixbuf', '2.0')

app       = Gtk.Application.new('com.github.sodomon2.moonview', Gio.ApplicationFlags.HANDLES_OPEN)

-- MoonView
require('src.moonview-app')

app:run({ arg[1], ... })
Gtk.main()
