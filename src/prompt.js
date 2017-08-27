import Enquirer from "enquirer"

const base = new Enquirer()
base.register("radio", require("prompt-radio"))
base.register("checkbox", require("prompt-checkbox"))
base.register("confirm", require("prompt-confirm"))

export default base
