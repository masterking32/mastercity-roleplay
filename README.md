# Mythic Progress Bar
A simple action bar resource which allows actions to be visually displayed to the player and provides a callback function so actions can be peformed if the event was cancelled or not.

![Mythic Progress Bar](https://i.imgur.com/lFRCH7k.png)
 
>(Note: Video Is An Old Style, Has Since Been Updated. Sorry if you don't like the new style, can go look at an old commit and find the CSS)

https://www.youtube.com/watch?v=Y8y3XK0-siI

## How To Use:
To use, you just need to add a TriggerEvent into your client script where you're wanting the event to happen. Example TriggerEvent call;

```lua
exports['mythic_progbar']:Progress({
	name = "unique_action_name",
	duration = 1000,
	label = 'Doing Something',
	useWhileDead = true,
	canCancel = true,
	controlDisables = {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	},
	animation = {
		animDict = "missheistdockssetup1clipboard@base",
		anim = "base",
		flags = 49,
	},
	prop = {
		model = "p_amb_clipboard_01",
		bone = 18905,
		coords = { x = 0.10, y = 0.02, z = 0.08 },
		rotation = { x = -80.0, y = 0.0, z = 0.0 },
	},
	propTwo = {
		model = "prop_pencil_01",
		bone = 58866,
		coords = { x = 0.12, y = 0.0, z = 0.001 },
		rotation = { x = -150.0, y = 0.0, z = 0.0 },
	},
}, function(cancelled)
	if not cancelled then
		-- Do Something If Action Wasn't Cancelled
	else
		-- Do Something If Action Was Cancelled
	end
end)
```

Most of these flags are fairly self-explanatory, but theres's a few that have several options;


controlDisables - This allows you to disable a few sets of controls, these are broken down into 4 sets that I've found most often I was wanting to disable at some point;
* disableMovement | Standard Character Movement
* disableCarMovement | Vehicle Movement Keys
* disableMouse | Moving mouse thus intern camera around ped
* disableCombat | Weapon firing & Melee attacking


animation - This allows you to define an animation to play while the event occurs. This has several options that can be used and uses a cascading options to determine which to play. Highest priority is a Task, than it'll use AnimDict & Anim, if neither of those exist but the animation list exists in the options it'll default to a hardcoded task.
* task | Highest priority - if defined, this will be the only value used for animation
* animDict & anim & flags | Second highest priority, if task isn't defined it will try to use these values. Flags isn't required, and if it isn't provided will default to 1 (full body uncontrollable)
* empty animation { } | Final fallback, if the animation list is still provided but nothing set (Or no valid names set) it will default to playing the PROP_HUMAN_BUM_BIN task.


prop & propTwo - This will spawn the given prop name onto the player peds hand
* model | This will be the model name used to spawn the prop onto the player ped.
