local keymap = vim.keymap
local global = vim.g

global.mapleader = " "

local bufopts = { noremap=true, silent=true }

local function toggle_unit_test ()
  local current_file_path = vim.fn.expand("%:p");


  if (string.find(current_file_path, ".spec.js")) then
    local current_file_path_without_ext = vim.fn.expand("%:p:r:r");
    local vue = current_file_path_without_ext..".vue"
    local js = current_file_path_without_ext..".js"
    local is_vue_file_exists = io.open(vue, "r")
    local is_js_file_exists = io.open(js, "r")

    if (is_vue_file_exists) then
      return vim.cmd("e "..vue)
    end
    if (is_js_file_exists) then
      return vim.cmd("e "..js)
    end
  end

  if (string.find(current_file_path, ".vue")) then
    local current_file_path_without_ext = vim.fn.expand("%:p:r");
    local spec = current_file_path_without_ext..".spec.js"
    local is_spec_file_exists = io.open(spec, "r")

    if (is_spec_file_exists) then
      return vim.cmd("e "..spec)
    else
      return print("No test found")
    end
  end

  if (string.find(current_file_path, ".js")) then
    local current_file_path_without_ext = vim.fn.expand("%:p:r");
    local spec = current_file_path_without_ext..".spec.js"
    local is_spec_file_exists = io.open(spec, "r")

    if (is_spec_file_exists) then
      return vim.cmd("e "..spec)
    else
      return print("No test found")
    end
  end
end

keymap.set('n', '<Leader>tt', '<cmd>NvimTreeToggle<CR>', bufopts)
keymap.set('n', '<Leader>tf', '<cmd>NvimTreeFindFile<CR>', bufopts)
keymap.set('n', '<Leader>ef', '<cmd>ALEFix eslint<CR>', bufopts)
keymap.set('n', '<Leader><CR>', '<cmd>so ~/.config/nvim/init.lua<CR>', bufopts)
keymap.set('n', '<Leader>u', toggle_unit_test, bufopts)
