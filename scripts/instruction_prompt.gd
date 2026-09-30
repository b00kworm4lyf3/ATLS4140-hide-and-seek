extends Label

@onready var player := %player

const LURE_COST := 7
const LANTERN_COST := 30

var _step := 0

func _ready() -> void:
    visible = false
    Wallet.changed.connect(_refresh)
    Wallet.spend_decayed.connect(_advance.bind(0))
    player.lantern_bought.connect(_advance.bind(1))
    _refresh()

func _advance(from_step: int) -> void:
    if from_step != _step:
        return  #signal belongs to a different step
    _step += 1
    visible = false
    _refresh()

func _refresh() -> void:
    match _step:
        0:
            text = "Shift: spend %d stones to lure a faerie to you" % LURE_COST
            visible = Wallet.all_decayed().get("stone", 0) >= LURE_COST
        1:
            text = "Q: buy a lantern for %d gold" % LANTERN_COST
            visible = Wallet.total_gold() >= LANTERN_COST
        2:
            text = "Tutorial complete!"
            visible = true