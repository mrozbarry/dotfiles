import fs from "fs"
import path from "path"
import { exec } from "child_process"

const availableModules = [
	"completion",
	"directory",
	"environment",
	"history-substring-search",
	"history",
	"input",
	"prompt",
	"spectrum",
	"syntax-highlighting",
	"archive",
	"git",
	"ssh",
	"utility"
]

const recommendedModules = [
	"completion",
	"directory",
	"history-substring-search",
	"prompt",
	"syntax-highlighting",
	"git",
	"utility"
]

export default (prompt, homePath) => {
	return prompt
		.ask({
			name: "zimModules",
			type: "checkbox",
			message: "Which zim modules would you like activated?",
			choices: availableModules,
			default: recommendedModules
		})
		.then((response) => {
			return confirmInstallation(prompt, response)
		})
		.then((response) => {
			if (response.confirmZim) {
				console.log("Installing zim...")
				return installZim(homePath, response)

			} else {
				return Promise.reject("Skipping zim install")

			}
		})
}


function confirmInstallation (prompt, response) {
	console.log("Preparing to install zim:")
	console.log(" zim install path: ", path.resolve(response.installPath, "zim"))
	console.log(" zim modules     : ", response.zimModules.join(", "))
	console.log(" replace .zlogin : ", "YES")
	console.log(" replace .zimrc  : ", "YES")
	console.log("----")

	return prompt
		.ask({
			name: "confirmZim",
			type: "confirm",
			message: "Are you sure you want to install zim like this?"
		})
}


export function installZim (homePath, { installPath, zimModules }) {
	const zimPath = path.resolve(homePath, ".zim")

	const initialPromise =
		fs.existsSync(zimPath) ?
		Promise.resolve() :
		new Promise((resolve, reject) => {
			const execString = `git clone --recursive https://github.com/Eriner/zim.git ${zimPath}`

			exec(execString, (err, stdout, stderr) => {
				console.log(stdout)

				if (err) {
					console.error(err)
					reject(err)
					return
				}
				resolve()
			})

		})

	return initialPromise
		.then(() => {
			return linkZimTemplateZlogin(homePath, zimPath)

		})
		.then(() => {
			return writeZimrc(homePath, zimModules)

		})
		.catch((err) => {
			throw err

		})
}


function linkZimTemplateZlogin (homePath, zimPath) {
	const zloginPath = path.resolve(homePath, ".zlogin")

	const initialPromise =
		fs.existsSync(zloginPath) ?
		(new Promise((resolve, reject) => {
			const date = (new Date()).toISOString().split("T")[0]
			const backup = `zlogin-backup-${date}`
			const oldZlogin = path.resolve(homePath, backup)

			if (fs.existsSync(oldZlogin)) {
				console.log(" * There was already a backup today, removing previous backup.")
				fs.unlinkSync(oldZlogin)
			}

			console.log(` * Backing up old zlogin file to ${oldZlogin}`)

			fs.rename(zloginPath, oldZlogin, (err) => {
				if (err) {
					reject(err)
					return
				}
				resolve()
			})
		})) :
		Promise.resolve()

	return initialPromise
		.then(() => new Promise((resolve, reject) => {
			const zloginTemplate = path.resolve(zimPath, "templates", "zlogin")
			const execString =  `ln -s ${zloginTemplate} ${zloginPath}`
			exec(execString, (err, stdout, stderr) => {
				console.log(stdout)
				if (err) {
					console.error(stderr)
					reject(err)
					return
				}
				resolve()
			})

		}))
		.catch((err) => {
			console.log(" * Unable to link zlogin!")
			console.dir(err)

		})
}


function writeZimrc (homePath, zimModules) {
	const config = `
# Zim Modules
zmodules=(${zimModules.join(" ")})

# Module Settings

zprompt_theme="minimal"

# Environment

ztermtitle="%n@%m:%~"

# Syntax highlighting

zhighlighters=(main brackets cursor)

# SSH

zssh_ids=(id_rsa)
`
	return new Promise((resolve, reject) => {
		fs.writeFile(path.resolve(homePath, ".zimrc"), config, (err) => {
			if (err) {
				reject(err)
				return
			}
			resolve()
		})
	})
}
