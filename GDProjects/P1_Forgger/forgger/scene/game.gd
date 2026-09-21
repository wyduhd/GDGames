extends Node2D

var car_scene:PackedScene = preload("res://scene/car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_finis_area_2d_area_entered(area: Area2D) -> void:
	print(area)
	print("我已经进来了")



func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	
	var marker2d = $CarStartPostions.get_children().pick_random() as Marker2D
	car.position = marker2d.position
	
	# 坐标是在添加进场景时实例化
	$Objects.add_child(car)
