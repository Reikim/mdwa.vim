"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mdwa.vim
"
" Implements The Most Dangerous Writing App (http://www.themostdangerouswritingapp.com/) as a Vim
" plugin.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:MDWA_loaded')
	let g:MDWA_loaded=1

	"Called when session ends; defined as whenever the user stops typing for more than 5 seconds.
	function! EndMDWA()
		let b:end_time=localtime()
		let b:run_time=b:end_time - b:start_time

		if b:run_time < b:goal_time
			"User failed. Clear the buffer and write out the file.
			set undoreload=0
			normal! ggVGd
			write
			edit
			let mess='You failed'
			put =mess
			let mess='Time elapsed in seconds:'
			put =mess
			put =b:run_time
		else
			"Success!
			echoerr 'Congratulations! You achieved your goal.'
		endif
		
		"Un-set-up MDWA
		"Remove autocmds, and whatever else
		augroup MDWA
			autocmd!
		augroup END
	endfunc

	"Start MDWA. Arg is length of session in minutes.
	function! StartMDWA(length)
		"Set up MDWA
		"Add appropriate autocmds, whatever
		
		"argcheck
		if type(a:length) != type(0)
			echo 'MDWA.vim: Time must be specified as an integer number of minutes'
			return
		endif

		echoerr 'The game''s afoot! Keep writing for as long as you can!'

		"setup
		let &updatetime=5000
		let b:goal_time=a:length*60
		let b:start_time=localtime()
		augroup MDWA
			autocmd!
			autocmd CursorHoldI,CursorHold * call EndMDWA()
		augroup END
	endfunc
	command! -nargs=1 MDWASTART call StartMDWA(<args>)

endif
