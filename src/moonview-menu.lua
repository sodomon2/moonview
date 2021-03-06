--[[--
 @package   MoonView
 @filename  moonview-menu.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      05.03.2021 22:46:47 -04
]]

function main_window:on_button_press_event(event)	
	if (event.type == 'BUTTON_PRESS' and event.button == 3) then
		menu = Gtk.Menu {
			Gtk.ImageMenuItem {
				label = "About MoonView",
				image = Gtk.Image {
					stock = "gtk-about"
				},
				on_activate = function()
					about_window:run()
					about_window:hide()
				end
			},
			Gtk.SeparatorMenuItem {},
			Gtk.ImageMenuItem {
				label = "Quit",
				image = Gtk.Image {
					stock = "gtk-quit"
				},
				on_activate = function()
					Gtk.main_quit()
					app:quit()
				end
			}
		}
		menu:attach_to_widget(main_window, null)
		menu:show_all()
		menu:popup(nil, nil, nil, event.button, event.time)
	end
end
