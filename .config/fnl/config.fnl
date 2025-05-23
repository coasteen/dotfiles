(fn setup-qol []
  (set vim.o.swapfile false)
  (set vim.o.backup false)
  (set vim.o.undofile true)

  (set vim.o.updatetime 200)
  (set vim.o.timeoutlen 300)

  (set vim.wo.number true)
  (set vim.wo.relativenumber true)

  (set vim.o.clipboard "unnamedplus")

  (set vim.o.splitright true)
  (set vim.o.splitbelow true)

  (set vim.o.tabstop 4)
  (set vim.o.shiftwidth 4)
  (set vim.o.expandtab true)
  (set vim.o.smartindent true)

  (set vim.o.autochdir true)

  (vim.api.nvim_create_autocmd
    :BufReadPost
    {:callback
     #(let [line (vim.fn.line "'\"")
            last (vim.fn.line "$")]
        (when (and (> line 1) (< line last))
          (vim.api.nvim_win_set_cursor 0 [line 0])))})

  (vim.api.nvim_create_autocmd
    :TextYankPost
    {:pattern "*"
     :callback
     #(vim.highlight.on_yank {:higroup "IncSearch" :timeout 200})})

  (vim.api.nvim_create_autocmd
    :BufWritePre
    {:pattern "*"
     :callback #(vim.cmd "silent! %s/\\s\\+$//e")})

  (vim.api.nvim_create_autocmd
    :FileType
    {:pattern ["qf" "help" "man" "lspinfo"]
     :callback #(vim.keymap.set "n" "q" ":close<CR>" {:buffer true :silent true})})

  (set vim.o.showmode false)

  (set vim.g.netrw_banner 0)
  (set vim.g.netrw_liststyle 3)
  (set vim.g.netrw_winsize 25))

(setup-qol)
