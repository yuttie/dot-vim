" Author:   Yuta Taniguchi <yuta.taniguchi.y.t@gmail.com>
" Version:  1.0.0
" License:  The MIT License (MIT)
"     Copyright (c) 2015 Yuta Taniguchi
"
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.

let s:base3   = ["#181818", 233]
let s:base2   = ["#282828", 235]
let s:base1   = ["#383838", 237]
let s:base0   = ["#585858", 239]
let s:base00  = ["#b8b8b8", 242]
let s:base01  = ["#d8d8d8", 102]
let s:base02  = ["#e8e8e8", 249]
let s:base03  = ["#f8f8f8", 255]
let s:red     = ["#ab4642", 131]
let s:orange  = ["#dc9656", 173]
let s:yellow  = ["#f7ca88", 179]
let s:green   = ["#a1b56c", 143]
let s:cyan    = ["#86c1b9", 109]
let s:blue    = ["#7cafc2", 110]
let s:violet  = ["#ba8baf", 103]
let s:magenta = ["#a16946", 139]

let s:blue0 = s:blue
let s:blue1 = ["#b7d3de",  67]
let s:blue2 = ["#d3e4ea",  24]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:base02, s:green  ], [ s:base2, s:base00 ] ]
let s:p.normal.middle   = [ [ s:base1,  s:base01 ],                       ]
let s:p.normal.right    = [ [ s:base02, s:base1  ], [ s:base2, s:base00 ] ]

let s:p.insert.left     = [ [ s:blue2,  s:blue0  ], [ s:base2, s:blue1  ] ]
let s:p.insert.middle   = [ [ s:blue0,  s:blue2  ]                        ]
let s:p.insert.right    = [ [ s:blue2,  s:blue0  ], [ s:blue0,  s:blue1 ] ]

let s:p.visual.left     = [ [ s:base02, s:yellow ], [ s:base2, s:base00 ] ]
let s:p.replace.left    = [ [ s:base02, s:red    ], [ s:base2, s:base00 ] ]

let s:p.inactive.left   = [ [ s:base01, s:base0  ], [ s:base1, s:base00 ] ]
let s:p.inactive.middle = [ [ s:base0,  s:base01 ],                       ]
let s:p.inactive.right  = [ [ s:base01, s:base0  ], [ s:base1, s:base00 ] ]

let s:p.normal.error    = [ [ s:red,    s:base01 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base00 ] ]

let s:p.tabline.left    = [ [ s:base1,  s:base00 ] ]
let s:p.tabline.middle  = [ [ s:base0,  s:base02 ] ]
let s:p.tabline.right   = [ [ s:base1,  s:base00 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:cyan   ] ]

let g:lightline#colorscheme#base16_default_light#palette = lightline#colorscheme#flatten(s:p)
