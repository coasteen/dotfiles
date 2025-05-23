local function setup_qol()
  vim.o.swapfile = false
  vim.o.backup = false
  vim.o.undofile = true
  vim.o.updatetime = 200
  vim.o.timeoutlen = 300
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.o.clipboard = "unnamedplus"
  vim.o.splitright = true
  vim.o.splitbelow = true
  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true
  vim.o.smartindent = true
  vim.o.autochdir = true
  local function _1_()
    local line = vim.fn.line("'\"")
    local last = vim.fn.line("$")
    if ((line > 1) and (line < last)) then
      return vim.api.nvim_win_set_cursor(0, {line, 0})
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("BufReadPost", {callback = _1_})
  local function _3_()
    return vim.highlight.on_yank({higroup = "IncSearch", timeout = 200})
  end
  vim.api.nvim_create_autocmd("TextYankPost", {pattern = "*", callback = _3_})
  local function _4_()
    return vim.cmd("silent! %s/\\s\\+$//e")
  end
  vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*", callback = _4_})
  local function _5_()
    return vim.keymap.set("n", "q", ":close<CR>", {buffer = true, silent = true})
  end
  vim.api.nvim_create_autocmd("FileType", {pattern = {"qf", "help", "man", "lspinfo"}, callback = _5_})
  vim.o.showmode = false
  vim.g.netrw_banner = 0
  vim.g.netrw_liststyle = 3
  vim.g.netrw_winsize = 25
  return nil
end
return setup_qol()
