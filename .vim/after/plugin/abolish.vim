" My abolish Configuration

" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

" I always spell definitely wrong.
Abolish defi{nate,ant,nita}{ly} definite{ly}

" Fix the word foreign
Abolish foregin{er,} foreign{}

" Change and Changed
Abolish ca{h,}ng{ed,e,es,ing} c{h}ang{}

