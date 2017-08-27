import path from "path"

import prompt from "./src/prompt.js"
import installZim from "./src/installZim.js"

const { platform } = process

const HOME_DIRECTORY = process.env[platform == "win32" ? "USERPROFILE" : "HOME"]

prompt
	.ask({
		name: "installPath",
		message: "Install path",
		default: path.resolve(HOME_DIRECTORY, ".dotfiles")
	})
	.then((response) => {
		console.log("response A", response)
		return installZim(prompt, HOME_DIRECTORY)
	})
	.then((response) => {
		console.log("Installation complete")
		console.log("")
		console.log("Type `source ~/.zshrc` or open a new terminal to get all your changes.")
		console.log("")
		process.exit(0)
	})
	.catch((err) => {
		console.dir(err)
		process.exit(1)
	})
