import { exec } from "child_process"

export default (command, cwd) => {
	return new Promise((resolve, reject) => {
		exec(command, { cwd, timeout: 20000 }, (error, stdout, stderr) => {
			console.log(stdout)
			if (error) {
				console.error(stderr)
				return reject(error)
			}
			resolve()
		})
	})
}
