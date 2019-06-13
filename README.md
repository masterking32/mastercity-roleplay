# mythic_notify
A simple notification system inspired by NoPixel's

# Use
To display a notification simply make a call like below :

```lua
exports['mythic_notify'].DoHudText('type', 'message')
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
