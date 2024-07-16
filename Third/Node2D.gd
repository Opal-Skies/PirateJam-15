extends Node2D
var state = true

const SPINE_SEGMENTS = 20
const LENGTH_PER = 50

var pos1: Vector2
var point:Array = []
var t:Array = [30,50,40]
var angles:Array = []



func _ready():
	DisplayServer.window_set_mode(3)


func _physics_process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
		
	if state == false:
		return
	
	for i in range(1, SPINE_SEGMENTS+1):
		if point.size() < i:
			point.append(Vector2(-100,-100))
		if angles.size() < i:
			angles.append(0)
		if t.size() < i:
			t.append(30)
		
	for i in (point.size() - 2):
		var a = point[i]
		var m = point[i+1]
		var b = point[i+2]
		
		var dist_am = sqrt(pow((m[0]-a[0]),2)+pow((m[1]-a[1]),2))
		var dist_ab = sqrt(pow((b[0]-a[0]),2)+pow((b[1]-a[1]),2))
		var dist_bm = sqrt(pow((m[0]-b[0]),2)+pow((m[1]-b[1]),2))
		angles[i+1] = acos((pow(dist_am,2) + pow(dist_bm,2) - pow(dist_ab,2)) / (2*dist_am*dist_bm))
		
	if Input.is_action_pressed("left_click"):
		pos1 = get_global_mouse_position()
	var mouse_dist = sqrt(pow((point[0][0]-pos1[0]),2)+pow((point[0][1]-pos1[1]),2))
	if mouse_dist > 10:
		mouse_dist = mouse_dist/1.02
	point[0] = move_point(point[0],pos1,mouse_dist)
	
	for i in (point.size() - 1):
		point[i+1] = move_point(point[i+1],point[i],30)
	
	queue_redraw()


func _draw():
	for i in point.size():
		draw_arc(point[i],t[i],0,2*PI,15,Color.WHITE,3,true)
	
	for i in (point.size() - 1):
		var line = PackedVector2Array([point[i],point[i+1]])
		draw_polyline(line,Color.WHITE,3,true)
	
	
func move_point(p,c,r):
	var w = Vector2(p[0] - c[0], p[1] - c[1])
	var length = sqrt(w[0]*w[0] + w[1]*w[1])
	var a = Vector2(c[0] + w[0]/length * r, c[1] + w[1]/length * r)
	return a
