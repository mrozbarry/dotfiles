import fs from "fs"
import path from "path"
import spawn from "../helpers/spawn"

export default (prompt) => {
	return prompt
		.ask({
			name: "confirmPowerlineFonts",
			type: "confirm",
			message: "Install powerline fonts?"
		})
		.then((response) => {
			if (response.confirmPowerlineFonts) {
				console.log("Installing powerline fonts...")
				return installPowerlineFonts()

			} else {
				return Promise.reject("Skipping powerline font install")

			}
		})
}

function installPowerlineFonts () {
	const target = `/tmp/powerline-fonts`
	console.log("Installing powerline fonts from git...")
	console.log(" * Cloning")
	return spawn("git", ["clone", "--depth 1", "https://github.com/powerline/fonts.git", target])
		.then(() => {
			console.log(" * Running install script (may ask for root)")
			return exec(`./install.sh`, target)
		})
		.then(() => {
			console.log(" * Cleaning up")
			return exec(`rm -rf ./powerline-fonts`, "/tmp")
		})
		.catch((err) => {
			console.log("Unable to install powerline fonts.")
			console.error(err)
		})
}
