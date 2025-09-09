# Your First Game

Loosely Follow Your First 2D GAME from ZERO by GD Quest

Step 1: Define ideas and constraints (10m):
	What choices does the player make
	How does the player fail?
	How does the player succeed?
	What makes a feature stand out? How does it hook the player?
Step 2: Define the core game loop (smallest repeatable cycle of play) (5m): 
Step 3: Create project structure (5m)
Step 4: Import GD Quests's Assets (5m)
Step 5: Make player movement (15m)
Step 6: Add background (5m)
Step 7: Make gun rotate towards mouse (30m)
Step 8: Make player shoot on click (20m)
Step 9: Make enemies chase player (15m)
Step 10: Make enemies damage you
Step 11: Make damage kill you
Step 12: Make enemies get pushed back on hit (15m)
Step 13: Make traps which kill enemies

----------------------------

Step 1 (7.5/10m):
	Which enemy to shoot
	Where to go to avoid enemies
	Where to go to not get backed into a corner
	Player fails by stepping onto a trap
	Player fails by getting overwhelmed by enemies
	Player succeeds by pushing enemies onto traps
	Traps are a unique feature to defeat enemies and create obstacles
	
Step 2 (2.5/5m):
	The core game loop is as simple as clicking to shoot at enemies to push them into pits
	Secondarily, death and a limited number of enemies create win and lose conditions for this loop
	
Step 3 (2/5m):
	Create folders for objects and scenes.
	Objects have their own folders listed in objects folder
	Each object has all its assets in its folder
	
Step 4 (7/5m):
	Imported assets into folders from GD Quest
	
Step 5 (14.5/15m):
	Attach imported sprites to player body
	Create input map
	Write movement script
	Create main scene and add player

Step 6 (15/5m):
	Add trees
	Add collision shape to trees
	Add background with Parallax2D

Step 7 (20/30m):
	Add code to rotate the object that holds the gun towards the mouse
	Add code that rotates the gun the final degrees towards the mouse

Step 8:
	Create bullet object
	Add Shoot to input map
	
