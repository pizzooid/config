fu! UpdateCscope()
	silent execute "!cscope -b -R"
	silent cscope reset
endfu
au BufWritePost *.c call UpdateCscope()
au BufWritePost *.cpp call UpdateCscope()
