return {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp     = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    -- local check_backspace = function()
    --   local col = vim.fn.col "." - 1
    --   return col == 0 or vim.fn.getline('.'):sub(col, col):match "%s"
    -- end

    cmp.setup({
      -- Load snippet support
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip'  },
        { name = 'path'     },
        { name = 'buffer'   },
      },

      -- Completion settings
      completion = {
        completeopt = 'menu,menuone,noselect',
        keyword_length = 2,
      },

      -- Key mapping
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },

        -- Tab mapping
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          max_width = 60,
          before = function(entry, vim_item)
            vim_item.menu = "["..string.upper(entry.source.name).."]"
            return vim_item
          end
        })
      }
    })

    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      sources = {
        { name = 'cmdline' }
      }
    })
  end,
}
