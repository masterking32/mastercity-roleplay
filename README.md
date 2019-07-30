# Mythic Notifications
A simple notification system inspired by NoPixel's

![Image of Notification](https://i.imgur.com/shT1XWc.png)

# Use
To display a notification simply make a call like below (Client-Side) :

```lua
exports['mythic_notify']:DoHudText('type', 'message')
```

There 3 types;
* Inform - 'inform'
* Error - 'error'
* Success - 'success'

There are 3 Pre-Defined Durations As Well As A Function To Define Your Own Duration
* DoShortHudText( type, text ) - Displays 1000ms (1 Second)
* DoHudText ( type, text ) - Displays For 2500ms (2.5 Seconds)
* DoLongHudText ( type, text ) - Displays For 5000ms (5 Seconds)
* DoCustomHudText ( type, text, duration ) - Displays For Set Time (In Milliseconds)
* PersistentHudText ( action, * ) - Creates A Notification That Will Remain On Screen Until End Function Is Called With Same ID. Valid Actions : start, update, end

There are also ClientEvents that can be used to trigger notifications from server
* mythic_notify:client:SendAlert OBJECT { type, text, duration } - If no duration is given, will default to 2500ms
* mythic_notify:client:PersistentHudText OBJECT { action, id, type, text } - Note: If using end action, type & text can be excluded)

Persistent Notifications Actions -
* start - ( id, type, text ) - Additionally, you can call PersistentHudText with the start action and pass an already existing ID to update the notification on the screen.
* end - ( id )