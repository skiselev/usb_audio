// USB_Audio_Case.scad - 3D Printable Case for USB Audio Adapter
// 
// Copyright (C) 2019 Sergey Kiselev.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY# without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

$fn=90;
tolerance = 0.2;
board_width = 2.1 * 25.4 + tolerance * 2;
board_depth = 1.6 * 25.4 + tolerance * 2;
board_height = 4;
board_thickness = 1.6;
board_mount_offset = 0.15 * 25.4 + tolerance;
board_mount_holes = 3 + tolerance * 2;
board_optical1_offset = 0.45 * 25.4 + tolerance;
board_optical2_offset = 0.85 * 25.4 + tolerance;
board_lineout_offset = 1.3 * 25.4 + tolerance;
board_linein_offset = 1.8 * 25.4 + tolerance;
board_usb_offset = 1.3 * 25.4 + tolerance;
board_sw_y_offset = board_depth - 1.45 * 25.4;
board_sw1_x_offset = 0.65 * 25.4 + tolerance;
board_sw2_x_offset = 1.05 * 25.4 + tolerance;
board_sw3_x_offset = 1.45 * 25.4 + tolerance;

optical_width = 10; // actual width - 9.7
optical_height = 10;
optical_depth = 13.5-2.54 + tolerance * 2;
case_height = 12;
thickness = 1.6;

line_width = 12 + tolerance * 2;
line_height = 10;
line_center = 6.5;
line_diameter = 7.0; // actual diameter - 6.8
line_depth = 14.1+1-3.5 + tolerance * 2;

button_width = 4.2 + tolerance * 2;
button_depth = 4.2 + tolerance * 2;
button_height = 10;

usb_width = 8.2; // actual width - 8.05
usb_height = 3.2; // actual height - 3.0

screw_head_diameter = 5.6 + tolerance * 2;
square_nut_width = 5.5 + tolerance * 2;
square_nut_height = 1.6 + tolerance * 2;

// comment out one of the following to render
// either the case top or the case bottom
usb_audio_case_bottom();
usb_audio_case_top();

module usb_audio_case_top()
{
    difference() {
        union() {
            // top plate
            translate([0.4,0.4,thickness+board_height+line_height-0.2])
                cube([board_width+thickness*2-0.8,board_depth+thickness*2-0.8,0.2]);
            translate([0.2,0.2,thickness+board_height+line_height-0.4])
                cube([board_width+thickness*2-0.4,board_depth+thickness*2-0.4,0.2]);
            translate([0,0,thickness+board_height+line_height-thickness])
                cube([board_width+thickness*2,board_depth+thickness*2,thickness-0.4]);
            // board support - bottom right
            translate([board_width+thickness-board_mount_offset-square_nut_width/2,
                thickness+tolerance,thickness+board_height+tolerance])
                cube([board_mount_offset+square_nut_width/2-tolerance,board_mount_offset*2-tolerance,line_center-tolerance]);
            translate([board_width+thickness-board_mount_offset*2,
                thickness,thickness+board_height+line_center])
                cube([board_mount_offset*2,board_mount_offset*2,line_height-line_center-thickness]);
            // board support - top left
            translate([thickness+tolerance,
                board_depth+thickness-board_mount_offset*2-tolerance,thickness+board_height+tolerance])
                cube([board_mount_offset+square_nut_width/2-tolerance-0.3,board_mount_offset*2-tolerance,line_center-tolerance]);
            translate([thickness,
                board_depth+thickness-board_mount_offset*2,thickness+board_height+line_center+tolerance])
                cube([board_mount_offset*2,board_mount_offset*2,line_height-line_center-thickness]);
            // bottom sidewall
            translate([0,0,thickness+board_height+line_center])
                cube([board_width+thickness*2,thickness,line_height-line_center-thickness]);
            // top sidewall
            translate([0,board_depth+thickness,thickness+board_height+line_center])
                cube([board_width+thickness*2,thickness,line_height-line_center-thickness]);
            // left sidewall
            translate([0,thickness,thickness+board_height+line_center])
                cube([thickness,board_depth,line_height-line_center-thickness]);
            // right sidewall
            translate([board_width+thickness,thickness,thickness+board_height+line_center])
                cube([thickness,board_depth,line_height-line_center-thickness]);
        }
        union() {
            // screw hole - top left
            translate([board_width-board_mount_offset+thickness,board_mount_offset+thickness,board_height+thickness])
                cylinder(h=line_height-thickness,r=board_mount_holes/2);
            translate([board_width-board_mount_offset+thickness-square_nut_width/2,board_mount_offset+thickness-square_nut_width/2,board_height+thickness+3])
                cube([square_nut_width,square_nut_width,square_nut_height]);
            // screw hole - bottom right
            translate([board_mount_offset+thickness,board_depth-board_mount_offset+thickness,board_height+thickness])
                cylinder(h=line_height-thickness,r=board_mount_holes/2);
            translate([board_mount_offset+thickness-square_nut_width/2,board_depth-board_mount_offset+thickness-square_nut_width/2,board_height+thickness+3])
                cube([square_nut_width,square_nut_width,square_nut_height]);
            // optical jacks cut-out
            translate([thickness+board_optical1_offset-optical_width/2,thickness+board_depth-optical_depth,thickness+board_height+line_center])
                cube([board_optical2_offset-board_optical1_offset+optical_width,thickness+optical_depth,line_height-line_center]);
            // line-out and line-in jacks cut-out
            translate([thickness+board_lineout_offset-line_width/2,thickness+board_depth-line_depth,thickness+board_height+line_center])
                cube([board_linein_offset-board_lineout_offset+line_width,thickness+line_depth,line_height-line_center]);
            // bridge between optical jacks and line jacks
            translate([thickness+board_optical2_offset+optical_width/2,thickness+board_depth-optical_depth,thickness+board_height+line_center])
                cube([(thickness+board_lineout_offset-line_width/2)-(thickness+board_optical1_offset-optical_width/2),thickness+board_depth-line_depth,line_height-line_center]);
            // mute switch cut-out
            translate([thickness+board_sw1_x_offset-button_width/2,thickness+board_sw_y_offset-button_depth/2,thickness+board_height+line_height-thickness])
                cube([button_width,button_depth,thickness]);
            // volume up switch cut-out
            translate([thickness+board_sw2_x_offset-button_width/2,thickness+board_sw_y_offset-button_depth/2,thickness+board_height+line_height-thickness])
                cube([button_width,button_depth,thickness]);
            // volume down switch cut-out
            translate([thickness+board_sw3_x_offset-button_width/2,thickness+board_sw_y_offset-button_depth/2,thickness+board_height+line_height-thickness])
                cube([button_width,button_depth,thickness]);
        }
    }
}

module usb_audio_case_bottom()
{
    difference() {
        union() {
            // base plate
            translate([0.4,0.4,0])
                cube([board_width+thickness*2-0.8,board_depth+thickness*2-0.8,0.2]);
            translate([0.2,0.2,0.2])
                cube([board_width+thickness*2-0.4,board_depth+thickness*2-0.4,0.2]);
            translate([0,0,0.4])
                cube([board_width+thickness*2,board_depth+thickness*2,thickness-0.4]);
            // board support - bottom right
            translate([board_width+thickness-board_mount_offset*2,
                thickness,thickness])
                cube([board_mount_offset*2,board_mount_offset*2,board_height-board_thickness]);
            // board support - top left
            translate([thickness,
                board_depth+thickness-board_mount_offset*2,thickness])
                cube([board_mount_offset*2,board_mount_offset*2,board_height-board_thickness]);
            // board support - lower left
            translate([thickness,
                thickness,thickness])
                cube([board_mount_offset*2,3,board_height-board_thickness]);
            // board support - top right
            translate([board_width+thickness-board_mount_offset*2,
board_depth+thickness-3,thickness])
                cube([board_mount_offset*2,3,board_height-board_thickness]);
            // bottom sidewall
            translate([0,0,thickness])
                cube([board_width+thickness*2,thickness,board_height+line_center]);
            // top sidewall
            translate([0,board_depth+thickness,thickness])
                cube([board_width+thickness*2,thickness,board_height+line_center]);
            // left sidewall
            translate([0,thickness,thickness])
                cube([thickness,board_depth,board_height+line_center]);
            // right sidewall
            translate([board_width+thickness,thickness,thickness])
                cube([thickness,board_depth,board_height+line_center]);
        }
        union() {
            // screw hole - top left
            translate([board_width-board_mount_offset+thickness,board_mount_offset+thickness,0]) {
                cylinder(h=board_height,r=board_mount_holes/2);
                cylinder(h=3,r=screw_head_diameter/2);
            }
            // screw hole - bottom right
            translate([board_mount_offset+thickness,board_depth-board_mount_offset+thickness,0]) {
                cylinder(h=board_height,r=board_mount_holes/2);
                cylinder(h=3,r=screw_head_diameter/2);
            }
            // optical jacks cut-out
            translate([thickness+board_optical1_offset-optical_width/2,thickness+board_depth,thickness+board_height])
                cube([board_optical2_offset-board_optical1_offset+optical_width,thickness,line_center]);
            // line-out jack cut-out
            translate([board_lineout_offset+thickness,board_depth+thickness*2,thickness+board_height+line_center])
                rotate([90,0,0])
                    cylinder(h=thickness,r=line_diameter/2);
            // line-in jack cut-out
            translate([board_linein_offset+thickness,board_depth+thickness*2,thickness+board_height+line_center])
                rotate([90,0,0])
                    cylinder(h=thickness,r=line_diameter/2);    
            // usb cut-out
            translate([0,thickness+board_depth-board_usb_offset-usb_width/2,thickness+board_height-0.4])
                cube([thickness,usb_width,usb_height]);
        }
    }
}