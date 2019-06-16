# Mythic Notifications
A simple notification system inspired by NoPixel's

![Image of Notification](https://i.imgur.com/shT1XWc.png)

# Use
To display a notification simply make a call like below :

```lua
exports['mythic_notify']:DoHudText('type', 'message')
```

There 3 types;
* Inform - 'inform'
* Error - 'error'
* Success - 'success'

There are 4 types of notifications;
* DoShortHudText - Displays 1000ms (1 Second)
* DoHudText - Displays For 2500ms (2.5 Seconds)
* DoLongHudText - Displays For 5000ms (5 Seconds)
* DoCustomHudText - Displays For Set Time (In Milliseconds)

You can also use the client event to fire off a notification, useful for sending a notification from the server

```lua
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'type', text = 'message' })
```

As of right now there is only a single event which does DoHudText (Displays notification for 2500ms or 2.5 seconds)
