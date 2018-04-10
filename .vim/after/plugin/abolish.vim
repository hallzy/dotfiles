" My abolish Configuration

" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

" I always spell definitely wrong.
Abolish defi{nate,ant,nita}{ly} defi{nite}{}

" Fix the word foreign
Abolish foregin{er,} foreign{}

" Change and Changed
Abolish ca{h,}ng{ed,e,es,ing} c{h}ang{}

" I often miss the 'u'.
Abolish usefl useful
