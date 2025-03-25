MiniDeps.add("robitx/gp.nvim")
local gp = require("gp")
gp.setup({
  providers = {
    googleai = {
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
      secret = { "cat", "/home/gb/.secrets/googleai.key" },
    },
  },
  default_chat_agent = "flash",
  agents = {
    {
      provider = "googleai",
      name = "flash",
      chat = true,
      command = false,
      -- string with model name or table with model name and parameters
      model = { model = "gemini-2.0-flash", temperature = 1.1, top_p = 1 },
      -- system prompt (use this to specify the persona/role of the AI)
      system_prompt = require("gp.defaults").chat_system_prompt,
    },
  },
})
