extends Node

signal changed

var _coins: Array[Dictionary] = [] #{amount: int, born: int, kind: string}
var _decayed: Dictionary = {} #{"type": amount}
var life := 3000 #240000 #four minute decay time

func _ready() -> void:
    var t := Timer.new()
    t.wait_time = 1.0
    t.autostart = true
    add_child(t)
    t.timeout.connect(_on_decay_tick)

func _on_decay_tick() -> void:
    decay(life)

func add_coins(amount: int, kind: String) -> void:
    _coins.append({"amount": amount, "born": Time.get_ticks_msec(), "kind": kind})
    changed.emit()

#func spend_coins(cost: int) -> void:

func spend_decay(kind: String, cost: int) -> bool:
    if _decayed.get(kind, 0) < cost:
        return false
    _decayed[kind] -= cost
    changed.emit()
    return true

func decay(lifetime: int) -> void:
    var now := Time.get_ticks_msec()
    var did_change = false

    while (not _coins.is_empty()) and ((now - _coins[0]["born"]) >= lifetime):
        var coin = _coins.pop_front()
        var k: String = coin["kind"]
        _decayed[k] = _decayed.get(k, 0) + coin["amount"]
        did_change = true

    if did_change: changed.emit()

func all_decayed() -> Dictionary:
    return _decayed

func total_gold() -> int:
    var total := 0
    for coin in _coins:
        total += coin["amount"]
    return total
