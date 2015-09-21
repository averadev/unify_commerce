---------------------------------------------------------------------------------
-- Trippy Rex
-- Alberto Vera Espitia
-- Parodiux Inc.
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- OBJETOS Y VARIABLES
---------------------------------------------------------------------------------
-- Includes
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local fxTap = audio.loadSound( "fx/click.wav")

-- Grupos y Contenedores
local screen
local scene = storyboard.newScene()

-- Variables
local intW = display.contentWidth
local intH = display.contentHeight
local midW = display.contentWidth / 2
local midH = display.contentHeight / 2
local h = display.topStatusBarContentHeight

-- Arreglos
local words = { { size = 40, x = 100, y = 100, text = "RECOMPENSAS" },
                { size = 55, x = 560, y = 140, text = "DESCUENTOS" },
                { size = 50, x = 70, y = 660, text = "PUNTOS" },
                { size = 40, x = 160, y = 660, text = "CANJES" },
                { size = 70, x = 180, y = 120, text = "REGALOS" },
                { size = 40, x = 300, y = 100, text = "AHORRO" },
                { size = 45, x = 450, y = 30, text = "RECOMPENSAS" },
                { size = 30, x = 420, y = 200, text = "FIDELIDAD" },
                { size = 55, x = 280, y = 430, text = "FIDELIDAD" },
                { size = 45, x = 550, y = 30, text = "PUNTOS" },
                { size = 70, x = 170, y = 400, text = "DESCUENTOS" },
                { size = 50, x = 80, y = 350, text = "PUNTOS" }}


---------------------------------------------------------------------------------
-- FUNCIONES
---------------------------------------------------------------------------------
function tapCheckIn(event)
    audio.play( fxTap )
    storyboard.removeScene( "src.CheckIn" )
    storyboard.gotoScene("src.CheckIn", { time = 400, effect = "crossFade" } )
end

---------------------------------------------------------------------------------
-- DEFAULT METHODS
---------------------------------------------------------------------------------

function scene:createScene( event )
	screen = self.view
    
    local circleBgS1 = display.newCircle( screen, midW + 80, 10, 140 )
    circleBgS1:setFillColor( 0, 182/255, 251/255 )
    local circleBgS2 = display.newCircle( screen, midW - 90, 180, 190 )
    circleBgS2:setFillColor( 0, 182/255, 251/255 )
    local circleBgS3 = display.newCircle( screen, midW - 270, 395, 190 )
    circleBgS3:setFillColor( 0, 182/255, 251/255 )
    local circleBgS4 = display.newCircle( screen, midW - 430, 600, 190 )
    circleBgS4:setFillColor( 0, 182/255, 251/255 )
    
    local circleBg1 = display.newCircle( screen, midW + 80, 10, 130 )
    circleBg1:setFillColor( 0, 173/255, 238/255 )
    local circleBg2 = display.newCircle( screen, midW - 90, 180, 180 )
    circleBg2:setFillColor( 0, 173/255, 238/255 )
    local circleBg3 = display.newCircle( screen, midW - 270, 395, 180 )
    circleBg3:setFillColor( 0, 173/255, 238/255 )
    local circleBg4 = display.newCircle( screen, midW - 430, 600, 180 )
    circleBg4:setFillColor( 0, 173/255, 238/255 )
    
    local vertices = { 0,0, intW*.7,0, 50,intH, 0,intH  }
    local polygon = display.newPolygon( intW*.35, midH, vertices )
    polygon:setFillColor( 0, 173/255, 238/255 )
    screen:insert( polygon )
    
    -- Palabras fondo
    for z = 1, #words, 1 do 
        local tempWord = display.newText({
            text = words[z].text, 
            x = words[z].x, y = words[z].y, 
            font = "Lato-Bold",   
            fontSize = words[z].size, align = "center"
        })
        tempWord.rotation = -52
        tempWord:setFillColor( 0, 182/255, 251/255 )
        screen:insert( tempWord )
    end
    
    local circle1A = display.newCircle( screen, intW/4, midH, 200 )
    circle1A:setFillColor( 28/255, 199/255, 1 )
    local circle1B = display.newCircle( screen, intW/4, midH, 180 )
    circle1B:setFillColor( 0, 173/255, 238/255 )
    
    local lblName = display.newText({
        text = "IUPI", 
        x = intW/4, y = midH - 50, 
        font = "Lato-Bold",   
        fontSize = 90, align = "center"
    })
    lblName:setFillColor( 1 )
    screen:insert( lblName )
    
    local separator = display.newImage(screen, "img/separator.png")
    separator:translate( intW / 4, midH + 2 )
    
    local lblSubName = display.newText({
        text = "Recompensarte se siente bien ...", 
        x = intW/4, y = midH + 25, 
        font = "Lato-Regular",   
        fontSize = 16, align = "center"
    })
    lblSubName:setFillColor( 1 )
    screen:insert( lblSubName )
    
    local lblWelcome = display.newText({
        text = "BIENVENIDO", 
        x = intW/4, y = midH + 60, 
        font = "Lato-Bold",   
        fontSize = 35, align = "center"
    })
    lblWelcome:setFillColor( 1 )
    screen:insert( lblWelcome )
    
    local circle2A = display.newCircle( screen, intW, intH, 200 )
    circle2A:setFillColor( 28/255, 199/255, 1 )
    local circle2B = display.newCircle( screen, intW, intH, 180 )
    circle2B:setFillColor( 0, 173/255, 238/255 )
    
    local bg1 = display.newRect( screen, midW*1.55, midH, 400, 160 )
    bg1:setFillColor( 0, 173/255, 238/255 )
    local bg2 = display.newRect( screen, midW*1.55, midH, 380, 140 )
    bg2:setFillColor( 2/255, 191/255, 1 )
    bg2:addEventListener( 'tap', tapCheckIn)
    
    local iconVisit = display.newImage(screen, "img/iconVisit.png")
    iconVisit:translate( (midW*1.55) - 110, midH )
    
    local lblJoin1 = display.newText({
        text = "REGISTRA", width = 200,
        x = (midW*1.55)+50, y = midH - 18,  
        font = "Lato-Bold",   
        fontSize = 35, align = "left"
    })
    lblJoin1:setFillColor( 1 )
    screen:insert( lblJoin1 )
    local lblJoin2 = display.newText({
        text = "TU VISITA", width = 200,
        x = (midW*1.55)+50, y = midH + 18,  
        font = "Lato-Bold",   
        fontSize = 35, align = "left"
    })
    lblJoin2:setFillColor( 1 )
    screen:insert( lblJoin2 )
    
	local lblWeb = display.newText({
        text = "IUPI  web: www.iupi.com", 
        x = midW, y = intH - 50,  
        font = "Lato-Regular",   
        fontSize = 24, align = "left"
    })
    lblWeb:setFillColor( 1 )
    screen:insert( lblWeb )
    
end	
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    
end

-- Remove Listener
function scene:exitScene( event )
end

scene:addEventListener("createScene", scene )
scene:addEventListener("enterScene", scene )
scene:addEventListener("exitScene", scene )

return scene