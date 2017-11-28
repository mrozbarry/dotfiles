import { spawn } from "child_process"

export default (command, args, options = {}) => {
	return new Promise((resolve, reject) => {
    console.log(`\n${command} ${args.join(" ")}\n`)
    const proc = spawn(command, args, Object.assign(
      {},
      options,
      {
        shell: true,
        detached: true,
        stdio: "inherit"
      }))
    proc.on("exit", (code) => {
      if (code > 0) reject(`Exited ${command} ${args.join(" ")} with status ${code}`)
      else resolve()
    })
    proc.on("error", (err) => {
      console.error(err)
      reject(`Error running ${command} ${args.join(" ")}`)
    })
	})
}
