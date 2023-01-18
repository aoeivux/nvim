-- local status, leap=pcall(require, "leap")
-- if status then return end
-- leap.add_default_mappings()

require('leap').add_default_mappings()

-- Disable auto jump first match

-- require('leap').opts.safe_labels = {}

require('leap').opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({ 'x', 'o', 'n' }, 'r', '<Plug>(leap-forward-to)')

vim.keymap.set({ 'x', 'o', 'n' }, 'R', '<Plug>(leap-backward-to)')
