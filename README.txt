/*---------------------------------------------------------------------
-------------------------------KATIE SOTO------------------------------
--------------------------GPS Sunrise / Sunset-------------------------
---------------------------------------------------------------------*/
https://github.com/KSoto/iPhone-GPS-Sunrise
https://github.com/KSoto/iPhone-GPS-Sunrise.git

//What is it?
This is an iPhone application used for calculating the Sunrise and Sunset times 
for given cities in the US.

//How do I use it?
First you need to set your location:
MANUAL:
1) Open the application
2) Click the gears near the top right of the screen to view the "Settings" Screen.
3) Click the "Manually Choose Location" button.
4) Select your state (united states only) from the list
5) Select your city from the list
Your location will be saved so that even when you close the application, your settings and locale will be saved and restored.
GPS:
1) Open the application
2) Click the gears near the top right of the screen to view the "Settings" Screen.
3) Click the "Get Location via GPS" button.
4) Our application will now automatically retrieve your location. If a warning screen pops up, press "OK".
5) The screen should now say "Success".
---If it does, press the "home" button at the top.
---If it doesn't, press the "back" button at the top, and select your location manually.
Your location will be saved so that even when you close the application, your settings and locale will be saved and restored.

You can optionally choose different sunrise and sunset types to be shown. To do so,
1) Click the gears near the top right of the screen.
2) Use the switches to mark which sunrise/sunset types you'd like to be enabled, or disabled. Click the little "i" for more information about each type.

//Features Completed:
++ALL U.S. cities and states are included for manual locations.
++ALL Sunrise/Sunset types included.
++GPS location detection.
++Indexed city table view.
++Lunar phase calculations.

//Bugs:
--Currently the indexed city table view isn't working: selecting a letter (let's say, "F"), then choosing a city (let's say the third one down: "Fair Oaks") will result in the selection of the city that is the same # down, but starting with A (for example, choosing "Fair Oaks" will result in choosing "Abilene", which is the third down).
--The calculated lunar phase degrees is incorrect.

//Features Not Completed:
--Labels were used instead of drawing a clock.

//External Dependancies:
--NO External Dependancies. Database is included.

//About The Author:
Katie Soto
KReneSoto@gmail.com
714-213-2228
