# Your First Game Part 2: Game Loops

1 faucet and 1 sink
Progression unlocks
1 hard gate and 1 soft gate

---
Step 0: Make players not fall into traps (5m)

Step 1: Traps count enemies and close after limit (10m)

Step 2: Trap indicator for how many enemeis it has stored (10m)

Step 3: Trap indicator for how long the trap can hold enemies (10m)

Step 4: Sourcing of gem asset and spawning after closing of trap (10m)

Step 5: Picking up of gems and placing them in the center (10m)

Step 6: Gun upgrades, list of bullets and index of what bullet to use (15m)

Step 7: Change to use rounds instead of just spawning enemies forever (15m)

Step 8: Set rounds to start after reaching a gem count (10m)

---

Step 0 (3/5m):
	Added collider to traps on collision layer 3. Set player to collision layer 3

Step 1 (10/10m):
	Added capture counting logic to traps
	Added captured staate to enemies
	Added enabling and disabling of traps
 
Step 2 (10/10m):
	Add progress bar to trap
	Set its max value to the max capture size
	Set its value to the number of enemies captured
	After max is hit, tween to 0 and kill all stored enemies
	
Step 3 (19/10m):
	Add progress bar to trap
	Set its value to 1 when an enemy is captured
	Tween to zero after
	Set its value to zero when the trap is full
	
Step 4: (13/10m):
	Draw gem sprite
	Instantiate it when the trap fills
	
Step 5 (14/10m):
	Create counter and label on player
	Add script to gem
	Connect body entered signal to gem
	Gem adds to player and destroys itself
	Add altar which has a label
	When player comes near, take its gems and add it to altars gem count
	
Step 6:
	

# Your First Game Part 1

Loosely Follows Your First 2D GAME from ZERO by GD Quest
Assets are from https://www.gdquest.com/library/first_2d_game_godot4_vampire_survivor/

---

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

Step 9: Make enemies chase player (20m)

Step 10: Make enemies damage you (15m)

Step 11: Make damage kill you

Step 12: Make enemies get pushed back on hit (15m)

Step 13: Make traps which kill enemies
Step 15: Fix bugs and finishing touches (15m)

----------------------------

Bugs:
---Fix gun rotating towards center of the world
---Knockback is very not smooth for the player

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

Step 8 (19.5/20m):
	Create bullet object
	Add Shoot to input map
	Instantiate bullet
	Set global position to the barrel
	Set velocity to point out of the gun
	
Step 9 (9.5/20m):
	Add enemy and attach sprites
	Make player a singleton so it is easily accessable
	Get direction to player
	Move in that direction
		
Step 10/11 (19/20m):
	Add hit detection to enemy
	Add player health and hit function
	Add hit animation and knockback
	Add damage kills you (it just restarts the game)
	
Step 12 (19.5/15m):
	Make enemies detect bullets
	Make bullet data transfer
	Make enemies be knocked back and stunned
	Add hit animation
	
Step 13 (7/15m):
	Add traps scene
	Add sprite for trap
	Kill Player or enemy on touch
	
Step 15 (14/15m):
	Fix the rotation issue with the gun. Mouse coordinate system was wrong
	Add friction to enemy hit knocback

Total: 2.7 Hrs of work out of predicted 3 Hrs of work
