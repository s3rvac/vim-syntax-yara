" Vim syntax file for YARA rules.
"
" Language:     YARA
" Maintainer:   Petr Zemek <s3rvac@gmail.com>
" Home Page:    https://github.com/s3rvac/vim-syntax-yara
" Last Change:  2020-05-08 11:44:44 +0200
"
" The MIT License (MIT)
"
" Copyright (c) 2017 Petr Zemek <s3rvac@gmail.com> and contributors.
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Quit if the syntax file has already been loaded.
if exists("b:current_syntax")
	finish
endif

syntax case match

" Keywords
syntax keyword yaraKeyword all and any ascii at base64 base64wide condition entrypoint false filesize for fullword global import in include int16 int16be int32 int32be int8 int8be matches meta nocase not of or private rule strings them true uint16 uint16be uint32 uint32be uint8 uint8be wide xor
" Keywords that are identical to a Vim option have to be defined via match, see
" https://vimhelp.org/syntax.txt.html#E789.
syntax match yaraKeyword /\<contains\>/
syntax keyword yaraRuleSection condition meta strings

" Identifiers
syntax match yaraIdentifier /$[a-zA-Z0-9_]*/
syntax match yaraIdentifierOccurrence /#[a-zA-Z0-9_]*/
syntax match yaraIdentifierOffset /@[a-zA-Z0-9_]*\(\[[^\]]\+\]\)\?/
syntax match yaraIdentifierMatchLength /![a-zA-Z0-9_]*\(\[[^\]]\+\]\)\?/

" Strings
syntax region yaraStringText start=/"/ end=/"/ skip=/\(\\\\\|\\"\)/ contains=yaraStringTextFormat
syntax match yaraStringTextFormat /\(\\"\|\\\\\|\\t\|\\n\|\\x[0-9a-fA-F]\{2\}\)/ contained
syntax match yaraStringHex /{\([-0-9a-fA-F \t()\[\]|?]\|\n\)\+[-0-9a-fA-F()\[\]|?]\([-0-9a-fA-F \t()\[\]|?]\|\n\)\+}/ contains=yaraStringHexFormat
syntax match yaraStringHexFormat /[-()\[\]|?]/ contained
syntax region yaraStringRegex start=/\// end=/\// skip=/\(\\\\\|\\\/\)/
syntax match yaraStringRegexModifiers /\/\@<=[is]\+\>/

" Numbers
syntax match yaraNumberInt /\<\([0-9]\+\|0x[0-9a-fA-F]\+\)\>/
syntax match yaraNumberFloat /\<[0-9]\+\.[0-9]\+\>/
syntax match yaraNumberSize /\<\([0-9]\+\|0x[0-9a-fA-F]\+\)\(MB\|KB\)\>/

" Comments
syntax match yaraCommentInline /\/\/.*/
syntax region yaraCommentBlock start=/\/\*/ end=/\*\//

highlight default link yaraKeyword Keyword
highlight default link yaraRuleSection PreProc
highlight default link yaraIdentifier Identifier
highlight default link yaraIdentifierOccurrence Identifier
highlight default link yaraIdentifierOffset Identifier
highlight default link yaraIdentifierMatchLength Identifier
highlight default link yaraStringText String
highlight default link yaraStringTextFormat Special
highlight default link yaraStringHex String
highlight default link yaraStringHexFormat Special
highlight default link yaraStringRegex String
highlight default link yaraStringRegexModifiers Special
highlight default link yaraNumberInt Number
highlight default link yaraNumberFloat Number
highlight default link yaraNumberSize Number
highlight default link yaraCommentInline Comment
highlight default link yaraCommentBlock Comment

" Make sure that the syntax file is loaded at most once.
let b:current_syntax = "yara"
