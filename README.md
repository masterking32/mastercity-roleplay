# Mythic Progress Bar
A simple action bar resource which allows actions to be visually displayed to the player and provides a callback function so actions can be peformed if the event was cancelled or not.

## How To Use:
To use, you just need to add a TriggerEvent into your client script where you're wanting the event to happen. Example TriggerEvent call;

```lua
    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 10000,
        label = "Action Label",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            -- Do Something If Event Wasn't Cancelled
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


prop - This will spawn the given prop name onto the player peds hand
* model | This will be the model name used to spawn the prop onto the player ped.
