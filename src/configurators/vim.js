import fs from "fs"
import path from "path"
import spawn from "../helpers/spawn.js"
import symbolicLink from "../helpers/symbolicLink.js"


export default homePath => (prompt) => {
	const editors = supportedEditors(homePath)

	return prompt
		.ask({
			name: "editors",
			type: "checkbox",
			message: "Which vim-style editors should config be applied to?",
			choices: Object.keys(editors),
			default: Object.keys(editors)
		})
		.then((response) => {
			return confirmConfiguration(prompt, response, editors)
		})
		.then((response) => {
			if (response.confirmVim) {
				console.log("Configuring editors...")

				const vimrc = path.resolve(response.installPath, "vimrc")

				return response.editors.reduce((chain, editorKey) => {
					const configPath = editors[editorKey]

					return chain.then(() => {
						return chain.then(symbolicLink(vimrc, configPath))
					})

				}, Promise.resolve())

			} else {
				return Promise.reject("Skipping vim configuration")

			}
		})
		.then(() => installPlugins())
}


function supportedEditors (homePath) {
	return {
		"vim": path.resolve(homePath, ".vimrc"),
		"neovim": path.resolve(homePath, ".config", "nvim", "init.vim")
	}
}



function confirmConfiguration (prompt, response, allEditors) {
	console.log("Preparing to configure:")
	response.editors.map((editorKey) => {
		console.log(` ${editorKey.padRight(10).slice(0, 20)}: `, `Link ~/.dotfiles/vimrc to ${allEditors[editorKey]}`)
	})
	console.log(" Run plugin install  : ", "YES")
	console.log("----")

	return prompt
		.ask({
			name: "confirmVim",
			type: "confirm",
			message: "Are you sure you want to configure vim like this (old files will be backed up)?"
		})
}


function installPlugins () {
	return spawn("vim +PlugInstall +PlugClean +UpdateRemotePlugins +qall")
}
