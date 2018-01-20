-----------------------------------------------------------------------------------------
--
-- main_origin.lua
-- Developed by Patrick C Diali Jan 21, 2018
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )
 
-- Seed the random number generator
--math.randomseed( os.time() )
 
-- Go to the menu screen
composer.gotoScene( "menu" )