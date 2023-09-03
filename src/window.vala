/* window.vala
 *
 * Copyright 2023 Shrish Deshpande
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Argonaut {
    [GtkTemplate (ui = "/io/github/boogiemonster1o1/argonaut/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label select_disk;
        [GtkChild]
        private unowned Gtk.ListBox disks;

        public Window (Gtk.Application app) {
            Object (application: app);
        }

        construct {
            populate_disk_list ();
        }

        private void populate_disk_list () {
            var volume_monitor = GLib.VolumeMonitor.get ();
            var volumes = volume_monitor.get_volumes ();

            foreach (var volume in volumes) {
                var disk = volume.get_name ();
                var label = new Gtk.Label (disk);
                disks.append (label);
            }
        }
    }
}

