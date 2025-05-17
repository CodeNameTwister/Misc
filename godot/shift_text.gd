extends Node
# https://github.com/CodeNameTwister/Misc
# Twister

# Chars key
const STRS : String = 'abcdefghijklmnopqrstuvwxyz0123456789'
# Ingore case
const EXCEPTIONS : String = '!,._ ?'

func _ready() -> void:
	_test()

func _test() -> void:
	randomize()
	print(shift_text("Hello!, godot_4.3 world?", randi()))

## Return shifted raw text by @shit value
func shift_text(raw : String, shift : int) -> String:
	var data : PackedStringArray = []
	#raw = raw.strip_edges() ## Uncomment for remove blank begin/end char.
	for i : String in raw:
		if i in EXCEPTIONS:
			data.append(i)
		else:
			data.append(STRS[(i.unicode_at(0) + shift) % 26])
	return ''.join(data)
