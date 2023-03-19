local status, neo_tree = pcall(require, "neo-tree")
if not status then
    vim.notify("没有找到neo-tree")
    return
end

neo_tree.setup({
  filesystem = {
    window = {
      mappings = {
        ["o"] = "open",
      }
    }
  }
})
