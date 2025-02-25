/*
Polyamory Shoppingcart Coin

Copyright 2024 nomike[AT]nomike[DOT]com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

coin_thickness = 2.33;
coin_diameter = 23.25;
logo_scale = 0.1;
EPSILON = 0.01; // Prevent z-fighting
render_color = "all";

//-- Lower case all chars of a string -- does not work with accented characters
function strtolower (string) = 
  chr([for(s=string) let(c=ord(s)) c<91 && c>64 ?c+32:c]); 

module multi_color(color) {
    if(strtolower(color) == strtolower(render_color) || strtolower(render_color) == "all") {
        color(color) children();
    }
}


module poly_heart() {
    multi_color("red") linear_extrude(height=coin_thickness + 2 * EPSILON) import("images/heart.svg", center=true);
}

module poly_inifinity() {
    multi_color("blue") linear_extrude(height=coin_thickness + 2 * EPSILON) import("images/infinity.svg", center=true);
}

module poly_logo() {
    scale([logo_scale, logo_scale, 1]) translate([0, 0, -EPSILON]) union() {
        poly_heart();
        poly_inifinity();
    }
}

multi_color("yellow") cylinder(d=coin_diameter, h=coin_thickness);
poly_logo();
