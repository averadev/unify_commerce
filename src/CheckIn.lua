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
function tapReturn(event)
    audio.play( fxTap )
    storyboard.removeScene( "src.Home" )
    storyboard.gotoScene("src.Home", { time = 400, effect = "crossFade" } )
end

function tapSignIn(event)
    audio.play( fxTap )
    storyboard.removeScene( "src.SignIn" )
    storyboard.gotoScene("src.SignIn", { time = 400, effect = "crossFade" } )
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
    
    -- Banner
    local bannerBg = display.newRect( screen, midW, 80, 810, 70 )
    bannerBg:setFillColor( 0, 160/255, 220/255 )
    bannerBg.alpha = .4
    local bannerBg = display.newRect( screen, midW, 80, 800, 60 )
    bannerBg:setFillColor( 0, 143/255, 205/255 )
    bannerBg.alpha = .7
    
    local lblWeb = display.newText({
        text = "¿Aún no eres IUPER?", 
        x = midW - 255, y = 80,  
        font = native.systemFontBold,   
        fontSize = 24, align = "left"
    })
    lblWeb:setFillColor( 1 )
    screen:insert( lblWeb )
    
    local lblWeb = display.newText({
        text = "Afiliate ahora, es rápido y muy fácil:", 
        x = midW + 33, y = 80,  
        font = native.systemFont,   
        fontSize = 20, align = "left"
    })
    lblWeb:setFillColor( 1 )
    screen:insert( lblWeb )
    
    local afilBg = display.newRect( screen, midW + 300, 80, 190, 50 )
    afilBg:setFillColor( .97 )
    afilBg:addEventListener( 'tap', tapSignIn)
    
    local iconJoin = display.newImage(screen, "img/iconJoin.png")
    iconJoin:translate( midW + 238, 80 )
    
    local lblWeb = display.newText({
        text = "AFILIARME", 
        x = midW + 325, y = 80,  
        font = native.systemFontBold,   
        fontSize = 22, align = "center"
    })
    lblWeb:setFillColor( .3 )
    screen:insert( lblWeb )
    
    -- Message
    local messBg1 = display.newRect( screen, midW, 220, 400, 140 )
    messBg1:setFillColor( 0, 160/255, 220/255 )
    messBg1.alpha = .4
    local messBg2 = display.newRect( screen, midW, 220, 390, 130 )
    messBg2:setFillColor( 1 )
    
    local iconPhoto = display.newImage(screen, "img/iconPhoto.png")
    iconPhoto:translate( midW - 125, 220 )
    
    local lblMess1 = display.newText({
        text = "COLOCA EL CÓDIGO", width = 300,
        x = midW + 80, y = 198,  
        font = native.systemFontBold,   
        fontSize = 20, align = "left"
    })
    lblMess1:setFillColor( 0, 173/255, 238/255 )
    screen:insert( lblMess1 )
    local lblMess2 = display.newText({
        text = "DE CLIENTE FRENTE", width = 300, 
        x = midW + 80, y = 220,  
        font = native.systemFontBold,   
        fontSize = 20, align = "left"
    })
    lblMess2:setFillColor( 0, 173/255, 238/255 )
    screen:insert( lblMess2 )
    local lblMess3 = display.newText({
        text = "A LA CAMARA", width = 300, 
        x = midW + 80, y = 242,  
        font = native.systemFontBold,   
        fontSize = 20, align = "left"
    })
    lblMess3:setFillColor( 0, 173/255, 238/255 )
    screen:insert( lblMess3 )
    
    -- Photo
    local photoBg1 = display.newRect( screen, midW, 500, 400, 400 )
    photoBg1:setFillColor( 0, 160/255, 220/255 )
    photoBg1.alpha = .4
    local qrExample = display.newImage(screen, "img/qrExample.png")
    qrExample:translate( midW, 500 )
    
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