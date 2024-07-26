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
          left = 2,
          right = 1,
        },
        sources = function(buf, _)
          local sources = require('dropbar.sources')
          -- local utils = require('dropbar.utils')
          if vim.bo[buf].ft == 'markdown' then
            return {
              -- sources.path,
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == 'terminal' then
            return {
              sources.terminal,
            }
          end
          return {
            -- sources.path,
            -- utils.source.fallback{
              -- sources.lsp,
              sources.treesitter,
            -- }
          }
        end,
      },

      icons = {
        kinds = {
          symbols = {
            Array = '󰅪 ',
            Boolean = ' ',
            BreakStatement = '󰙧 ',
            Call = '󰃷 ',
            CaseStatement = '󱃙 ',
            Class = ' ',
            Color = '󰏘 ',
            Constant = '󰏿 ',
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
            Number = '󰎠 ',
            Object = '󰅩 ',
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
            Statement = '󰅩 ',
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

