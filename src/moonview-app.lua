--[[--
 @package   MoonView
 @filename  moonview-app.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      05.03.2021 18:17:16 -04
]]
local screen		= Gdk.Screen:get_default()

image_chooser 		= Gtk.FileChooserDialog({
	title 			= "Open Image File",
	action 			= Gtk.FileChooserAction.OPEN
})

image_chooser:add_button("Open", Gtk.ResponseType.OK)
image_chooser:add_button("Cancel", Gtk.ResponseType.CANCEL)

about_window		= Gtk.AboutDialog ({
	program_name	= 'Moonview',
	version			= '1.0',
	copyright		= 'Díaz Urbaneja Víctor Diego Alejandro (Sodomon)\n Copyright © 2021',
	comments		= 'a simple image viewer in lua',
	website			= 'https://github.com/moonsteal/moonview',
	website_label	= 'Github',
	logo_icon_name	= 'image-viewer',
	authors			= { 'Díaz Urbaneja Víctor Diego Alejandro<sodomon2@gmail.com>' }
})

main_window			= Gtk.Window ({
	default_width	= screen:get_width(),
	default_height	= screen:get_height(),
	Gtk.ScrolledWindow {
		Gtk.Image {
			id		= 'image_view',
			visible	= true
		}
	}
})

local headerbar	= Gtk.HeaderBar {
	title		= 'MoonView',
	subtitle	= 'A simple image viewer in lua',
	show_close_button = true
}
main_window:set_titlebar(headerbar)

function filename(image_file)
	local t = {}
	for str in string.gmatch(image_file, "([^/]+)") do
		table.insert(t, str)
	end
	return t[#t]
end

function get_image_from_chooser()
	local file		   = image_chooser:get_filename()

	image 			   = GdkPixbuf.Pixbuf.new_from_file_at_size(file, 900, 750)
	headerbar.title    = filename(file)
	headerbar.subtitle = ""
	main_window.child.image_view:set_from_pixbuf(image)
	image_chooser:hide()
end

function app:on_open(files)
	local file = files[1] and files[1]:get_parse_name()
	if(file) then
		image = GdkPixbuf.Pixbuf.new_from_file(file)
	end
	main_window.child.image_view:set_from_pixbuf(image)
	main_window:show_all()
end

function main_window:on_destroy()
	Gtk.main_quit()
	app:quit()
end

function app:on_activate()
	chooser = image_chooser:run()
	if chooser == Gtk.ResponseType.OK then
		get_image_from_chooser()
		main_window:show_all()
	elseif chooser == Gtk.ResponseType.CANCEL then
		image_chooser:hide()
		os.exit(1)
	end
	main_window:set_icon_name('image-viewer')
end
