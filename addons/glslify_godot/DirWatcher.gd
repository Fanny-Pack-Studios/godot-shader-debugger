tool
extends Node

signal file_changed(path)

var changed_times = {}

export var directory := "." setget set_directory
export var watching := false setget set_watching

onready var fileReader = File.new()
var dir

func _ready():
	set_directory(directory)
	set_watching(watching)

func set_directory(value):
	directory = value

	dir = Directory.new()
	if dir.open(directory) != OK:
		printerr("Could not open directory %s" % directory)
		dir = null
		return

func set_watching(value):
	watching = value
	set_process(value)

func _process(_delta):
	if dir:
		scan()

func scan():
	dir.list_dir_begin(true, true)
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			file_name = dir.get_next()
			continue
		var modified_time = fileReader.get_modified_time(directory + "/" + file_name)
		if !changed_times.has(file_name):
			changed_times[file_name] = modified_time
		elif changed_times[file_name] != modified_time:
			changed_times[file_name] = modified_time
			emit_signal("file_changed", (directory + "/").get_base_dir() + "/" + file_name)
		file_name = dir.get_next()
	dir.list_dir_end()
