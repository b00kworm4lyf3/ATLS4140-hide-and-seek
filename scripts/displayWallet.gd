extends Label

func _ready() -> void:
    Wallet.changed.connect(_refresh)
    _refresh()

func _refresh() -> void:
    var parts := ["Gold: %d" % Wallet.total_gold()]
    var decayed := Wallet.all_decayed() #not sorted! could print in different order (TODO)
    for kind in decayed:
        parts.append("%s: %d" % [kind, decayed[kind]])
    text = " ".join(parts)
