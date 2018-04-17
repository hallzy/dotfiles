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

" calculate/calculating/calculator/calculated/calculates/calculation
" I seem to have a tough time typing this word quickly... A very tough time.
Abolish c{al,la}{cu,uc}{al,a,}to{a,}r calculator
Abolish c{al,la}{cu,uc}{i,ti,lait}ng calculating
Abolish c{al,la}{cu,uc}{al,l,a}te{s,d,} c{al}{cu}{la}te{}
Abolish c{al,la}{cu,uc}{ioat,oati,oiat,iaot,aito,atio,aio}n{t,} calculation
