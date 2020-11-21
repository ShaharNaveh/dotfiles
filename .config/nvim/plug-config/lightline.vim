let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1

let g:lightline = {
\  'colorscheme': 'jellybeans',
\  'active': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'inactive': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'subseparator': {
\    'left': '', 'right': ''
\  },
\  'tabline': {
\    'left': [ ['buffers'] ],
\    'right': [ [] ]
\  },
\  'tabline_separator': {
\    'left': "", 'right': ""
\  },
\  'tabline_subseparator': {
\    'left': "", 'right': ""
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_raw': {
\    'buffers': 1
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}
