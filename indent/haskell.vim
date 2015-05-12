if exists('b:did_indent')
  finish
endif


setlocal autoindent
setlocal indentexpr=GetHaskellIndent()
setlocal indentkeys=!^F,o,O

setlocal expandtab
setlocal tabstop<
setlocal softtabstop=4
setlocal shiftwidth=4

let b:undo_indent = 'setlocal '.join([
\   'autoindent<',
\   'expandtab<',
\   'indentexpr<',
\   'indentkeys<',
\   'shiftwidth<',
\   'softtabstop<',
\   'tabstop<',
\ ])


" Haskellではインデントが上がることで、構造の終わりを表現するので、
" 構造からインデントを上げるタイミングを判定することはできない。
" よって、インデントを下げる場合のみに着目すればよい。
" case
" data
" of$
" =$
" ->$
function! GetHaskellIndent()
  let plnum = prevnonblank(v:lnum - 1)
  if (col('.') - 1) == matchend(getline('.'), '\v^\s*(-|--) ?$')
    " by autoindent (コメントの後続行)
    return -1
  elseif (col('.') - 1) == matchend(getline('.'), '\v^\s*')
    " by autoindent
    if getline(plnum) =~# '\v^\s*<where>\s*$'
      " 先行する行が where のみからなる場合
      return indent(plnum) + &l:shiftwidth / 2
    elseif getline(plnum) =~# '\v(<of>|\=|-\>|<do>|<where>)\s*$'
      " 先行する行が特定のキーワードで終了している場合
      return indent(plnum) + &l:shiftwidth
    elseif getline(plnum) =~# '\v^\s*(<class>|<instance>)'
      " 先行する行が特定のキーワードで開始している場合
      return indent(plnum) + &l:shiftwidth
    elseif getline(plnum) =~# '\v^\s*(<do>|<where>)'
      " 先行する行が特定のキーワードで開始し、後続する内容を持つ場合
      return matchend(getline(plnum), '\v^\s*(<do>|<where>)\s*')
    else
      return -1
    endif
  else
    " by indentkeys
    return indent(plnum) + &l:shiftwidth
  endif
endfunction


let b:did_indent = 1
