local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- UI + Startup screen
  { "nvim-tree/nvim-web-devicons" },
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[     ⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣄⡀          ]],
        [[     ⠀⠀⠀⠀⣴⣿⡿⠛⠉⠉⠉⠛⠻⣿⣿⣦⡀      ]],
        [[     ⠀⠀⢀⣿⡟⠁   𝒜𝓇𝒸𝒽𝒷𝓉𝓌   ⠈⢿⣿⡄     ]],
        [[     ⠀⢀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣄   ]],
        [[     ⢀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡄ ]],
        [[     ⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿ ]],
        [[     ⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉ ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  󰈔  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  󰈢  Projects", ":Telescope projects<CR>"),
        dashboard.button("f", "󰱼  󰈞  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  󰈢  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "  󰿅  Quit", ":qa<CR>"),
      }
      
      dashboard.section.footer.val = "  Keep coding, archbtw warrior "

      require("alpha").setup(dashboard.config)
    end,
  },

  -- Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- File explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Project/workspace detection
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "init.lua" },
      })
      require("telescope").load_extension("projects")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "tokyonight" } })
    end,
  },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Linting & Formatting (Prettier, Black, etc.)
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
        },
      })
    end,
  },

  -- Discord Rich Presence
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        neovim_image_text = "nvim + archbtw",
        buttons = true,
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comment toggle
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Snippet collection (optional, luasnip support)
  { "rafamadriz/friendly-snippets" },
-- Indent Guides
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

-- Smooth Scrolling
{ "karb94/neoscroll.nvim", config = function() require('neoscroll').setup() end },

-- Rainbow parentheses 🌈
{ "HiPhish/rainbow-delimiters.nvim" },

-- Highlight TODO / NOTE / FIX
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()
  end,
},

-- Colorizer (lihat warna HEX langsung)
{ "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end },

-- Git status di sidebar
{ "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
-- GitHub Copilot
{ "github/copilot.vim", config = function() vim.g.copilot_no_tab_map = true end },
})
