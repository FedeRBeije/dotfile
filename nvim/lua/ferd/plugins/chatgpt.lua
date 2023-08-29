local chatgpt_status = pcall(require, "chatgpt")

if not chatgpt_status then
	return
end

require("chatgpt").setup({
	api_key_cmd = "gpg --decrypt ~/Documents/openai.txt.gpg",
})
