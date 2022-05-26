local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header.
dashboard.section.header.val = {
	"            :h-                                  Nhy`               ",
	"           -mh.                           h.    `Ndho               ",
	"           hmh+                          oNm.   oNdhh               ",
	"          `Nmhd`                        /NNmd  /NNhhd               ",
	"          -NNhhy                      `hMNmmm`+NNdhhh               ",
	"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
	"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
	"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
	"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
	" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
	" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
	" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
	" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
	"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
	"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
	"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
	"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
	"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
	"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
	"       //+++//++++++////+++///::--                 .::::-------::   ",
	"       :/++++///////////++++//////.                -:/:----::../-   ",
	"       -/++++//++///+//////////////               .::::---:::-.+`   ",
	"       `////////////////////////////:.            --::-----...-/    ",
	"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
	"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
	"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
	"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
	"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
	"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
	"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
	"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
	"                        .-:mNdhh:.......--::::-`                    ",
	"                           yNh/..------..`                          ",
	"                                                                    ",
}

-- Menu.
dashboard.section.buttons.val = {
	dashboard.button("u", "  Update plugins", ":PackerSync<CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("c", "  Plugins", ":e ~/.config/nvim/lua/plugins/core.lua <CR>"),
}

-- Footer.
local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

dashboard.opts.opts.noautocmd = true
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

alpha.setup(dashboard.opts)
