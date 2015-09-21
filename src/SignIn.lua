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
local txtEmail1, txtEmail2
local qr1, qr2, qr3, iconCheck

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

function tapUserPromo(event)
    audio.play( fxTap )
    storyboard.removeScene( "src.UserPromo" )
    storyboard.gotoScene("src.UserPromo", { time = 400, effect = "crossFade" } )
end

function tapQR(event)
    audio.play( fxTap )
    if qr3.alpha < .1 then
        iconCheck.alpha = 1
        transition.to( qr1, { height = 260, width = 260, alpha = 1, time = 200 })
        transition.to( qr2, { height = 250, width = 250, alpha = 1, time = 200 })
        transition.to( qr3, { alpha = 1, time = 700, delay = 500 })
    else
        iconCheck.alpha = 0
        transition.to( qr3, { alpha = 0, time = 300 })
        transition.to( qr3, { alpha = 0, delay = 400 })
        transition.to( qr1, { height = 0, width = 0, alpha = 0, time = 200, delay = 300 })
        transition.to( qr2, { height = 0, width = 0, alpha = 0, time = 200, delay = 300 })
        
    end
end

function onTxtFocus(event)
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
        text = "HOLA! ...", 
        x = midW, y = 130,  
        font = "Lato-Bold", width = 800, 
        fontSize = 28, align = "left"
    })
    lblTitle1:setFillColor( 1 )
    screen:insert( lblTitle1 )
    
    local lblTitle2 = display.newText({
        text = "Bienvenido a IUPI, estas apunto de recibir recompensas, solo escribe tu correo:", 
        x = midW, y = 165, 
        font = "Lato-Regular", width = 800,   
        fontSize = 22, align = "left"
    })
    lblTitle2:setFillColor( 1 )
    screen:insert( lblTitle2 )
    
    -- Perfil
    local profileBg1 = display.newCircle( screen, midW - 250, 320, 100 )
    profileBg1:setFillColor( 0, 160/255, 220/255 )
    profileBg1.alpha = .4
    local profileBg2 = display.newCircle( screen, midW - 250, 320, 90 )
    profileBg2:setFillColor( 1 )
    local iconProfile = display.newImage(screen, "img/iconProfile.png")
    iconProfile:translate( midW - 250, 300 )
    local lblProfile = display.newText({
        text = "REGISTRATE", 
        x = midW - 250, y = 355, 
        font = "Lato-Bold",    
        fontSize = 18, align = "center"
    })
    lblProfile:setFillColor( 0, 173/255, 238/255 )
    screen:insert( lblProfile )
    
    -- Email's
    local emailBg1 = display.newRoundedRect( screen, midW + 100, 250, 410, 70, 10 )
    emailBg1:setFillColor( 0, 160/255, 220/255 )
    emailBg1.alpha = .4
    local emailBg2 = display.newRoundedRect( screen, midW + 100, 250, 400, 60, 10 )
    emailBg2:setFillColor( 1 )
    txtEmail1 = native.newTextField( midW + 100, 250, 380, 30 )
    txtEmail1.inputType = "email"
    txtEmail1.hasBackground = false
    txtEmail1.placeholder = "Escribe tu Correo"
    txtEmail1:addEventListener( "userInput", onTxtFocus )
	screen:insert(txtEmail1)
    
    local reemailBg1 = display.newRoundedRect( screen, midW + 100, 335, 410, 70, 10 )
    reemailBg1:setFillColor( 0, 160/255, 220/255 )
    reemailBg1.alpha = .4
    local reemailBg2 = display.newRoundedRect( screen, midW + 100, 335, 400, 60, 10 )
    reemailBg2:setFillColor( 1 )
    txtEmail2 = native.newTextField( midW + 100, 335, 380, 30 )
    txtEmail2.inputType = "email"
    txtEmail2.hasBackground = false
    txtEmail2.placeholder = "Escribelo de nuevo"
    txtEmail2:addEventListener( "userInput", onTxtFocus )
	screen:insert(txtEmail2)
    
    local codigoBg1 = display.newRoundedRect( screen, midW + 100, 420, 410, 70, 10 )
    codigoBg1:setFillColor( 0, 160/255, 220/255 )
    codigoBg1.alpha = .4
    codigoBg1:addEventListener( 'tap', tapQR)
    local codigoBg2 = display.newRoundedRect( screen, midW + 100, 420, 400, 60, 10 )
    codigoBg2:setFillColor( 1 )
    local lblCodigo = display.newText({
        text = "Registra tu tarjeta IUPI", 
        x = midW + 50, y = 420, 
        font = "Lato-Regular",    
        fontSize = 18, align = "left"
    })
    lblCodigo:setFillColor( .3 )
    screen:insert( lblCodigo )
    local checkBg1 = display.newRoundedRect( screen, midW - 70, 420, 30, 30, 3 )
    checkBg1:setFillColor( .5 )
    local checkBg2 = display.newRoundedRect( screen, midW - 70, 420, 24, 24, 3 )
    checkBg2:setFillColor( 1 )
    iconCheck = display.newImage(screen, "img/iconCheck.png")
    iconCheck:translate( midW - 65, 417 )
    iconCheck.alpha = 0
    
    local continueBg1 = display.newRect( screen, midW + 200, 500, 210, 60 )
    continueBg1:setFillColor( 0, 160/255, 220/255 )
    continueBg1.alpha = .4
    continueBg1:addEventListener( 'tap', tapUserPromo)
    local continueBg2 = display.newRect( screen, midW + 200, 500, 200, 50 )
    continueBg2:setFillColor( .97 )
    local lblContinue = display.newText({
        text = "CONTINUAR", 
        x = midW + 220, y = 500, 
        font = "Lato-Bold",    
        fontSize = 22, align = "left"
    })
    lblContinue:setFillColor( .3 )
    screen:insert( lblContinue )
    local iconContinue = display.newImage(screen, "img/iconContinue.png")
    iconContinue:translate( midW + 130, 500 )
    
    
    qr1 = display.newRect( screen, midW - 250, 335, 0, 0 )
    qr1:setFillColor( 0, 160/255, 220/255 )
    qr1.alpha = 0
    qr2 = display.newRect( screen, midW - 250, 335, 0, 0 )
    qr2:setFillColor( .97 )
    qr2.alpha = 0
    qr3 = display.newImage(screen, "img/qrExample.png")
    qr3.height = 250
    qr3.width = 250
    qr3:translate( midW - 250, 335 )
    qr3.alpha = 0
    
end	
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    
end

-- Remove Listener
function scene:exitScene( event )
    if txtEmail1 then
        txtEmail1:removeSelf()
        txtEmail1 = nil
    end
    if txtEmail2 then
        txtEmail2:removeSelf()
        txtEmail2 = nil
    end
end

scene:addEventListener("createScene", scene )
scene:addEventListener("enterScene", scene )
scene:addEventListener("exitScene", scene )

return scene