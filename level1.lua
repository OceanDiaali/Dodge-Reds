local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    enemiesTable = {}
    score = 0

    Random = math.random

    bg = display.newImageRect("image/background.png", 420, 600)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    --labels
    level = display.newText( "Level 1", 100, 200, native.systemFont, 26 )
    level.x = 70
    level.y = 450

    lives = display.newImageRect( "image/robot.png", 20, 20)
    lives.x = 230
    lives.y = 450

    lives = display.newImageRect( "image/robot.png", 20, 20 )
    lives.x = 250
    lives.y = 450

    lives = display.newImageRect( "image/robot.png", 20, 20 )
    lives.x = 270
    lives.y = 450

    timeCount = display.newText( "60", 100, 200, native.systemFont, 26 )
    timeCount.x = 270
    timeCount.y = 30

    score = display.newText( "Score:0", 100, 200, native.systemFont, 26 )
    score.x = 70
    score.y = 30

    --hero
    hero = display.newRoundedRect( 165, 200, 20, 20, 5 )
    hero.strokeWidth = 1
    hero:setFillColor( 0.1,0.8,0.9 )
    hero:setStrokeColor( 0, 1, 0 )
    hero.myName = "hero"

    
 
end--end of create scene
-----------------------------
function updateLabels()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end

function createEnemy()
    enemy = display.newImageRect( "image/redcross.png", 60,60 )
    table.insert( enemiesTable, enemy )
    physics.addBody( enemy, "dynamic", { radius=40, bounce=0.8 } )
    enemy.myName = "enemy"

    local whereFrom = Random(3)

    if ( whereFrom == 1 ) then
        -- From the left
        enemy.x = -60
        enemy.y = math.random( 500 )
        enemy:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
    elseif ( whereFrom == 2 ) then
        -- From the top
        enemy.x = math.random( display.contentWidth )
        enemy.y = -60
        enemy:setLinearVelocity( math.random( -40,40 ), math.random( 40,120 ) )
    elseif ( whereFrom == 3 ) then
        -- From the right
        enemy.x = display.contentWidth + 60
        enemy.y = math.random( 500 )
        enemy:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
    end

    --for torque
    enemy:applyTorque( math.random( -6,6 ) )

end--end of create enemy function

--move our hero
function moveHero(event)
    heroTouched = event.target
       
        if (event.phase == "began") then
                display.getCurrentStage():setFocus( heroTouched )
     
          -- here the first position is stored in x and y         
                heroTouched.startMoveX = heroTouched.x
                heroTouched.startMoveY = heroTouched.y
     
                 
        elseif (event.phase == "moved") then
                    
            -- here the distance is calculated between the start of the movement and its current position of the drag	 
                heroTouched.x = (event.x - event.xStart) + heroTouched.startMoveX
                heroTouched.y = (event.y - event.yStart) + heroTouched.startMoveY

        elseif event.phase == "ended" or event.phase == "cancelled"  then
                 
            -- here the focus is removed from the last position
                display.getCurrentStage():setFocus( nil )
     
        end
                     
        return true
end--end of move hero function    

 
---------------------------- 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

        local physics = require( "physics" )
        physics.start()
        physics.setGravity( 0, 0 )

        --creates enemies every 1.5 seconds,infinitely
        timer.performWithDelay( 1500, createEnemy, 0 )

        --move our hero listener
        hero:addEventListener("touch", moveHero)
 
    end
end--end of show scene
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
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