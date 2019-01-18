%Olivia Xie
%June 21, 2016
%ICS201-04
%Blackjack game where the player collects hard drives to reach the number (or closest to) 21, and
%can battle the computer

%Variable Description
%xmouse: Variable that holds the x coordinates of the player's mouse
%ymouse: Variable that holds the y coordinates of the player's mouse
%button: Variable that holds whether the player's mouse button is up or down
%keyboard: Variable that holds which keys the player is pressing
%titlefont: Font used for the title name
%menufont: Font used for the start button
%finishfont: Font used for the finish button
%sidefont: Font used for the side bar
%CSfont: Font used for the cut screen
%enemyfont: Font used for the enemy speech
%attackfont: Font used for the attack button and displaying the damage dealt
%speechfont: Font used for the dragon's speech
%menupic: Image used in the start menu
%gamepic: Image used for the background of the game
%battlepic: Image used for the background of the fighting part of the game
%winlosepic: Image used for the cut screen telling player if they won or lost
%char_x: Variable used to move the player horizontally
%char_y: Variable used to move the player vertically
%enemy_x: Variable used to make the enemy move horizontally
%playerstar_x: Variable used to make the player's star move horizontally
%enemystar_x: Variable used to make the enemy's star move horizontally
%chardirection: Variable used to turn the character in different directions
%hd1-8: Variables that hold which hard drives the player has chosen
%hdvalue1-8: Variables that hold the randomly generated values of each hard drive
%hdcollect: Counter variable that keeps track of how mant hard drives the player has collected
%total: Variable that keeps the users total score
%playerdamage: Variable that holds a randomly generated number that determines how much damage the player deals
%playerhealth: Variable that holds the player's health
%enemydamage: Variable that holds a randomly generated number that determines how much damage the enemy deals
%enemyhealth: Variable that holds the player's health
%basicattack: Boolean variable that draws the attack when player hits the basic attack button
%dragonclaw: Boolean variable that draws the attack when player hits the dragon claw attack button
%exit_: Boolean variable that exits the second game loop when player wins or loses
%continue: Boolean variable that decides whether the player can continue to the 2nd part of the game or not (based on score)
%computerscore: Variable that holds the computer's score
%computerscorerand: Variable that randomly generates computer's score
%speechx: Variable that holds the x coordinates of the dragon's speech bubble
%speechy: Variable that holds the y coordinates of the dragon's speech bubble
%instructions: Boolean variable that lets the player choose whether they want to read the instructions or not

%Variable Declaration
var xmouse, ymouse, button : int
var keyboard : array char of boolean
var titlefont, menufont, finishfont, sidefont, CSfont, enemyfont, attackfont, speechfont : int
var menupic : int := Pic.FileNew ("dragon_warrior.bmp")
var gamepic : int := Pic.FileNew ("chinesebg.bmp")
var battlepic : int := Pic.FileNew ("cutscene.bmp")
var winlosepic : int := Pic.FileNew ("winlose.bmp")
var char_x : int := 588
var char_y : int := 260
var enemy_x : int := 700
var playerstar_x := 725
var enemystar_x := 225
var chardirection : int := 1
var hd1, hd2, hd3, hd4, hd5, hd6, hd7, hd8 : boolean := true
var hdvalue1, hdvalue2, hdvalue3, hdvalue4, hdvalue5, hdvalue6, hdvalue7, hdvalue8 : int
var hdcollect : int := 0
var total : int := 0
var playerdamage : int
var playerhealth : int := 1000
var enemydamage : int
var enemyhealth : int := 1000
var basicattack : boolean := false
var dragonclaw : boolean := false
var exit_ : boolean := false
var continue : boolean := true
var computerscore : int := 0
var compscorerand : int
var speechx : array 1 .. 3 of int := init (500, 700, 750)
var speechy : array 1 .. 3 of int := init (275, 150, 225)
var instructions : boolean := true

%Setting the screen size and mode
View.Set ("graphics:1000;600;offscreenonly")

%Playing Background Music
process BackgroundMusic
    loop
	Music.PlayFile ("BattleMusic.MP3")
    end loop
end BackgroundMusic

fork BackgroundMusic

%Setting the fonts
titlefont := Font.New ("Gabriola:70:bold")
menufont := Font.New ("Gabriola:40:bold")
finishfont := Font.New ("Gill Sans MT:25")
sidefont := Font.New ("Gill Sans MT:13")
CSfont := Font.New ("Gill Sans MT:40")
enemyfont := Font.New ("Gill Sans MT:18:bold")
attackfont := Font.New ("Agency FB:18:bold")
speechfont := Font.New ("Agency FB:25:bold")

%Loop that constantly checks where the player 's mouse is on the screen
loop

    Mouse.Where (xmouse, ymouse, button)

    View.Update

    %If statement that changes start button's colour when hovered over
    if xmouse >= 405 and xmouse <= 600 and ymouse >= 225 and ymouse <= 315 then

	%Drawing the Menu Screen

	%Background
	Pic.Draw (menupic, -350, -330, 0)

	%Title
	Draw.Text ("DRAGON WARRIOR", 200, 475, titlefont, white)
	Draw.Text ("HACK", 410, 380, titlefont, black)

	%Start Button
	Draw.Text ("START", 440, 280, menufont, black)
	Draw.Text ("(with story)", 405, 235, menufont, black)
	Draw.Text ("(without story)", 380, 120, menufont, white)

    elsif xmouse >= 380 and xmouse <= 630 and ymouse >= 110 and ymouse <= 155 then

	%Drawing the Menu Screen

	%Background
	Pic.Draw (menupic, -350, -330, 0)

	%Title
	Draw.Text ("DRAGON WARRIOR", 200, 475, titlefont, white)
	Draw.Text ("HACK", 410, 380, titlefont, black)

	%Start Button
	Draw.Text ("START", 440, 280, menufont, white)
	Draw.Text ("(with story)", 405, 235, menufont, white)
	Draw.Text ("(without story)", 380, 120, menufont, black)

    else

	%Drawing the Menu Screen

	%Background
	Pic.Draw (menupic, -350, -330, 0)

	%Title
	Draw.Text ("DRAGON WARRIOR", 200, 475, titlefont, white)
	Draw.Text ("HACK", 410, 380, titlefont, black)

	%Start Button
	Draw.Text ("START", 440, 280, menufont, white)
	Draw.Text ("(with story)", 405, 235, menufont, white)
	Draw.Text ("(without story)", 380, 120, menufont, white)

    end if

    %If statement that exits menu screen and starts game when player hits "start"
    if button = 1 and xmouse >= 405 and xmouse <= 600 and ymouse >= 225 and ymouse <= 315 then

	delay (500)
	cls
	exit

    elsif button = 1 and xmouse >= 380 and xmouse <= 630 and ymouse >= 110 and ymouse <= 155 then

	instructions := false
	delay (500)
	cls
	exit

    end if

end loop

%If statement that plays the instructions
if instructions = true then

    %Instructions cut screen

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 1
    Draw.Text ("Greetings young grasshopper...", 575, 225, speechfont, white)
    Draw.Text ("I have a very important mission for you.", 530, 190, speechfont, white)
    Draw.Text ("Listen carefully.", 660, 155, speechfont, white)
    View.Update
    delay (4000)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 2
    Draw.Text ("Our enemies are trying to hack", 575, 225, speechfont, white)
    Draw.Text ("into the mainframe that protects our", 553, 190, speechfont, white)
    Draw.Text ("kingdom, and only you can stop them.", 545, 155, speechfont, white)
    View.Update
    delay (5000)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 3
    Draw.Text ("To accomplish this, you must", 585, 225, speechfont, white)
    Draw.Text ("collect as many hard drives as you need", 530, 190, speechfont, white)
    Draw.Text ("to reach the number 21, or close to it.", 545, 155, speechfont, white)
    View.Update
    delay (5000)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 4
    Draw.Text ("Try to come closer to 21 than", 590, 225, speechfont, white)
    Draw.Text ("our enemies, then you will be able to", 550, 190, speechfont, white)
    Draw.Text ("protect us.", 690, 155, speechfont, white)
    View.Update
    delay (4000)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 5
    Draw.Text ("Use the arrow keys to move around,", 555, 225, speechfont, white)
    Draw.Text ("and click 'finish' when you're finished", 540, 190, speechfont, white)
    Draw.Text ("collecting hard drives.", 630, 155, speechfont, white)
    View.Update
    delay (4500)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 6
    Draw.Text ("But be careful. Even if you obtain", 570, 225, speechfont, white)
    Draw.Text ("an ideal number, it does not bring certain", 525, 190, speechfont, white)
    Draw.Text ("victory.", 720, 155, speechfont, white)
    View.Update
    delay (4000)
    cls

    %Drawing the background, speech bubble and skip button
    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)

    %Speech 7
    Draw.Text ("Good luck young grasshopper...", 580, 190, speechfont, white)
    View.Update
    delay (3000)
    cls

end if

%Initializing random values of the hard drives
hdvalue1 := Rand.Int (2, 11)
hdvalue2 := Rand.Int (2, 11)
hdvalue3 := Rand.Int (2, 11)
hdvalue4 := Rand.Int (2, 11)
hdvalue5 := Rand.Int (2, 11)
hdvalue6 := Rand.Int (2, 11)
hdvalue7 := Rand.Int (2, 11)
hdvalue8 := Rand.Int (2, 11)

%The game loop
loop

    %Keeping track of where the player's mouse is on the screen
    Mouse.Where (xmouse, ymouse, button)

    %Keeping track of which keys the player is pushing
    Input.KeyDown (keyboard)

    %Randomizing computer's score
    compscorerand := Rand.Int (2, 11)

    %If statement that calculates computer's final score
    if computerscore <= 16 then
	computerscore += compscorerand
    elsif computerscore > 16 then
	computerscore += 0
    end if

    %If statement that lets the player move the charater using keyboard input
    if keyboard (KEY_RIGHT_ARROW) then

	chardirection := 2

	%Nested if statement that prevents the character from moving through walls when going right
	if char_x = 245 and char_y > 300 and char_y < 490 then
	    char_x := 245
	elsif char_x = 245 and char_y > 42 and char_y < 225 then
	    char_x := 245
	elsif char_x = 875 and char_y > 300 and char_y < 408 then
	    char_x := 875
	elsif char_x = 875 and char_y > 112 and char_y < 225 then
	    char_x := 875
	elsif char_x = 425 and char_y > 407 and char_y < 497 then
	    char_x := 425
	elsif char_x = 800 and char_y > 407 and char_y < 497 then
	    char_x := 800
	elsif char_x = 425 and char_y > 32 and char_y < 122 then
	    char_x := 425
	elsif char_x = 800 and char_y > 32 and char_y < 122 then
	    char_x := 800
	elsif char_x > 969 then
	    char_x := 970
	else
	    char_x += 1
	end if

    elsif keyboard (KEY_LEFT_ARROW) then

	chardirection := 4

	%Nested if statement that prevents the character from moving through walls when going right
	if char_x = 925 and char_y > 295 and char_y < 490 then
	    char_x := 925
	elsif char_x = 925 and char_y > 42 and char_y < 225 then
	    char_x := 925
	elsif char_x = 305 and char_y > 300 and char_y < 408 then
	    char_x := 305
	elsif char_x = 305 and char_y > 112 and char_y < 225 then
	    char_x := 305
	elsif char_x = 375 and char_y > 407 and char_y < 497 then
	    char_x := 375
	elsif char_x = 375 and char_y > 32 and char_y < 122 then
	    char_x := 375
	elsif char_x = 750 and char_y > 407 and char_y < 500 then
	    char_x := 750
	elsif char_x = 750 and char_y > 32 and char_y < 122 then
	    char_x := 750
	elsif char_x < 206 then
	    char_x := 205
	else
	    char_x -= 1
	end if

    elsif keyboard (KEY_UP_ARROW) then

	chardirection := 3

	%Nested if statement that prevents the character from moving through walls when going up
	if char_y = 32 and char_x > 245 and char_x < 370 then
	    char_y := 32
	elsif char_y = 32 and char_x > 800 and char_x < 925 then
	    char_y := 32
	elsif char_y = 32 and char_x > 430 and char_x < 745 then
	    char_y := 32
	elsif char_y = 407 and char_x > 295 and char_x < 370 then
	    char_y := 407
	elsif char_y = 407 and char_x > 800 and char_x < 925 then
	    char_y := 407
	elsif char_y = 407 and char_x > 430 and char_x < 745 then
	    char_y := 407
	elsif char_y = 300 and char_x > 250 and char_x < 300 then
	    char_y := 300
	elsif char_y = 300 and char_x > 875 and char_x < 925 then
	    char_y := 300
	elsif char_y > 520 then
	    char_y := 520
	else
	    char_y += 1
	end if

    elsif keyboard (KEY_DOWN_ARROW) then

	chardirection := 1

	%Nested if statement that prevents the character from moving through walls when going down
	if char_y = 497 and char_x > 245 and char_x < 370 then
	    char_y := 497
	elsif char_y = 497 and char_x > 430 and char_x < 745 then
	    char_y := 497
	elsif char_y = 497 and char_x > 800 and char_x < 925 then
	    char_y := 497
	elsif char_y = 122 and char_x > 295 and char_x < 370 then
	    char_y := 122
	elsif char_y = 122 and char_x > 800 and char_x < 925 then
	    char_y := 122
	elsif char_y = 122 and char_x > 430 and char_x < 745 then
	    char_y := 122
	elsif char_y = 230 and char_x > 875 and char_x < 925 then
	    char_y := 230
	elsif char_y = 230 and char_x > 250 and char_x < 300 then
	    char_y := 230
	elsif char_y < 10 then
	    char_y := 10
	else
	    char_y -= 1
	end if

    end if

    %If statements that lets the user choose the hard drives

    %Choose hard drive 1
    if (char_x >= 375 and char_x <= 425 and char_y >= 42 and char_y <= 112) and hd1 = true then
	hd1 := false
	hdcollect += 1
	total += hdvalue1
    end if

    %Choose hard drive 2
    if (char_x >= 750 and char_x <= 800 and char_y >= 42 and char_y <= 112) and hd2 = true then
	hd2 := false
	hdcollect += 1
	total += hdvalue2
    end if

    %Choose hard drive 3
    if (char_x >= 750 and char_x <= 800 and char_y >= 417 and char_y <= 487) and hd3 = true then
	hd3 := false
	hdcollect += 1
	total += hdvalue3
    end if

    %Choose hard drive 4
    if (char_x >= 375 and char_x <= 425 and char_y >= 417 and char_y <= 487) and hd4 = true then
	hd4 := false
	hdcollect += 1
	total += hdvalue4
    end if

    %Choose hard drive 5
    if (char_x >= 205 and char_x <= 255 and char_y >= 473 and char_y <= 543) and hd5 = true then
	hd5 := false
	hdcollect += 1
	total += hdvalue5
    end if

    %Choose hard drive 6
    if (char_x >= 205 and char_x <= 255 and char_y >= 9 and char_y <= 60) and hd6 = true then
	hd6 := false
	hdcollect += 1
	total += hdvalue6
    end if

    %Choose hard drive 7
    if (char_x >= 915 and char_x <= 965 and char_y >= 9 and char_y <= 60) and hd7 = true then
	hd7 := false
	hdcollect += 1
	total += hdvalue7
    end if

    %Choose hard drive 8
    if (char_x >= 915 and char_x <= 965 and char_y >= 473 and char_y <= 543) and hd8 = true then
	hd8 := false
	hdcollect += 1
	total += hdvalue8
    end if

    %Drawing the main gameplay screen

    %Background
    Pic.Draw (gamepic, -100, -300, 0)

    %Course

    %Border
    Draw.FillBox (175, maxy, 185, 0, black)
    Draw.FillBox (175, 0, maxx, 10, black)
    Draw.FillBox (maxx - 10, 0, maxx, maxy, black)
    Draw.FillBox (maxx, maxy - 10, 175, maxy, black)

    %Horizontal top and bottom pieces
    Draw.ThickLine (450, 487, 725, 487, 20, black)
    Draw.ThickLine (450, 112, 725, 112, 20, black)

    %Left side pieces
    Draw.ThickLine (275, 375, 275, 487, 20, black)
    Draw.ThickLine (275, 487, 350, 487, 20, black)
    Draw.ThickLine (275, 225, 275, 112, 20, black)
    Draw.ThickLine (275, 112, 350, 112, 20, black)

    %Right side pieces
    Draw.ThickLine (900, 375, 900, 487, 20, black)
    Draw.ThickLine (900, 487, 825, 487, 20, black)
    Draw.ThickLine (900, 225, 900, 112, 20, black)
    Draw.ThickLine (900, 112, 825, 112, 20, black)

    %Side Bar (keeps track of score, health, etc)
    Draw.FillBox (0, 0, 175, maxy, 92)

    %Finish collecting hard drives button
    Draw.FillBox (10, 20, 162, 80, black)
    Draw.Text ("FINISH", 40, 40, finishfont, white)

    %Hard drives collected counter
    Draw.Text ("Hard drives collected:", 10, 545, sidefont, black)

    %Total score counter
    Draw.Text ("Total score:", 45, 400, sidefont, black)

    %If statement that changes colours of finish button when scrolled over
    if xmouse >= 10 and xmouse <= 162 and ymouse >= 20 and ymouse <= 80 then

	Draw.FillBox (10, 20, 162, 80, black)
	Draw.Text ("FINISH", 40, 40, finishfont, brightred)

    end if

    %Outputting #of hard drives collected and total score
    Draw.Text (intstr (hdcollect), 82, 472, sidefont, black)
    Draw.Text (intstr (total), 82, 327, sidefont, black)

    %Character

    %If statement that changes the direction the character is facing
    if chardirection = 1 then

	%Head
	Draw.FillOval (char_x, char_y + 50, 20, 20, black)
	Draw.ThickLine (char_x - 13, char_y + 50, char_x + 13, char_y + 50, 10, 90)
	Draw.FillOval (char_x - 10, char_y + 50, 2, 2, black)
	Draw.FillOval (char_x + 10, char_y + 50, 2, 2, black)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x + 19, char_y + 55, 3, 12)
	Draw.ThickLine (char_x + 19, char_y + 55, char_x + 30, char_y + 45, 3, 12)
	Draw.ThickLine (char_x + 19, char_y + 55, char_x + 30, char_y + 50, 3, 12)

	%Body
	Draw.FillBox (char_x - 10, char_y + 10, char_x + 10, char_y + 33, black)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x + 12, char_y + 20, 2, 12)
	Draw.ThickLine (char_x + 12, char_y + 20, char_x + 22, char_y + 15, 2, 12)
	Draw.ThickLine (char_x + 12, char_y + 20, char_x + 22, char_y + 18, 2, 12)

	%Legs
	Draw.FillOval (char_x + 5, char_y + 10, 3, 10, black)
	Draw.FillOval (char_x - 5, char_y + 10, 3, 10, black)

    elsif chardirection = 2 then

	%Head
	Draw.FillOval (char_x, char_y + 50, 20, 20, black)
	Draw.ThickLine (char_x, char_y + 50, char_x + 13, char_y + 50, 10, 90)
	Draw.FillOval (char_x + 12, char_y + 50, 2, 2, black)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x + 19, char_y + 55, 3, 12)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x - 30, char_y + 45, 3, 12)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x - 30, char_y + 50, 3, 12)

	%Body
	Draw.FillBox (char_x - 10, char_y + 10, char_x + 10, char_y + 33, black)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x + 12, char_y + 20, 2, 12)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x - 22, char_y + 15, 2, 12)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x - 22, char_y + 18, 2, 12)

	%Legs
	Draw.FillOval (char_x + 5, char_y + 10, 3, 10, black)
	Draw.FillOval (char_x - 5, char_y + 10, 3, 10, black)

    elsif chardirection = 3 then

	%Head
	Draw.FillOval (char_x, char_y + 50, 20, 20, black)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x + 19, char_y + 55, 3, 12)
	Draw.ThickLine (char_x, char_y + 55, char_x - 10, char_y + 45, 3, 12)
	Draw.ThickLine (char_x, char_y + 55, char_x, char_y + 40, 3, 12)

	%Legs
	Draw.FillOval (char_x + 5, char_y + 10, 3, 10, black)
	Draw.FillOval (char_x - 5, char_y + 10, 3, 10, black)

	%Body
	Draw.FillBox (char_x - 10, char_y + 10, char_x + 10, char_y + 33, black)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x + 12, char_y + 20, 2, 12)
	Draw.ThickLine (char_x, char_y + 20, char_x - 5, char_y + 15, 2, 12)
	Draw.ThickLine (char_x, char_y + 20, char_x - 3, char_y + 10, 2, 12)

    elsif chardirection = 4 then

	%Head
	Draw.FillOval (char_x, char_y + 50, 20, 20, black)
	Draw.ThickLine (char_x - 13, char_y + 50, char_x - 5, char_y + 50, 10, 90)
	Draw.FillOval (char_x - 12, char_y + 50, 2, 2, black)
	Draw.ThickLine (char_x - 19, char_y + 55, char_x + 19, char_y + 55, 3, 12)
	Draw.ThickLine (char_x + 19, char_y + 55, char_x + 30, char_y + 45, 3, 12)
	Draw.ThickLine (char_x + 19, char_y + 55, char_x + 30, char_y + 50, 3, 12)

	%Body
	Draw.FillBox (char_x - 10, char_y + 10, char_x + 10, char_y + 33, black)
	Draw.ThickLine (char_x - 12, char_y + 20, char_x + 12, char_y + 20, 2, 12)
	Draw.ThickLine (char_x + 12, char_y + 20, char_x + 22, char_y + 15, 2, 12)
	Draw.ThickLine (char_x + 12, char_y + 20, char_x + 22, char_y + 18, 2, 12)

	%Legs
	Draw.FillOval (char_x + 5, char_y + 10, 3, 10, black)
	Draw.FillOval (char_x - 5, char_y + 10, 3, 10, black)

    end if

    %Drawing the hard drives

    %If statement that draws hard drive 1 when hd1 = true
    if hd1 = true then
	Draw.FillBox (375, 90, 425, 134, gray)
    end if

    %If statement that draws hard drive 2 when hd2 = true
    if hd2 = true then
	Draw.FillBox (750, 90, 800, 134, gray)
    end if

    %If statement that draws hard drive 3 when hd3 = true
    if hd3 = true then
	Draw.FillBox (750, 465, 800, 509, gray)
    end if

    %If statement that draws hard drive 4 when hd4 = true
    if hd4 = true then
	Draw.FillBox (375, 465, 425, 509, gray)
    end if

    %If statement that draws hard drive 5 when hd5 = true
    if hd5 = true then
	Draw.FillBox (205, 521, 255, 565, gray)
    end if

    %If statement that draws hard drive 6 when hd6 = true
    if hd6 = true then
	Draw.FillBox (205, 35, 255, 79, gray)
    end if

    %If statement that draws hard drive 7 when hd7 = true
    if hd7 = true then
	Draw.FillBox (915, 35, 965, 79, gray)
    end if

    %If statement that draws hard drive 8 when hd8 = true
    if hd8 = true then
	Draw.FillBox (915, 521, 965, 565, gray)
    end if

    %If statement that determines whether the player should continue with the game based on their score
    if total > 21 then
	continue := false
    end if

    %If statement that lets player finish hard drive collecting portion of the game
    if xmouse >= 10 and xmouse <= 162 and ymouse >= 20 and ymouse <= 80 and button = 1 and total <= 21 then

	delay (500)
	exit

    elsif continue = false then

	View.Update
	delay (1500)
	exit

    end if

    View.Update
    delay (2)
    cls

end loop

%If statement that tells player they lost if their score exceeds 21
if continue = false then

    Pic.Draw (winlosepic, -300, -600, 0)
    View.Update
    delay (500)

    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You have let me down", 623, 225, speechfont, white)
    Draw.Text ("young grasshopper...", 635, 175, speechfont, white)
    View.Update
    delay (2000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You did not successfully acquire", 570, 225, speechfont, white)
    Draw.Text ("the required amount of hard drives,", 557, 190, speechfont, white)
    Draw.Text ("and gave away sacred information.", 560, 155, speechfont, white)
    View.Update
    delay (3000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("Do better next time...", 640, 190, speechfont, white)

    View.Update

end if

%If statement that lets player continue with game
if continue = true then

    %Story line text
    Draw.FillBox (0, 0, maxx, maxy, black)

    View.Update
    delay (500)

    Draw.Text ("MOMENTS LATER...", 285, 300, CSfont, white)

    View.Update
    delay (1300)
    cls

    %Initializing value of char_x and enemy_x
    char_x := 1075
    enemy_x := -75

    %Cut scene loop
    for charmove : 1 .. 5

	%Nested for loop that moves the character's and enemy's legs
	for charleg1 : 1 .. 5

	    %Updating location of the character and enemy
	    char_x -= 5
	    enemy_x += 5

	    %Drawing the background
	    Pic.Draw (battlepic, -150, -300, 0)

	    %Drawing the character

	    %Head
	    Draw.FillOval (char_x, 400, 75, 75, black)
	    Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
	    Draw.FillOval (char_x - 45, 400, 10, 10, black)
	    Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
	    Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
	    Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

	    %Legs
	    Draw.FillOval (char_x - 5, 220, 15, 35, black)
	    Draw.FillOval (char_x + 5, 220, 15, 35, black)

	    %Body
	    Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
	    Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
	    Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
	    Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

	    %Drawing the enemy

	    %Head
	    Draw.FillOval (enemy_x, 400, 75, 75, black)
	    Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
	    Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

	    %Legs
	    Draw.FillOval (enemy_x - 5, 220, 15, 35, black)
	    Draw.FillOval (enemy_x + 5, 220, 15, 35, black)

	    %Body
	    Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
	    Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
	    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
	    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

	    delay (20)

	end for

	View.Update

	%Nested for loop that moves the character's and enemy's legs
	for charleg2 : 1 .. 5

	    %Updating location of the character
	    char_x -= 5
	    enemy_x += 5

	    %Drawing the background
	    Pic.Draw (battlepic, -150, -300, 0)

	    %Drawing the character

	    %Head
	    Draw.FillOval (char_x, 400, 75, 75, black)
	    Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
	    Draw.FillOval (char_x - 45, 400, 10, 10, black)
	    Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
	    Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
	    Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

	    %Legs
	    Draw.FillOval (char_x - 20, 220, 15, 35, black)
	    Draw.FillOval (char_x + 20, 220, 15, 35, black)

	    %Body
	    Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
	    Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
	    Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
	    Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

	    %Drawing the enemy

	    %Head
	    Draw.FillOval (enemy_x, 400, 75, 75, black)
	    Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
	    Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
	    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

	    %Legs
	    Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
	    Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

	    %Body
	    Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
	    Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
	    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
	    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

	    delay (20)

	end for

	View.Update
	delay (20)

    end for

    %Enemy speaking
    Draw.Text ("YOU THINK YOU CAN GET AWAY WITH", 10, 550, enemyfont, black)
    Draw.Text ("THOSE HARD DRIVES SO EASILY?", 50, 500, enemyfont, black)

    View.Update
    delay (1000)

    Draw.Text ("WELL THINK AGAIN!", 75, 100, enemyfont, black)

    View.Update
    delay (1500)
    cls

    %Second game loop (when player is fighting the enemy)
    loop

	%Checking player's mouse coordinates
	Mouse.Where (xmouse, ymouse, button)

	%If statement that lets player choose attack
	if button = 1 and xmouse >= 650 and xmouse <= 800 and ymouse >= 75 and ymouse <= 150 and playerhealth > 0 and enemyhealth > 0 and basicattack = false then

	    basicattack := true
	    playerdamage := Rand.Int (1, 4)
	    enemydamage := Rand.Int (1, 4)

	elsif button = 1 and xmouse >= 825 and xmouse <= 975 and ymouse >= 75 and ymouse <= 150 and playerhealth > 0 and enemyhealth > 0 and dragonclaw = false then

	    dragonclaw := true
	    playerdamage := Rand.Int (1, 3)
	    enemydamage := Rand.Int (1, 4)

	end if

	%Drawing the background
	Pic.Draw (battlepic, -150, -300, 0)
	Draw.FillBox (0, 0, maxx, 45, black)

	%Drawing the character

	%Head
	Draw.FillOval (char_x, 400, 75, 75, black)
	Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
	Draw.FillOval (char_x - 45, 400, 10, 10, black)
	Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
	Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
	Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

	%Legs
	Draw.FillOval (char_x - 20, 220, 15, 35, black)
	Draw.FillOval (char_x + 20, 220, 15, 35, black)

	%Body
	Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
	Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
	Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
	Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

	%Drawing the enemy

	%Head
	Draw.FillOval (enemy_x, 400, 75, 75, black)
	Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
	Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
	Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
	Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
	Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

	%Legs
	Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
	Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

	%Body
	Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
	Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
	Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
	Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

	%Drawing attack buttons
	Draw.FillBox (650, 75, 800, 150, white)
	Draw.FillBox (825, 75, 975, 150, white)

	%Labeling attack button
	Draw.Text ("Basic Attack", 678, 105, attackfont, black)
	Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

	%Displaying player and computer health

	%Nested if statement that displays player health and puts 0 when health is 0 or lower
	if playerhealth > 0 and enemyhealth > 0 then
	    Draw.Text ("Health:", 780, 15, sidefont, white)
	    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
	    Draw.Text ("Health:", 130, 15, sidefont, white)
	    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
	elsif playerhealth <= 0 and enemyhealth > 0 then
	    Draw.Text ("Health:", 780, 15, sidefont, white)
	    Draw.Text ("0", 840, 15, sidefont, white)
	    Draw.Text ("Health:", 130, 15, sidefont, white)
	    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
	end if

	%Nested if statement that displays enemy health and puts 0 when health is 0 or lower
	if enemyhealth > 0 and playerhealth > 0 then
	    Draw.Text ("Health:", 780, 15, sidefont, white)
	    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
	    Draw.Text ("Health:", 130, 15, sidefont, white)
	    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
	elsif enemyhealth <= 0 and playerhealth > 0 then
	    Draw.Text ("Health:", 780, 15, sidefont, white)
	    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
	    Draw.Text ("Health:", 130, 15, sidefont, white)
	    Draw.Text ("0", 190, 15, sidefont, white)
	end if

	%Player attacking the enemy with basic attack
	if basicattack = true then

	    playerstar_x -= 5
	    Draw.FillStar (playerstar_x, 300, playerstar_x + 50, 350, black)

	    %Nested if statement that stops star from going through enemy
	    if playerstar_x <= 200 then

		playerstar_x := 725

		%Nested if statement that determines how much damage the player deals (generated randomly)
		if playerdamage = 1 then
		    playerdamage := 50
		    enemyhealth -= 50
		elsif playerdamage = 2 then
		    playerdamage := 100
		    enemyhealth -= 100
		elsif playerdamage = 3 then
		    playerdamage := 150
		    enemyhealth -= 150
		else
		    playerdamage := 200
		    enemyhealth -= 200
		end if

		%Drawing the background
		Pic.Draw (battlepic, -150, -300, 0)
		Draw.FillBox (0, 0, maxx, 45, black)

		%Drawing the character

		%Head
		Draw.FillOval (char_x, 400, 75, 75, black)
		Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
		Draw.FillOval (char_x - 45, 400, 10, 10, black)
		Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
		Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
		Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

		%Legs
		Draw.FillOval (char_x - 20, 220, 15, 35, black)
		Draw.FillOval (char_x + 20, 220, 15, 35, black)

		%Body
		Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
		Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
		Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
		Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

		%Drawing the enemy

		%Head
		Draw.FillOval (enemy_x, 400, 75, 75, black)
		Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
		Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

		%Legs
		Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
		Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

		%Body
		Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
		Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
		Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
		Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

		%Drawing attack buttons
		Draw.FillBox (650, 75, 800, 150, white)
		Draw.FillBox (825, 75, 975, 150, white)

		%Labeling attack buttons
		Draw.Text ("Basic Attack", 678, 105, attackfont, black)
		Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

		%Displaying player and computer health

		%Nested if statement that displays enemy health and puts 0 when health is 0 or lower
		if enemyhealth > 0 and playerhealth > 0 then
		    Draw.Text ("Health:", 780, 15, sidefont, white)
		    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
		    Draw.Text ("Health:", 130, 15, sidefont, white)
		    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
		elsif enemyhealth <= 0 and playerhealth > 0 then
		    Draw.Text ("Health:", 780, 15, sidefont, white)
		    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
		    Draw.Text ("Health:", 130, 15, sidefont, white)
		    Draw.Text ("0", 190, 15, sidefont, white)
		end if

		%Displaying how much damage was dealt
		if (playerdamage = 50 or playerdamage = 100 or playerdamage = 150 or playerdamage = 200) and enemyhealth > 0 and playerhealth > 0 then
		    Draw.Text (intstr (playerdamage), 490, 350, attackfont, yellow)
		elsif enemyhealth <= 0 and playerhealth > 0 then
		    Draw.Text ("You won the battle!", 450, 350, attackfont, yellow)
		    delay (1000)
		    exit_ := true
		end if

		View.Update
		delay (2000)

		%Nested if statement that makes enemy attack player
		if playerhealth > 0 and enemyhealth > 0 then

		    %Nested loop where enemy attacks player
		    loop

			%Drawing the background
			Pic.Draw (battlepic, -150, -300, 0)
			Draw.FillBox (0, 0, maxx, 45, black)

			%Drawing the character

			%Head
			Draw.FillOval (char_x, 400, 75, 75, black)
			Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
			Draw.FillOval (char_x - 45, 400, 10, 10, black)
			Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
			Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
			Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

			%Legs
			Draw.FillOval (char_x - 20, 220, 15, 35, black)
			Draw.FillOval (char_x + 20, 220, 15, 35, black)

			%Body
			Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
			Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
			Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
			Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

			%Drawing the enemy

			%Head
			Draw.FillOval (enemy_x, 400, 75, 75, black)
			Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
			Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

			%Legs
			Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
			Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

			%Body
			Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
			Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
			Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
			Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

			%Drawing attack button
			Draw.FillBox (650, 75, 800, 150, white)
			Draw.FillBox (825, 75, 975, 150, white)

			%Labeling attack button
			Draw.Text ("Basic Attack", 678, 105, attackfont, black)
			Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

			%Displaying player and computer health

			%Nested if statement that displays player health and puts 0 when health is 0 or lower
			if playerhealth > 0 and enemyhealth > 0 then
			    Draw.Text ("Health:", 780, 15, sidefont, white)
			    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
			    Draw.Text ("Health:", 130, 15, sidefont, white)
			    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			elsif playerhealth <= 0 and enemyhealth > 0 then
			    Draw.Text ("Health:", 780, 15, sidefont, white)
			    Draw.Text ("0", 840, 15, sidefont, white)
			    Draw.Text ("Health:", 130, 15, sidefont, white)
			    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			end if

			%Animating enemy attacking player
			enemystar_x += 5
			Draw.FillStar (enemystar_x, 300, enemystar_x + 50, 350, black)

			%If statement that prevents star from going through player
			if enemystar_x >= 755 then

			    enemystar_x := 225

			    %Nested if statement that determines how much damage the enemy deals (generated randomly)
			    if enemydamage = 1 then
				enemydamage := 50
				playerhealth -= 50
			    elsif enemydamage = 2 then
				enemydamage := 100
				playerhealth -= 100
			    elsif enemydamage = 3 then
				enemydamage := 150
				playerhealth -= 150
			    else
				enemydamage := 200
				playerhealth -= 200
			    end if

			    %Drawing the background
			    Pic.Draw (battlepic, -150, -300, 0)
			    Draw.FillBox (0, 0, maxx, 45, black)

			    %Drawing the character

			    %Head
			    Draw.FillOval (char_x, 400, 75, 75, black)
			    Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
			    Draw.FillOval (char_x - 45, 400, 10, 10, black)
			    Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
			    Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
			    Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

			    %Legs
			    Draw.FillOval (char_x - 20, 220, 15, 35, black)
			    Draw.FillOval (char_x + 20, 220, 15, 35, black)

			    %Body
			    Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
			    Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
			    Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
			    Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

			    %Drawing the enemy

			    %Head
			    Draw.FillOval (enemy_x, 400, 75, 75, black)
			    Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
			    Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

			    %Legs
			    Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
			    Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

			    %Body
			    Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
			    Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
			    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
			    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

			    %Drawing attack button
			    Draw.FillBox (650, 75, 800, 150, white)
			    Draw.FillBox (825, 75, 975, 150, white)

			    %Labeling attack button
			    Draw.Text ("Basic Attack", 678, 105, attackfont, black)
			    Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

			    %Displaying player and computer health

			    %Nested if statement that displays player health and puts 0 when health is 0 or lower
			    if playerhealth > 0 and enemyhealth > 0 then
				Draw.Text ("Health:", 780, 15, sidefont, white)
				Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
				Draw.Text ("Health:", 130, 15, sidefont, white)
				Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			    elsif playerhealth <= 0 and enemyhealth > 0 then
				Draw.Text ("Health:", 780, 15, sidefont, white)
				Draw.Text ("0", 840, 15, sidefont, white)
				Draw.Text ("Health:", 130, 15, sidefont, white)
				Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			    end if

			    %Displaying how much damage was dealt
			    if (enemydamage = 50 or enemydamage = 100 or enemydamage = 150 or enemydamage = 200) and playerhealth > 0 and enemyhealth > 0 then
				Draw.Text (intstr (enemydamage), 490, 350, attackfont, yellow)
			    elsif playerhealth <= 0 and enemyhealth > 0 then
				Draw.Text ("You LOSE!", 480, 350, attackfont, yellow)
				delay (1000)
				exit_ := true
			    end if

			    View.Update
			    delay (1000)

			    exit

			end if

			View.Update
			delay (10)

		    end loop

		end if

		%Setting attack back to false
		basicattack := false

	    end if

	    %Using dragon claw attack
	elsif dragonclaw = true then

	    playerstar_x -= 5
	    Draw.FillStar (playerstar_x, 300, playerstar_x + 50, 350, yellow)

	    %Nested if statement that stops star from going through enemy
	    if playerstar_x <= 200 then

		playerstar_x := 725

		%Nested if statement that determines how much damage the player deals (generated randomly)
		if playerdamage = 1 then
		    playerdamage := 0
		    enemyhealth -= 0
		elsif playerdamage = 2 then
		    playerdamage := 0
		    enemyhealth -= 0
		else
		    playerdamage := 350
		    enemyhealth -= 350
		end if

		%Drawing the background
		Pic.Draw (battlepic, -150, -300, 0)
		Draw.FillBox (0, 0, maxx, 45, black)

		%Drawing the character

		%Head
		Draw.FillOval (char_x, 400, 75, 75, black)
		Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
		Draw.FillOval (char_x - 45, 400, 10, 10, black)
		Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
		Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
		Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

		%Legs
		Draw.FillOval (char_x - 20, 220, 15, 35, black)
		Draw.FillOval (char_x + 20, 220, 15, 35, black)

		%Body
		Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
		Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
		Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
		Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

		%Drawing the enemy

		%Head
		Draw.FillOval (enemy_x, 400, 75, 75, black)
		Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
		Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
		Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

		%Legs
		Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
		Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

		%Body
		Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
		Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
		Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
		Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

		%Drawing attack buttons
		Draw.FillBox (650, 75, 800, 150, white)
		Draw.FillBox (825, 75, 975, 150, white)

		%Labeling attack buttons
		Draw.Text ("Basic Attack", 678, 105, attackfont, black)
		Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

		%Displaying player and computer health

		%Nested if statement that displays enemy health and puts 0 when health is 0 or lower
		if enemyhealth > 0 and playerhealth > 0 then
		    Draw.Text ("Health:", 780, 15, sidefont, white)
		    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
		    Draw.Text ("Health:", 130, 15, sidefont, white)
		    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
		elsif enemyhealth <= 0 and playerhealth > 0 then
		    Draw.Text ("Health:", 780, 15, sidefont, white)
		    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
		    Draw.Text ("Health:", 130, 15, sidefont, white)
		    Draw.Text ("0", 190, 15, sidefont, white)
		end if

		%Displaying how much damage was dealt
		if playerdamage = 0 and enemyhealth > 0 and playerhealth > 0 then
		    Draw.Text ("MISS!", 490, 350, attackfont, yellow)
		elsif playerdamage = 350 and enemyhealth > 0 and playerhealth > 0 then
		    Draw.Text (intstr (playerdamage), 490, 350, attackfont, yellow)
		elsif enemyhealth <= 0 then
		    Draw.Text ("You won the battle!", 450, 350, attackfont, yellow)
		    delay (1000)
		    exit_ := true
		end if

		View.Update
		delay (2000)

		%Nested if statement that makes enemy attack player
		if playerhealth > 0 and enemyhealth > 0 then

		    %Nested loop where enemy attacks player
		    loop

			%Drawing the background
			Pic.Draw (battlepic, -150, -300, 0)
			Draw.FillBox (0, 0, maxx, 45, black)

			%Drawing the character

			%Head
			Draw.FillOval (char_x, 400, 75, 75, black)
			Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
			Draw.FillOval (char_x - 45, 400, 10, 10, black)
			Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
			Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
			Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

			%Legs
			Draw.FillOval (char_x - 20, 220, 15, 35, black)
			Draw.FillOval (char_x + 20, 220, 15, 35, black)

			%Body
			Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
			Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
			Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
			Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

			%Drawing the enemy

			%Head
			Draw.FillOval (enemy_x, 400, 75, 75, black)
			Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
			Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
			Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

			%Legs
			Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
			Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

			%Body
			Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
			Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
			Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
			Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

			%Drawing attack button
			Draw.FillBox (650, 75, 800, 150, white)
			Draw.FillBox (825, 75, 975, 150, white)

			%Labeling attack button
			Draw.Text ("Basic Attack", 678, 105, attackfont, black)
			Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

			%Displaying player and computer health

			%Nested if statement that displays player health and puts 0 when health is 0 or lower
			if playerhealth > 0 and enemyhealth > 0 then
			    Draw.Text ("Health:", 780, 15, sidefont, white)
			    Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
			    Draw.Text ("Health:", 130, 15, sidefont, white)
			    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			elsif playerhealth <= 0 and enemyhealth > 0 then
			    Draw.Text ("Health:", 780, 15, sidefont, white)
			    Draw.Text ("0", 840, 15, sidefont, white)
			    Draw.Text ("Health:", 130, 15, sidefont, white)
			    Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			end if

			enemystar_x += 5
			Draw.FillStar (enemystar_x, 300, enemystar_x + 50, 350, black)

			%If statement that prevents star from going through player
			if enemystar_x >= 755 then

			    enemystar_x := 225

			    %Nested if statement that determines how much damage the enemy deals (generated randomly)
			    if enemydamage = 1 then
				enemydamage := 50
				playerhealth -= 50
			    elsif enemydamage = 2 then
				enemydamage := 100
				playerhealth -= 100
			    elsif enemydamage = 3 then
				enemydamage := 150
				playerhealth -= 150
			    else
				enemydamage := 200
				playerhealth -= 200
			    end if

			    %Drawing the background
			    Pic.Draw (battlepic, -150, -300, 0)
			    Draw.FillBox (0, 0, maxx, 45, black)

			    %Drawing the character

			    %Head
			    Draw.FillOval (char_x, 400, 75, 75, black)
			    Draw.ThickLine (char_x - 53, 400, char_x - 10, 400, 40, 90)
			    Draw.FillOval (char_x - 45, 400, 10, 10, black)
			    Draw.ThickLine (char_x - 62, 427, char_x + 62, 427, 15, brightred)
			    Draw.ThickLine (char_x + 62, 427, char_x + 110, 400, 15, brightred)
			    Draw.ThickLine (char_x + 62, 427, char_x + 110, 420, 15, brightred)

			    %Legs
			    Draw.FillOval (char_x - 20, 220, 15, 35, black)
			    Draw.FillOval (char_x + 20, 220, 15, 35, black)

			    %Body
			    Draw.FillBox (char_x - 40, 225, char_x + 40, 350, black)
			    Draw.ThickLine (char_x - 35, 260, char_x + 35, 260, 15, brightred)
			    Draw.ThickLine (char_x + 40, 260, char_x + 75, 230, 15, brightred)
			    Draw.ThickLine (char_x + 40, 260, char_x + 80, 253, 15, brightred)

			    %Drawing the enemy

			    %Head
			    Draw.FillOval (enemy_x, 400, 75, 75, black)
			    Draw.ThickLine (enemy_x + 53, 400, enemy_x + 10, 400, 40, 90)
			    Draw.FillOval (enemy_x + 45, 400, 10, 10, black)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x + 62, 427, 15, blue)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 400, 15, blue)
			    Draw.ThickLine (enemy_x - 62, 427, enemy_x - 110, 420, 15, blue)

			    %Legs
			    Draw.FillOval (enemy_x - 20, 220, 15, 35, black)
			    Draw.FillOval (enemy_x + 20, 220, 15, 35, black)

			    %Body
			    Draw.FillBox (enemy_x - 40, 225, enemy_x + 40, 350, black)
			    Draw.ThickLine (enemy_x - 35, 260, enemy_x + 35, 260, 15, blue)
			    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 75, 230, 15, blue)
			    Draw.ThickLine (enemy_x - 40, 260, enemy_x - 80, 253, 15, blue)

			    %Drawing attack button
			    Draw.FillBox (650, 75, 800, 150, white)
			    Draw.FillBox (825, 75, 975, 150, white)

			    %Labeling attack button
			    Draw.Text ("Basic Attack", 678, 105, attackfont, black)
			    Draw.Text ("DRAGON CLAW", 843, 105, attackfont, brightred)

			    %Displaying player and computer health

			    %Nested if statement that displays player health and puts 0 when health is 0 or lower
			    if playerhealth > 0 and enemyhealth > 0 then
				Draw.Text ("Health:", 780, 15, sidefont, white)
				Draw.Text (intstr (playerhealth), 840, 15, sidefont, white)
				Draw.Text ("Health:", 130, 15, sidefont, white)
				Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			    elsif playerhealth <= 0 and enemyhealth > 0 then
				Draw.Text ("Health:", 780, 15, sidefont, white)
				Draw.Text ("0", 840, 15, sidefont, white)
				Draw.Text ("Health:", 130, 15, sidefont, white)
				Draw.Text (intstr (enemyhealth), 190, 15, sidefont, white)
			    end if

			    %Displaying how much damage was dealt
			    if (enemydamage = 50 or enemydamage = 100 or enemydamage = 150 or enemydamage = 200) and playerhealth > 0 and enemyhealth > 0 then
				Draw.Text (intstr (enemydamage), 490, 350, attackfont, yellow)
			    elsif playerhealth <= 0 and enemyhealth > 0 then
				Draw.Text ("You LOSE!", 480, 350, attackfont, yellow)
				delay (1000)
				exit_ := true
			    end if

			    View.Update
			    delay (1000)

			    exit

			end if

			View.Update
			delay (10)

		    end loop

		end if

		%Setting attack back to false
		dragonclaw := false

	    end if

	end if

	View.Update
	delay (10)
	cls

	exit when exit_ = true

    end loop

end if

%when player loses battle
if exit_ = true and playerhealth <= 0 then

    Pic.Draw (winlosepic, -300, -600, 0)
    View.Update
    delay (500)

    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You have let me down", 623, 225, speechfont, white)
    Draw.Text ("young grasshopper...", 635, 175, speechfont, white)
    View.Update
    delay (2000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You did not successfully defeat", 570, 225, speechfont, white)
    Draw.Text ("the enemy, and gave them access to", 547, 190, speechfont, white)
    Draw.Text ("sacred information.", 640, 155, speechfont, white)
    View.Update
    delay (3000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("Do better next time...", 640, 190, speechfont, white)

    View.Update

    %When player wins battle but computers score was closer to 21
elsif exit_ = true and enemyhealth <= 0 and total <= 21 and computerscore <= 21 and total < computerscore then

    Pic.Draw (winlosepic, -300, -600, 0)
    View.Update
    delay (500)

    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You have let me down", 623, 225, speechfont, white)
    Draw.Text ("young grasshopper...", 635, 175, speechfont, white)
    View.Update
    delay (2000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You might have won the battle,", 580, 225, speechfont, white)
    Draw.Text ("but in the end, it was too late anyway.", 547, 175, speechfont, white)
    View.Update
    delay (3000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("Do better next time...", 640, 225, speechfont, white)
    View.Update
    delay (1000)
    Draw.Text ("Enemy Score: ", 650, 190, speechfont, white)
    Draw.Text (intstr (computerscore), 810, 190, speechfont, white)
    Draw.Text ("Your Score: ", 650, 155, speechfont, white)
    Draw.Text (intstr (total), 810, 155, speechfont, white)

    View.Update

    %When player wins the whole game
elsif (exit_ = true and enemyhealth <= 0 and total <= 21 and total >= computerscore) or (exit_ = true and enemyhealth <= 0 and total <= 21 and computerscore >= 21) then

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You have made me proud", 610, 225, speechfont, white)
    Draw.Text ("young grasshopper...", 635, 175, speechfont, white)
    View.Update
    delay (2000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("You won the battle, and successfully", 555, 225, speechfont, white)
    Draw.Text ("collected the required hard drives.", 567, 190, speechfont, white)
    Draw.Text ("You have protected the kingdom well.", 550, 155, speechfont, white)
    View.Update
    delay (4000)
    cls

    Pic.Draw (winlosepic, -300, -600, 0)
    Draw.FillPolygon (speechx, speechy, 3, black)
    Draw.FillOval (750, 200, 250, 100, black)
    Draw.Text ("Congratulations!", 655, 225, speechfont, white)
    View.Update
    delay (1000)
    Draw.Text ("Enemy Score: ", 650, 190, speechfont, white)
    Draw.Text (intstr (computerscore), 810, 190, speechfont, white)
    Draw.Text ("Your Score: ", 650, 155, speechfont, white)
    Draw.Text (intstr (total), 810, 155, speechfont, white)

    View.Update

end if






