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
local btnRewards = {}

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

local rewards = { { points = 40, text = "CERVEZA CHOPE" },
                { points = 50, text = "ORDEN DE PASTOR" },
                { points = 80, text = "JARRA CHOPE" },
                { points = 110, text = "PARRILLADA 5 PERSONAS" }}
                

---------------------------------------------------------------------------------
-- FUNCIONES
---------------------------------------------------------------------------------
function tapReturn(event)
    audio.play( fxTap )
    storyboard.removeScene( "src.Home" )
    storyboard.gotoScene("src.Home", { time = 400, effect = "crossFade" } )
end

function tapReward(event)
    audio.play( fxTap )
    local t = event.target
    
    -- Palabras fondo
    for z = 1, #btnRewards, 1 do 
        btnRewards[z]:setFillColor( 1 )
        btnRewards[z].rName:setFillColor( .3 )
    end
    -- New selected
    t:setFillColor( 253/255, 167/255, 0 )
    t.rName:setFillColor( 1 )
end

function getRewards()
    
    local bgScrV = display.newRoundedRect( screen, midW + 100, 165, 510, 470, 10 )
    bgScrV.anchorY = 0
    bgScrV:setFillColor( 0, 160/255, 220/255 )
    bgScrV.alpha = .7
    local scrView = widget.newScrollView
	{
		top = 170,
		left = midW - 150,
		width = 500,
		height = 460,
		horizontalScrollDisabled = true,
		backgroundColor = { 2/255, 191/255, 1 }
	}
	screen:insert(scrView)
    
    local title = display.newText({
        text = "Recompensas disponibles:", 
        x = 180, y = 20, 
        font = native.systemFont, width = 300,  
        fontSize = 18, align = "left"
    })
    title:setFillColor( 1 )
    scrView:insert( title )
    
    
    -- Palabras fondo
    for z = 1, #rewards, 1 do 
        
        -- Email's
        local emailBg1 = display.newRoundedRect( 250, (z*100)- 20, 450, 70, 10 )
        emailBg1:setFillColor( 0, 160/255, 220/255 )
        emailBg1.alpha = .4
        scrView:insert( emailBg1 )
        btnRewards[#btnRewards + 1] = display.newRoundedRect( 250, (z*100)- 20, 440, 60, 10 )
        btnRewards[#btnRewards]:setFillColor( 1 )
        btnRewards[#btnRewards]:addEventListener( 'tap', tapReward)
        scrView:insert( btnRewards[#btnRewards] )
        local emailBg3 = display.newRect( 420, (z*100)- 20, 80, 60 )
        emailBg3:setFillColor( 0, 173/255, 238/255 )
        scrView:insert( emailBg3 )
        local emailBg4 = display.newRoundedRect( 430, (z*100)- 20, 80, 60, 10 )
        emailBg4:setFillColor( 0, 173/255, 238/255 )
        scrView:insert( emailBg4 )
        
        btnRewards[#btnRewards].rName = display.newText({
            text = rewards[z].text, 
            x = 200, y = (z*100)- 20, 
            font = native.systemFont, width = 300,  
            fontSize = 21, align = "left"
        })
        btnRewards[#btnRewards].rName:setFillColor( .3 )
        scrView:insert( btnRewards[#btnRewards].rName )
        
        local rPoints = display.newText({
            text = rewards[z].points, 
            x = 430, y = (z*100)- 20, 
            font = native.systemFontBold,  
            fontSize = 28, align = "center"
        })
        rPoints:setFillColor( 1 )
        scrView:insert( rPoints )
        
    end
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
            font = native.systemFont,   
            fontSize = words[z].size, align = "center"
        })
        tempWord.rotation = -52
        tempWord:setFillColor( 0, 182/255, 251/255 )
        screen:insert( tempWord )
    end
    
    local circle2A = display.newCircle( screen, intW, intH, 200 )
    circle2A:setFillColor( 28/255, 199/255, 1 )
    local circle2B = display.newCircle( screen, intW, intH, 180 )
    circle2B:setFillColor( 0, 173/255, 238/255 )
    
	local lblWeb = display.newText({
        text = "IUPI  web: www.iupi.com", 
        x = midW, y = intH - 50,  
        font = native.systemFont,   
        fontSize = 24, align = "left"
    })
    lblWeb:setFillColor( 1 )
    screen:insert( lblWeb )
    
    -- Return
    local iconReturn = display.newImage(screen, "img/iconReturn.png")
    iconReturn:translate( midW - 455, 80 )
    iconReturn:addEventListener( 'tap', tapReturn)
    
    -- Title
    local lblTitle1 = display.newText({
        text = "HOLA! Mauricio ... Bienvenido a La Parrillita.", 
        x = midW, y = 130,  
        font = native.systemFontBold, width = 800, 
        fontSize = 28, align = "left"
    })
    lblTitle1:setFillColor( 1 )
    screen:insert( lblTitle1 )
    
    -- Logo
    local logoBg1 = display.newRoundedRect( screen, midW - 305, 260, 180, 180, 10 )
    logoBg1:setFillColor( 28/255, 199/255, 1 )
    local logoBg2 = display.newRoundedRect( screen, midW - 305, 260, 170, 170, 10 )
    logoBg2:setFillColor( 1 )
    local logo = display.newImage(screen, "img/gondola.png")
    logo:translate( midW - 305, 260 )
    
    -- Points
    local pointsBg1 = display.newCircle( screen, midW - 305, 460, 100 )
    pointsBg1:setFillColor( 28/255, 199/255, 1 )
    local pointsBg2 = display.newCircle( screen, midW - 305, 460, 94 )
    pointsBg2:setFillColor( 1 )
    local lblPoints1 = display.newText({
        text = "3245", 
        x = midW - 305, y = 435,  
        font = native.systemFontBold, 
        fontSize = 55, align = "center"
    })
    lblPoints1:setFillColor( 44/255, 204/255, 113/255 )
    screen:insert( lblPoints1 )
    local lblPoints2 = display.newText({
        text = "PUNTOS", 
        x = midW - 305, y = 478,  
        font = native.systemFontBold, 
        fontSize = 30, align = "center"
    })
    lblPoints2:setFillColor( 2/255, 191/255, 1 )
    screen:insert( lblPoints2 )
    local lblPoints3 = display.newText({
        text = "DISPONIBLES", 
        x = midW - 305, y = 500,  
        font = native.systemFontBold, 
        fontSize = 19, align = "center"
    })
    lblPoints3:setFillColor( 2/255, 191/255, 1 )
    screen:insert( lblPoints3 )
    
    getRewards()
    
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