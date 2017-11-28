import path from "path"
import fs from "fs"
import spawn from "./spawn.js"

export default (sourceFile, linkTarget) => {

	return backupOldFile(linkTarget)
		.then(() => new Promise((resolve, reject) => {
			return spawn("ln", ["-sf", sourceFile, linkTarget])
		}))
		.catch((err) => {
			console.log(` * Unable to link ${linkTarget}!`)
			console.dir(err)

		})
}

function backupOldFile(linkTarget) {
	return fs.existsSync(linkTarget) ?
		(new Promise((resolve, reject) => {
			const date = (new Date()).toISOString().split("T")[0]
			const oldFile = `${linkTarget}-backup-${date}`

			if (fs.existsSync(oldFile)) {
				console.log(" * There was already a backup today, removing previous backup.")
				fs.unlinkSync(oldFile)
			}

			console.log(` * Backing up old file to ${oldFile}`)

			fs.rename(linkTarget, oldFile, (err) => {
				if (err) {
					reject(err)
					return
				}
				resolve()
			})
		})) :
		Promise.resolve()
}
