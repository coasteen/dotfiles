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
     :callback #(vim.highlight.on_yank {:higroup "IncSearch" :timeout 200})})

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
  (set vim.g.netrw_winsize 25)

  (vim.cmd "colorscheme gruvbox")
)

(fn setup-lsp []
  (local lspconfig (require "lspconfig"))
  (local mason (require "mason"))
  (local mason_lspconfig (require "mason-lspconfig"))
  (local cmp_nvim_lsp (require "cmp_nvim_lsp"))

  (mason.setup {})
  (mason_lspconfig.setup
    {:ensure_installed ["pyright" "lua_ls" "bashls" "tsserver"]
     :automatic_installation true})

  (local on_attach (fn [client bufnr]
    (local opts {:noremap true :silent true :buffer bufnr})

    (vim.keymap.set "n" "gd" (fn [] (vim.lsp.buf.definition)) opts)
    (vim.keymap.set "n" "K" (fn [] (vim.lsp.buf.hover)) opts)
    (vim.keymap.set "n" "gi" (fn [] (vim.lsp.buf.implementation)) opts)
    (vim.keymap.set "n" "<leader>rn" (fn [] (vim.lsp.buf.rename)) opts)
    (vim.keymap.set "n" "<leader>ca" (fn [] (vim.lsp.buf.code_action)) opts)
    (vim.keymap.set "n" "gr" (fn [] (vim.lsp.buf.references)) opts)
    (vim.keymap.set "n" "<leader>f" (fn [] (vim.lsp.buf.format {:async true})) opts)
  ))

  (local capabilities (cmp_nvim_lsp.default_capabilities) ())

  (for _, server in ipairs ["pyright" "bashls" "tsserver"]
    (lspconfig[server].setup
      {:on_attach on_attach
       :capabilities capabilities}))

  (lspconfig.lua_ls.setup
    {:on_attach on_attach
     :capabilities capabilities
     :settings
       {:Lua
         {:diagnostics {:globals ["vim"]}
          :workspace
            {:library (vim.api.nvim_get_runtime_file "" true)
             :checkThirdParty false}
          :telemetry {:enable false}}}}))

(setup-qol)
(setup-lsp)
