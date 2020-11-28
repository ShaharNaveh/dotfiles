if &rtp =~ 'neomake'
	" Full config: when writing or reading a buffer, and on changes in insert and
	" normal mode (after 500ms; no delay when writing).
    call neomake#configure#automake('nrwi', 500)
    call neomake#configure('automake.cancelation_delay', [0.2, 0.5, 3000])
    let g:neomake_python_enabled_makers = ['flake8']
    let g:neomake_open_list = 2
endif
