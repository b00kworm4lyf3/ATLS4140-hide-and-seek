extends Label

var _flash_tween: Tween

func _ready() -> void:
    Wallet.changed.connect(_refresh)
    Wallet.added.connect(_added)
    Wallet.decayed.connect(_decayed)
    _refresh()

func _refresh() -> void:
    var parts := ["Gold: %d" % Wallet.total_gold()]
    var decayed := Wallet.all_decayed() #not sorted! could print in different order (TODO)
    for kind in decayed:
        parts.append("%s: %d" % [kind, decayed[kind]])
    text = " ".join(parts)

func _added() -> void:
    _flash(Color.GOLD)

func _decayed() -> void:
    _flash(Color.BROWN)

func _flash(col: Color) -> void:
    if _flash_tween:
        _flash_tween.kill()
    _flash_tween = create_tween()
    _flash_tween.tween_property(self, "modulate", col, 0.15)
    _flash_tween.tween_property(self, "modulate", Color.WHITE, 0.4)
