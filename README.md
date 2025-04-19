# 🖤 Neovim Config

> Custom Neovim setup keren & produktif, dengan tampilan dashboard archbtw dan fitur modern ala VSCode — cocok buat coding harian full power!

---

## ✨ Fitur Utama

- 🏠 **Dashboard keren** dengan logo archbtw
- 🚀 **Lazy.nvim** untuk plugin management super cepat
- 🔍 **Telescope** buat fuzzy search, recent files, dan workspace/project list
- 🌈 **Treesitter** untuk syntax highlighting mantap
- 💡 **LSP ready** (typescript, python, lua, dll)
- 🎨 **Prettier, Black, Stylua** auto-format saat save
- 🔮 **Discord Rich Presence**
- 🌐 **Workspace/project detection** seperti VSCode
- 🔧 **Snippet + Autocomplete**
- 🌈 **Rainbow parentheses, indent guide, smooth scroll**
- ✅ **Comment toggle, autopairs, colorizer**
- 🧠 **TODO comment highlighting**
- 📁 File explorer dan Git signs

---

## 🧱 Struktur Folder

```
~/.config/nvim/
├── init.lua
└── lua/
    ├── core/
    │   ├── plugins.lua
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── lsp.lua
```

---

## 🚀 Cara Install

1. **Clone config-nya**:

```bash
git clone https://github.com/kamu/nvim-config.git ~/.config/nvim
```

> Atau unzip langsung ke `~/.config/nvim`

2. **Buka Neovim**:

```bash
nvim
```

3. **Install plugin pertama kali**:

```vim
:Lazy sync
```

4. **Install Prettier / Black / dll**:

```bash
npm install -g prettier
pip install black
```

---

## 📚 Shortcut Penting

| Fungsi                  | Keybinding            |
|-------------------------|-----------------------|
| 🔍 Cari file            | `<leader>ff`          |
| 🔁 Recent files         | `<leader>fr`          |
| 📁 Project/workspace    | `<leader>p`           |
| 🧠 Comment line/block   | `gc` (dalam mode normal atau visual) |
| 💾 Format otomatis      | Auto saat `:w`        |
| 🛑 Keluar Neovim        | `:qa` atau `ZZ`       |

---

## ⚠️ Tips & Perbaikan

- **Masalah warning `vim.tbl_add_reverse_lookup`**  
  → Update semua plugin via `:Lazy update`
  
- **LSP tsserver warning**  
  → Gunakan `tsserver` bukan `tsserver_plugins` (sementara)

---

## 🧠 Rekomendasi Struktur Workspace

```
~/workspace/
├── web-app/          # Deteksi via package.json
├── python-app/       # Deteksi via pyproject.toml
├── lua-stuff/        # Deteksi via init.lua
```

---

## ❤️ Credits

- Neovim
- Lazy.nvim
- Telescope, Treesitter, LSPConfig
- Arch Linux community 🐧

---

> Enjoy your setup! Kalau ada ide tambahan, tinggal gas di `plugins.lua` dan `lsp.lua`.
