extends Node

var level = 1
var score = 0
var highscore = [{name:"",score:0}]


# Called when the node enters the scene tree for the first time.
func _ready():
	await Supabase.ready
	query_score()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func query_score():
	var e = SupabaseQuery.new().from("highscore").select().order("score",1).range(0,10)
	var dbtask : DatabaseTask = await Supabase.database.query(e).completed
	if dbtask.error != null:
		print(dbtask.error)
		return
	print(dbtask.data)
	
	highscore = dbtask.data

func set_score(name:String,newScore:int):
	var e = SupabaseQuery.new().from("highscore").insert([{"name":name,"score":newScore}])
	var dbtask : DatabaseTask = await Supabase.database.query(e).completed	

	if dbtask.error != null:
		print(dbtask.error)	
	
	query_score()
