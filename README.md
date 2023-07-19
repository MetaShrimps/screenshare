# RobloxScreenshare2Game
Allows you to Screenshare your entire Desktop into a Roblox game.
I AM NOT RESPONSIBLE FOR ANYTHING BAD DONE WITH THIS!

You are allowed to modify, edit, add anything you want to this project I honestly don't care. Just make sure you credit these awesome people:
-
- hashbmo : Original Code - https://github.com/hashbmo/rbx-py-screen-render

- Ethanthegrand14 : Canvas Draw Module - https://devforum.roblox.com/t/canvasdraw-a-powerful-pixel-based-graphics-engine-draw-pixels-lines-triangles-read-png-image-data-and-much-more/1624633

How to use!
-
Currently the scripts are set up to run on your localhost, this works but not if you wanna run it in public servers for all to see!
First you need to setup all that mumbo jumbo which is rather easy.
- Insert Server.lua or FrameStackerServer.lua into ServerScriptService in Roblox Studio
- Insert Screen.rbxm into Workspace
- Insert server.py into your IDE of choice, install the dependancies and run it
(This in itself should work perfectly fine.)

HOWEVER, I assume you are all here for use in public servers. (PLEASE DONT USE THIS TO SHOW ANYTHING AGAINST ROBLOX TOS, I AM NOT RESPONSIBLE IF THIS HAPPENS!)
You can technically use port forwarding but im not really going to go into that right now.

Firstly,
- Go to https://playit.gg/ and create an account 
- Download the playit software and run it
- Create a new tunnel (TCP Protocol) keep everything else default.
![image](https://user-images.githubusercontent.com/94509043/234405840-cd1786d2-6bfd-4994-b40b-3597127e384d.png)
- Now you need to copy this
![image](https://user-images.githubusercontent.com/94509043/234405995-89b9fa90-6c28-4728-8fc4-8a2d738ca1cc.png)
- Replace these in your Server.lua with the text we just copied that includes the port and address
![image](https://user-images.githubusercontent.com/94509043/234406233-6c97d762-3eb7-4a15-bbdd-aa867881a8ae.png)
- Now you need to go to server.py and replace your port with the one you copied
![image](https://user-images.githubusercontent.com/94509043/234406411-6509e52f-d400-4983-b6ca-16dede6adfb5.png)
BOOM! you're done just make sure the playit software is running and the python script is running, with this you can go into game and see your desktop at like 1 fps lol
![image](https://user-images.githubusercontent.com/94509043/234406957-5c53c75f-ff0b-41d1-810e-73c49acdf2e1.png)
