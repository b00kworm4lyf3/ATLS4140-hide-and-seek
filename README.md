# Hide and Seek game for ATLS4140: Game Development

After working on the first game for this class I decided I wanted to start from scratch to build my hide and seek game rather than trying to bend the tutorial game into the shape I wanted it to be.

## Theme/Story Plans/Questions

This will be themed as a hunt for faeries! There will be different types and they will have different behaviours.

What happens when you catch them? Do they give you something?

## Dev Plans

### Assignment 1: Your First Game (Rebuild/Revamp)

- 3D with player camera control (from [GDQuest Tutorial](https://www.youtube.com/watch?v=JlgZtOFMdfc))
- Procedural forest scenery: trees, rocks, water [TODO]
- Day/night cycle [TODO]
- Faeries spawn out of sight and hide behind trees/rocks/etc
- Mostly placeholder assets until it's all functional

### Assignment 2: Loop Implementation

- 'Catch' faeries to get gold/silver (faucet + secondary loop)
    - if you don't use it fast enough it degrades and turns into leaves/acorns/stones/etc (faucet/converter and drives soft gate of better items)
    - can use degraded currency to attract faeries to you or make them easier to see (sink)
    - need gold/silver in order to buy or upgrade fae items (such as a lantern to help find night fae) (sink + secondary loop)
- Befriend faeries (main loop)
    - use degraded items to attract fae + develop friendship (progression)
    - collect special item from them (faucet to access rarer fae, not for prototype though)
    - get invited to their homes (hard gate -- yay another place to go!)

### Assignment 4: Gameplay Levels
#### 'Level' Objective: 
Teach the player the catch and lure loop and then require them to use it.

#### Implementation
- Design my game space to better teach the catch -> decay -> lure loop
    - Player starts in a forest clearing with many fae (2 hours)
    - 'click' instruction for the first few fae encountered (1 hour)
    - once gold decays prompt shift to lure
    - modulate gold label to bring it to player's attention when vals change 

- Implement day/night cycle so player needs to use lantern at night
    - Night time is really difficult to play through without the lantern
    - Buying the lantern is the end of this 'level'

#### Stretch Goals
- Make the 'level' feel better:
    - Tune resource decay time
    - Fae give set gold amounts (starting fae have 1, next have 3, etc)
    - Add lantern on/off toggle

- Get fae befriending working, once one has hit the highest level the player has 'won' that section

