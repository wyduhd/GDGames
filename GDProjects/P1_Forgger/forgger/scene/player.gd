extends CharacterBody2D

var direction:Vector2 = Vector2(1,1)
var speed:int = 200



func _process(_delta: float) -> void:
	# 通过Input.get_vector方法获取4个方向的向量，这四个名字的映射操作名称和设置中的操作隐射向对应
	direction = Input.get_vector("left","right","up","down")
	# 给向量乘以速度，则可以加快速度
	velocity = direction * speed
	# 调用动画播放函数
	animation()
	# 调用移动的方法
	move_and_slide()
	
	if Input.is_action_just_pressed("confirm"):
		print("pppppp")
		
		

func animation():
	# 先判断是否有向量，表示处于移动状态
	if direction :
		$AnimatedSprite2D.flip_h = direction.x > 0
		
		# 判断x方向不为0，则说明是在左右移动，否则就是在上下移动
		if direction.x != 0:
			$AnimatedSprite2D.animation = 'left'
		else :
			$AnimatedSprite2D.animation = 'up' if direction.y < 0 else "down"
	else :
		$AnimatedSprite2D.frame = 0
