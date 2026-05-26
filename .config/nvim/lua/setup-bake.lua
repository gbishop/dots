-- configure for baking
--
vim.opt.rtp:append("/home/gb/bake/nvim")

vim.filetype.add({
  extension = {
    bake = "bake",
  },
})
