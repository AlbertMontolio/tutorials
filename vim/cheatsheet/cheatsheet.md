# MOVING AROUND

# Moving within a line
w -> move forward one (w)ord
b -> move (b)ackward one word
e -> move forward to the (e)nd of a word
// capital letter -> inverse

# Jumping within a line
f<char> -> (f)ind a character forward in a line and move to it.
t<char> -> find a character forward in a line and move un(z)il it (one character before)
; -> repeat last f, t, F, T command
, -> repeat last f, t, F, T command, but in opposite direction.

# Moving between lines
H, M, L -> move (H)igh, (M)iddle, or (L)ow within the viewport
/<something> -> search something
n -> repeat last search
N -> repeast las search in opposite direction

CTRL + u -> move down half screens (25 lines)
CTRL + d -> move up

<line_number>G -> (G)o to line number (useful if you have a failing test on a given line)

# COMMANDS

d -> Delete
c -> Change
y -> Yank (copy)
v -> Visually select
>, < -> indent, dedent
= -> reformat (reindent, break long lines, etc.)

dd -> delete whole line
yy -> select whole line

# Commands using Motions
dw -> delete to the next word
dt, -> delete up until the next comma on the current line de -> delete to the end of the current word
d2e -> delete to the end of next word
dj -> delete down a line (current and one below)
dt) delete up until next closing parenthesis
d/world -> delete up until the first search match for "world"

# Text Objects
diw -> delete the "inner word", when u are in the middle of a word

iw, aw -> "inner word", "a word" (a word includes the space)
ip, ap -> "inner paragraph", "a paragraph" ("a" includes the newline)
i) -> "inner parenthesis"
i' -> "inner single quote"
i" -> "inner double quote"
it -> "inner tag"

. -> repeats last "change" command

# WINDOWS & TABS
- a buffer is the in-memory text of a file
- a window is a viewport on a buffer
- a tab page is a collection of windows.

# Windows
:new [filename] -> Open a new window above the current window
:vnew [filename] -> Open a new window beside the current window
:split <filename> -> Edit the specified file in new window above the current window.
:vsplit <filename> -> Edit the specified file in new window beside the current window

# Moving between Windows
<Ctrl-w>hjkl -> Navigate to the window in the given direction
<C-w>HJKL -> Move the current window in the given direction
[count]<C-w>- -> Decrease the height of the current window by count
[count]<C-w>+ -> Increase the height of the current window by count
[count]<C-w>< -> Decrease the width of the current window by count
[count]<C-w>> -> Increase the width of the current window by count
<C-w>= -> Equalize the width and height of all windows

# Positioning the buffer in the window
zz -> center the current within the window
zt -> bring the current line to the top of the window
zb -> bring the current line to the bottom of the window

# TABS
collection of windows in Vim.

:tabnew -> open a new tab
:tabedit <filename> -> edit the file with the provided name in a new tab
gt -> go to next tab
gT -> go to previous tab
<C-w>T -> break the current window out to a new tab

# VISUAL BLOCK MODE
<C-v>hjkl -> moves with a block

d, or x -> delete the visual block selection
c -> change
r -> replace all characters in the block with the next character you type
I -> Insert text before the block
A -> Insert text after the block

# CONFIGURATION

.vimrc -> vim run command
- configuration file that vim reads at the start
- it needs to be located in home directory

ls -l .vimrc
you can make this file point to another file

i.e. ~/code/dotfiles/vim/vimrc

we use smylinks to put this file in the home

In my case, I already had the pointer:

lrwxr-xr-x    1 albert  staff      48 Aug 21 11:31 .vimrc -> /Users/albert/code/AlbertMontolio/dotfiles/vimrc

ln -s

stands for link symbolik

ln -s code/dotfiles/vim/vimrc/

# Search word globally

in vim:
Ggrep demeble -> mostra el nom dels fitxers
:cn -> you move to the next file
this is good cuz u have all ur configurations in one github repo

A la terminal:
git grep demeble
ag demeble (silver search)





inside Vim
:e $MYVIMRC

# PLUGINS
vim.org
vim-scripts github
Plugin 'vim-scripts/foo.vim'

Ctrl+p plugin fuzzy finder
ctrl+g move up

surrender vim

repeat.vim

rails.vim

vim-rspec

instead of nerdtree -> build in :e .
you don't open a file, but a directory
enter to move in a directory
move up a directory -













