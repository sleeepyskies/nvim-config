vim.g.load_doxygen_syntax = 1
vim.cmd([[
  hi link doxygenSpecial Special
  hi link doxygenComment SpecialComment
  hi link doxygenParam Identifier
  hi link doxygenBrief Special
]])
