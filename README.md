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
