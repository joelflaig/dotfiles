local symbols = {
  Array = '󰅪 ',
  Boolean = ' ',
  BreakStatement = '󰙧 ',
  Call = '󰃷 ',
  CaseStatement = '󱃙 ',
  Class = ' ',
  Color = '󰏘 ',
  Constant = ' ',
  Constructor = ' ',
  ContinueStatement = '→ ',
  Copilot = ' ',
  Declaration = '󰙠 ',
  Delete = '󰩺 ',
  DoStatement = ' ',
  Enum = ' ',
  EnumMember = '󰎦 ',
  Event = '⚡',
  Field = '󰜢 ',
  File = '󰈮 ',
  Folder = '󰉋 ',
  ForStatement = ' ',
  Function = '󰊕 ',
  H1Marker = '󰉫 ', -- Used by markdown treesitter parser
  H2Marker = '󰉬 ',
  H3Marker = '󰉭 ',
  H4Marker = '󰉮 ',
  H5Marker = '󰉯 ',
  H6Marker = '󰉰 ',
  Identifier = ' ',
  IfStatement = '󰇉 ',
  Interface = ' ',
  Keyword = '󰌋 ',
  List = '󰅪 ',
  Log = '󰦪 ',
  Lsp = ' ',
  Macro = '󰁌 ',
  MarkdownH1 = '󰉫 ', -- Used by builtin markdown source
  MarkdownH2 = '󰉬 ',
  MarkdownH3 = '󰉭 ',
  MarkdownH4 = '󰉮 ',
  MarkdownH5 = '󰉯 ',
  MarkdownH6 = '󰉰 ',
  Method = '󰆧 ',
  Module = '󰏗 ',
  Namespace = '󰅩 ',
  Null = '󰢤 ',
  Number = ' ',
  Object = ' ',
  Operator = ' ',
  Package = '󰆦 ',
  Pair = '󰅪 ',
  Property = '󰜢 ',
  Reference = '󰦾 ',
  Regex = ' ',
  Repeat = ' ',
  Scope = '󰅩 ',
  Snippet = ' ',
  Specifier = '󰦪 ',
  Statement = '󰌋 ',
  String = '󰉾 ',
  Struct = ' ',
  SwitchStatement = '󰺟 ',
  Terminal = '',
  Text = '󰉿 ',
  Type = ' ',
  TypeParameter = '󰆩 ',
  Unit = ' ',
  Value = '󰎠 ',
  Variable = ' ',
  WhileStatement = ' ',
}

return {
  'Bekaboo/dropbar.nvim',
  event = "BufRead",
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },

  config = function ()

    local opts = {
      bar = {
        padding = {
          left = 1,
          right = 1,
        },
        sources = function(b, _)
          local sources = require('dropbar.sources')
          -- local utils = require('dropbar.utils')

          local source = {
            get_symbols = function (buf, win, cursor)
              local lsp = sources.lsp.get_symbols(buf, win, cursor)
              local ts = sources.treesitter.get_symbols(buf, win, cursor)

              local path = sources.path.get_symbols(buf, win, cursor)
              local file = path[#path]

              local syms = {
                file,
              }

              for idx,sym in ipairs(ts) do
                if sym.icon == symbols.IfStatement  then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.SwitchStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.CaseStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.ForStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.WhileStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.DoStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.ContinueStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.BreakStatement then
                  table.insert(syms, sym)
                elseif sym.icon == symbols.Repeat then
                  table.insert(syms, sym)
                -- elseif sym.icon == symbols.Declaration then
                --   table.insert(syms, sym)
                -- elseif sym.icon == symbols.Delete then
                --   table.insert(syms, sym)
                -- elseif sym.icon == symbols.Statement then -- always check as last 
                --   table.insert(syms, sym)
                else
                  if idx > #lsp then
                  goto continue
                  end

                  if (lsp[idx].icon == symbols.Package) and (
                    (lsp[idx].name == "if") or
                    (lsp[idx].name == "else") or
                    (lsp[idx].name == "elseif") or
                    (lsp[idx].name == "elif") or
                    (lsp[idx].name == "for") or
                    (lsp[idx].name == "while") or
                    (lsp[idx].name == "do") or
                    (lsp[idx].name == "switch") or
                    (lsp[idx].name == "match") or
                    (lsp[idx].name == "case") or
                    (lsp[idx].name == "break") or
                    (lsp[idx].name == "continue") or
                    (lsp[idx].name == "goto") or
                    (lsp[idx].name == "try") or
                    (lsp[idx].name == "except") or
                    (lsp[idx].name == "catch") -- or
                  ) then
                    table.remove(lsp, idx)
                    goto continue
                  end

                  table.insert(syms, lsp[idx])

                  if ts[idx + 1] == symbols.Field then
                    table.remove(ts, idx + 1)
                    table.insert(syms, lsp[idx])
                  elseif ts[idx + 1] == symbols.Property then
                    table.remove(ts, idx + 1)
                    table.insert(syms, lsp[idx])
                  end
                end
                  ::continue::
              end

              -- if #lsp > #syms then
              --   for i=(#lsp-#syms),#lsp do
              --     table.insert(syms, lsp[i])
              --   end
              -- end

              return syms
            end
          }
          if vim.bo[b].ft == 'markdown' then
            return {
              -- sources.path,
              sources.markdown,
            }
          end
          if vim.bo[b].buftype == 'terminal' then
            return {
              sources.terminal,
            }
          end
          return {
            source
          }
        end,
      },

      icons = {
        kinds = {
          symbols = symbols
        },
      },
    }

    require("dropbar").setup(opts)

    -- highlights

    -- branching statement highlights
    vim.cmd("hi! default link DropBarKindIfStatement CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindSwitchStatement CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindCaseStatement CmpItemKindKeyword")

    -----

    -- loop statement highlights
    vim.cmd("hi! default link DropBarKindBreakStatement CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindDoStatement CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindForStatement CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindRepeat CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindWhileStatement CmpItemKindKeyword")

    -----

    -- statement highlights
    vim.cmd("hi! default link DropBarKindDeclaration CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindDelete CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindKeyword CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindOperator Operator")
    vim.cmd("hi! default link DropBarKindStatement CmpItemKindKeyword")

    -----

    -- enum highlights
    vim.cmd("hi! default link DropBarKindEnum CmpItemKindEnum")
    vim.cmd("hi! default link DropBarKindEnumMember CmpItemKindEnumMember")

    -----

    -- type highlights
    vim.cmd("hi! default link DropBarKindArray CmpItemKindArray")
    vim.cmd("hi! default link DropBarKindBoolean @lsp.type.boolean")
    vim.cmd("hi! default link DropBarKindClass CmpItemKindClass")
    vim.cmd("hi! default link DropBarKindInterface CmpItemKindInterface")
    vim.cmd("hi! default link DropBarKindList CmpItemKindArray")
    vim.cmd("hi! default link DropBarKindNumber Number")
    vim.cmd("hi! default link DropBarKindObject luaTable")
    vim.cmd("hi! default link DropBarKindPair CmpItemKindArray")
    vim.cmd("hi! default link DropBarKindString String")
    vim.cmd("hi! default link DropBarKindStruct CmpItemKindStruct")
    vim.cmd("hi! default link DropBarKindType Type")

    -----

    -- value highlights
    vim.cmd("hi! default link DropBarKindColor CmpItemKindColor")
    vim.cmd("hi! default link DropBarKindEvent CmpItemKindEvent")
    vim.cmd("hi! default link DropBarKindNull CmpItemKindKeyword")
    vim.cmd("hi! default link DropBarKindRegex @lsp.type.regexp")
    vim.cmd("hi! default link DropBarKindText CmpItemKindText")
    vim.cmd("hi! default link DropBarKindUnit CmpItemKindUnit")

    -----

    -- file highlights
    vim.cmd("hi! default link DropBarKindFile CmpItemKindFile")
    vim.cmd("hi! default link DropBarKindFolder CmpItemKindFolder")

    -----

    -- markdown highlights
    vim.cmd("hi! default link DropBarKindMarkdownH1 markdownH1")
    vim.cmd("hi! default link DropBarKindMarkdownH2 markdownH2")
    vim.cmd("hi! default link DropBarKindMarkdownH3 markdownH3")
    vim.cmd("hi! default link DropBarKindMarkdownH4 markdownH4")
    vim.cmd("hi! default link DropBarKindMarkdownH5 markdownH5")
    vim.cmd("hi! default link DropBarKindMarkdownH6 markdownH6")

    -----

    -- function highlights
    vim.cmd("hi! default link DropBarKindConstructor CmpItemKindConstructor")
    vim.cmd("hi! default link DropBarKindFunction CmpItemKindFunction")
    vim.cmd("hi! default link DropBarKindMethod CmpItemKindMethod")

    -----

    -- variable/reference highlights
    vim.cmd("hi! default link DropBarKindCall CmpItemKindReference")
    vim.cmd("hi! default link DropBarKindConstant CmpItemKindConstant")
    vim.cmd("hi! default link DropBarKindField CmpItemKindField")
    vim.cmd("hi! default link DropBarKindIdentifier CmpItemKindVariable")
    vim.cmd("hi! default link DropBarKindProperty CmpItemKindProperty")
    vim.cmd("hi! default link DropBarKindReference CmpItemKindReference")
    vim.cmd("hi! default link DropBarKindTypeParameter CmpItemKindTypeParameter")
    vim.cmd("hi! default link DropBarKindVariable CmpItemKindVariable")

    -----

    -- namespace highlights
    vim.cmd("hi! default link DropBarKindModule CmpItemKindModule")
    vim.cmd("hi! default link DropBarKindNamespace @lsp.type.namespace")
    vim.cmd("hi! default link DropBarKindPackage CmpItemKindModule")
    vim.cmd("hi! default link DropBarKindScope @lsp.type.namespace")

    -----

    -- vim
    vim.cmd("hi! default link DropBarKindCopilot CmpItemKindCopilot")
    vim.cmd("hi! default link DropBarKindMacro Macro")
    vim.cmd("hi! default link DropBarKindSnippet CmpItemKindSnippet")
    vim.cmd("hi! default link DropBarKindSpecifier @lsp.type.formatSpecifier")

  end

}

