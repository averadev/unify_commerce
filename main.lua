---------------------------------------------------------------------------------
-- Trippy Rex
-- Alberto Vera Espitia
-- Parodiux Inc.
---------------------------------------------------------------------------------

display.setStatusBar( display.DarkStatusBar )
display.setDefault( "background", 2/255, 191/255, 1 )

local storyboard = require('storyboard')

storyboard.gotoScene("src.Home")

local systemFonts = native.getFontNames()
-- Set the string to query for (part of the font name to locate)
local searchString = "ato"
-- Display each font in the Terminal/console
for i, fontName in ipairs( systemFonts ) do

    local j, k = string.find( string.lower(fontName), string.lower(searchString) )

    if ( j ~= nil ) then
        print( "Font Name = " .. tostring( fontName ) )
    end
end
