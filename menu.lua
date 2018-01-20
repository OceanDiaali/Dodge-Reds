local composer = require( "composer" )

local scene = composer.newScene()

local widget = require( "widget" )

local function levelOne()
   composer.gotoScene( "level1", { time=800, effect="crossFade" } )
end

--[[local function aboutGame()
   composer.gotoScene( "about" )
end--]]

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen
   local background = display.newImageRect( sceneGroup, "image/background.png", 420, 600 )
   background.x = display.contentCenterX
   background.y = display.contentCenterY

   local gameImage = display.newImageRect("image/redcross.png",270,270)
   gameImage.x = display.contentCenterX - 30
   gameImage.y = 150
   gameImage.rotation = 45

   local gameImage = display.newImageRect("image/redcross.png",270,270)
   gameImage.x = display.contentCenterX + 30
   gameImage.y = 150
   gameImage.rotation = -45

   local gameTitle = display.newText( "Dodge Reds", 100, 200, native.systemFont, 46 )
   --gameTitle:setFillColor( 1, 0, 0 )
   gameTitle.x = display.contentCenterX
   gameTitle.y = 30

   --[[local chicken = display.newImageRect("asset/image/chicken.png",100,100)
   chicken.x = display.contentCenterX
   chicken.y = 130--]]
   local startButton = widget.newButton(
    {
        label = "START",
        --onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 280,
        height = 40,
        cornerRadius = 20,
        fillColor = { default={0,0,1,0.5}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={0,0.4,1,0.5}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)
startButton.x = display.contentCenterX
startButton.y = 270

startButton:addEventListener("tap", levelOne)

   --[[local startButton = display.newText( sceneGroup, "Start", display.contentCenterX, 210, native.systemFont, 24 )
   playButton:setFillColor( 0.77,1.5,0.3 )

   local aboutButton = display.newText( sceneGroup, "About", display.contentCenterX, 250, native.systemFont, 24 )
   aboutButton:setFillColor( 0.77,1.5,0.3 )


   playButton:addEventListener( "tap", levelOne )
   aboutButton:addEventListener( "tap", aboutGame )--]]

end

-- destroy()
function scene:destroy( event )
    
       local sceneGroup = self.view
       -- Code here runs prior to the removal of scene's view
      
   end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene