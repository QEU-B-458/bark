extends Control
@onready var homeserver = $Panel/GGVBox/homeserver
@onready var username = $Panel/GGVBox/username
@onready var password = $Panel/GGVBox/password
@onready var button = $Panel/VBoxContainer/Button

func _ready():
	button.pressed.connect(func():
		login()
			)

func login():
	var validated = true
	# validate input fields
	if homeserver.text == "":
		Notify.sendNotification("Please make sure to enter a valid homeserver")
		validated = false
	if username.text == "":
		Notify.sendNotification("Please make sure to enter a valid username")
		validated = false
	if password.text == "":
		Notify.sendNotification("Please make sure to enter the correct password")
		validated = false
	if validated:
		button.disabled = true
		homeserver.editable = false
		username.editable = false
		password.editable = false
		if await Vector.login_username_password(
			homeserver.text,
			username.text,
			password.text
		):
			pass
	
