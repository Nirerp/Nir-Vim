return {
	"barrett-ruth/live-server.nvim",
	build = "pnpm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = require("config.live_server"),
}