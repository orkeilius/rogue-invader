extends Node
## auto load singleton to save data and dbconnection


signal data_ready

var level = 1
var score = 0
var action = ""
var highscore = [{"name":"","score":0}]
var player : Node2D = null



func _ready():
	await Supabase.ready
	await query_score()
	data_ready.emit()

func query_score():
	## query score from db
	var e = SupabaseQuery.new().from("highscore").select().order("score",1).range(0,10)
	var dbtask : DatabaseTask = await Supabase.database.query(e).completed
	if dbtask.data == null:
		print("error : ",dbtask.error)
	else:
		highscore = dbtask.data

func set_score(username:String,newScore:int):
	## send score to db
	var e = SupabaseQuery.new().from("highscore").insert([{"name":username,"score":newScore}])
	var dbtask : DatabaseTask = await Supabase.database.query(e).completed	

	if dbtask.error != null:
		print("error : ",dbtask.error)	
	
	await query_score()
