import path from "path"
import fs from "fs"
import exec from "./execPromise.js"

export default (sourceFile, linkTarget) => {
	const initialPromise =
		fs.existsSync(linkTarget) ?
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

	return initialPromise
		.then(() => new Promise((resolve, reject) => {
			const execString =  `ln -s ${sourceFile} ${linkTarget}`
			return exec(execString)

		}))
		.catch((err) => {
			console.log(` * Unable to link ${linkTarget}!`)
			console.dir(err)

		})
}
