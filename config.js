var config = {
  'title': 'FiveM RP',
  'welcomeMessage': 'WELCOME TO FIVEM RP',
  // Add images for the loading screen background.
  images: [
  'https://img.skordy.com/j/RGvCc.jpeg', 'https://img.skordy.com/j/nsQy5.jpeg', 'https://img.skordy.com/j/KNlLn.jpeg',
  ],
  // Turn on/off music
  enableMusic: true,
  // Music list. (Youtube video IDs). Last one should not have a comma at the end.
  music: [
    'vraG1S_SPAc', 'dBb060OPegg', 'VXUlwPSS-SQ', 'tgIqecROs5M'
  ],
  // Change music volume 0-100.
  musicVolume: 05,
  // Change Discord settings and link.
  'discord': {
    'show': true,
    'discordLink': 'https://website.com/discord',
  },
  // Change which key you have set in guidehud/client/client.lua
  'menuHotkey': 'F2',
  // Turn on/off rule tabs. true/false
  'rules': {
    'generalconduct': true,
    'roleplaying': true,
    'rdmvdm': true,
    'metagaming': true,
    'newlife': true,
    'abuse': true,
  },
}

// Home page annountments.
var announcements = [
  'Read the rules, and have fun!',
]


// Add/Modify rules below.
var guidelines = [
  'Breaking any of these rules may result in administrative action.',
  'Not knowing the rules does not make players exempt from them.',
  'If another player breaks rules it does not give you the right to break a rule yourself.',
  'Trying to skirt an obvious rule may result in a ban.',
  'Staff reserves the right to ban players they feel are being toxic, disruptive or not playing by the spirit of the game mode.',
  'Not all rules can be listed so use common sense when playing.',
  'Minor rules may be superseded by excellent role-play as determined by Staff.',
]

var generalconduct = [
  'Racism, bigotry, anti-antisemitism, and any other form of harassment is not tolerated.',
  'Players can not role-play sexual assault, rape, or anything that can be deemed as intense and inappropriate behavior.',
]

var roleplaying = [
  'Players must role-play every situation.',
  '- Example: "I ran the stoplight because of server lag" or similar situations is not allowed.',
  '- Exception:  Players may only go Out Of Character when a staff member asks you to explain a situation and/or authorizes you to go OOC.',
  'Players must value their lives.',
  '- Example:  If a player has a gun to their head they must act accordingly.',
  'Players can not rule quote.',
  'Players must role-play medical injuries correctly at all times.',
  'Players can not do something intentionally in front of police that wouldn\'t ordinarily be done. This is known as "Cop Baiting".',
  'Players can not steal unattended police/medic vehicles parked at police stations or hospitals.',
  'Players can not enter an apartment to avoid consequences or role-play.',
  'Players can not intentionally respawn, log out, or find another way to avoid or skirt potential role-play.',
]

var rdmvdm = [
  'Players can not kill or attack other players without role-play.',
  'Players must have a reason or a benefit to their character when trying to kill or attack another player.',
  '- Example:  Yelling "hands up or die" without a reason is not valid role-play.',
  'Players may use vehicles as weapons as long as its within role-play and logical.',
  'Players can not intentionally use aerial vehicles to collide into other players or vehicles.',
]

var metagaming = [
  'Players can not use information gathered outside of role-play to influence their actions within the game.',
  'Players may remove another players communication devices in an role-play manner.',
  'Players with removed communication devices are expected to mute their third-party communication software.',
  'Players may only remove another players communication device when it is logical within role-play.',
  'Players can not use information gathered from outside the server (such as forums) while in-game.',
  'Knowledge and experiences should be learned and discovered by a players current character in-game.',
  'Players can not force another player into a situation that they cannot role-play out of. This is known as "Power-Gaming".',
  'Players must use common sense when encountering power-gaming potential situations.',
]

var newlife = [
  'Players that are downed but then stabilized should continue role-play accordingly.',
  'Players that are killed ("respawn" is prompted) must "forget" their previous situation in which they have died.',
  'Players that are killed may still proceed with their current character. (players may DOA their character and start a new character story).',
]

var abuse = [
  'Players can not abuse or exploit bugs.',
  'Players can not hack or script. (using third-party software, injectors, etc).',
  'Players who report an exploit using the proper procedures will be rewarded ingame.',
]

// Modify hotkeys below.
var generalhotkeys = [
  'Press <kbd>SHIFT</kbd> + <kbd>H</kbd> to switch voice distance.',
  'Hold <kbd>H</kbd> to view your current voice distance.',
  'Press <kbd>M</kbd> to view player list.',
  'Press <kbd>L</kbd> to open your personal inventory.',
  'Press <kbd>Y</kbd> to open your vehicles inventory.',
]

var rphotkeys = [
  'Use <code>/twt {message}</code> in chat to use twitter.',
  'Press <kbd>X</kbd> to put your hands up.',
  'Press <kbd>F1</kbd> to bring up your phone.',
  'Press <kbd>PAGEDOWN</kbd> to view your wallet.',
  'Press <kbd>F3</kbd> to bring up the animation menu.',
  'Press <kbd>LEFT CTRL</kbd> to crouch.',
  'Press <kbd>SHIFT</kbd> + <kbd>E</kbd> to sit.',
  'Press <kbd>B</kbd> to point.',
]

var vehiclehotkeys = [
  'Press <kbd>U</kbd> to lock/unlock your vehicle.',
  'Press <kbd>B</kbd> to put your seatbelt on.',
  'Press <kbd>DEL</kbd> to turn your engine on/off.',
  'Press <kbd>PAGEUP</kbd> to bring up vehicle options.',
  'Press <kbd>Q</kbd> to turn on emergency lights. (EMS & Police)',
  'Press <kbd>LEFT ALT</kbd> to turn on sirens. (EMS & Police)',
  'Press <kbd>R</kbd> to change siren. (EMS & Police)',
]

var jobshotkeys = [
  'Press <kbd>F6</kbd> to bring up your job menu.',
  'Press <kbd>NUMPAD 5</kbd> to bring up vehicle radar. (Police)',
]