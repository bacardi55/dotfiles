XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPTvar $TRUE          1
XPTvar $FALSE         0
XPTvar $NULL          NULL
XPTvar $UNDEFINED     NULL

XPTvar $VOID_LINE  /* void */;
XPTvar $CURSOR_PH      cursor

XPTvar $BRif          ' '
XPTvar $BRel          \n
XPTvar $BRloop        ' '
XPTvar $BRstc         ' '
XPTvar $BRfun         ' '

XPTinclude
    \ _common/common
    \ c/c


" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPTemplateDef


XPT lex hint=Basic\ lex\ file
%{
/* includes */
%}
/* options */
%%
/* rules */
%%
/* C code */


XPT ruleList hint=..\ \ {..}\ ...
`reg^           { `return^ }`...^
`reg^           { `return^ }`...^



" ================================= Wrapper ===================================

XPT rule_ hint=SEL\ \ {\ ...\ }
`wrapped^       { `cursor^ }

