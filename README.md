# Mythic Notifications
A simple notification system inspired by NoPixel's

![Image of Notification](https://i.imgur.com/shT1XWc.png)

## Use
To display a notification simply make a call like below (Client-Side) :

```lua
exports['mythic_notify']:DoHudText('type', 'message')
```

### Notification Styles
* Inform - 'inform'
* Error - 'error'
* Success - 'success'

### Client-Side Functions (All Exported)
* DoShortHudText( type, text, style ) - Displays 1000ms (1 Second)
* DoHudText ( type, text, style ) - Displays For 2500ms (2.5 Seconds)
* DoLongHudText ( type, text, style ) - Displays For 5000ms (5 Seconds)
* DoCustomHudText ( type, text, duration, style ) - Displays For Set Time (In Milliseconds)
* PersistentHudText ( action, * ) - Creates A Notification That Will Remain On Screen Until End Function Is Called With Same ID. Valid Actions : start & end

### Client Events (Trigger Notification From Server)
* mythic_notify:client:SendAlert OBJECT { type, text, duration } - If no duration is given, will default to 2500ms
* mythic_notify:client:PersistentHudText OBJECT { action, id, type, text } - Note: If using end action, type & text can be excluded)

### Persistent Notifications Actions -
* start - ( id, type, text, style ) - Additionally, you can call PersistentHudText with the start action and pass an already existing ID to update the notification on the screen.
* end - ( id )

> Note About ID: This is expected to be an entirely unique value that your resource is responsible for tracking. I’d suggest using something related to your resource name so there’s no chance of interferring with any other persistent notifications that may exist.

### Custom Style Format -
The custom style is a simple array in key, value format where the key is the CSS style attribute and the value is whatever you want to set that CSS attribute to.

#### Examples -
##### Client:
```LUA
exports['mythic_notify']:DoHudText('inform', 'Hype! Custom Styling!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
```

##### Server:
```LUA
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Hype! Custom Styling!', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
```

##### Result:
![Custom Styling](https://i.imgur.com/FClWCqm.png)