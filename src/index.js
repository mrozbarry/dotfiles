import path from "path"
import fs from "fs"

import prompt from "./helpers/prompt.js"
import configureZim from "./configurators/zim.js"
import configureVim from "./configurators/vim.js"
import installPowerline from "./installers/powerline.js"

const HOME_DIRECTORY = process.env.HOME;

const modules = {
	"Install Powerline Fonts": installPowerline,
	"Configure zim": configureZim(HOME_DIRECTORY),
	"Configure vim": configureVim(HOME_DIRECTORY)
}

prompt
	.ask({
		name: "installPath",
		message: "Install path",
		default: path.resolve(HOME_DIRECTORY, ".dotfiles")
	})
	.then(() => askWhatToInstall(prompt))
	.then((response) => {
		return response.whatToInstall.reduce((chain, moduleKey) => {
			return chain.then(() => {
				return modules[moduleKey](prompt)
			})
		}, Promise.resolve())

	})
	.then(() => {
		return postInstall()

	})
	.then(() => {
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


function askWhatToInstall (prompt) {
	return prompt
		.ask({
			name: "whatToInstall",
			type: "checkbox",
			message: "What should be installed",
			choices: Object.keys(modules)
		})
}

function postInstall () {
	const zshrc = path.resolve(HOME_DIRECTORY, ".zshrc")

	const zshrcContents = fs.readFileSync(zshrc).toString()

	const sourceDotFilesZshrc = `source ~/.dotfiles/zshrc`

	console.log("Post install...")

	if (zshrcContents.indexOf(sourceDotFilesZshrc) >= 0) {
		console.log(` * Skipping adding "${sourceDotFilesZshrc}", already in .zshrc`)
		return Promise.resolve()
	}

	return new Promise((resolve, reject) => {
		console.log(` * Adding "${sourceDotFilesZshrc}"`)
		fs.append(zshrc, `\n${sourceDotFilesZshrc}\n`, (err) => {
			if (err) {
				return reject(err)
			}
			resolve()
		})
	})
}
