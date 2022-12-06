# myNvimConfig

This is my Neo Vim config file.

# Required software

1. Node.js (version >= 14.14) -- Required by coc.nvim
2. fzf                        -- A great file finder for terminal
3. the_silver_searcher        -- Booster for fzf it can search the context in the file 

# Usage
I maped the leader key as space 
## Normal mode
| key            | maped command                          | desc                 |
|----------------|----------------------------------------|----------------------|
| Shift + q      | :q\<CR>                                | quite the file       |
| Ctrl + s       | :w\<CR>                                | save the file        |
| Shift + j      | 5j                                     | move 5 lines down    |
| Shift + k      | 5k                                     | move 5 lines up      |
| leader + e     | :Lex 30<cr>                            | open project tree    |
| leader + s + j | :set splitbelow<CR>:split<CR>          | split window below   |
| leader + s + k | :set nosplitbelow<CR>:split<CR>        | split window top     |
| leader + s + h | :set nosplitright<CR>:vsplit<CR>       | split window left    |
| leader + s + l | :set splitright<CR>:vsplit<CR>         | split window right   |
| gcc            | It's a Comment.nvim plugin key mapping | Comment current line |
