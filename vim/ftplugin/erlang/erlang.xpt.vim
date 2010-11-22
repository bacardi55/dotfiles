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


" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPTemplateDef


XPT inc hint=-include\ ..
-include( "`cursor^.hrl").


XPT def hint=-define\ ..
-define( `what^, `def^ ).


XPT ifdef hint=-ifdef\ ..\-endif..
-ifdef( `what^ ).
    `thenmacro^
``else...`
{{^-else.
    `cursor^
`}}^-endif().


XPT ifndef hint=-ifndef\ ..\-endif
-ifndef( `what^ ).
    `thenmacro^
``else...`
{{^-else.
    `cursor^
`}}^-endif().


XPT record hint=-record\ ..,{..}
-record( `recordName^
        ,{ `field1^`...^
        ,  `fieldn^`...^
        }).


XPT if hint=if\ ..\ ->\ ..\ end
if
    `cond^ ->
        `body^` `...^;
    `cond2^ ->
        `bodyn^` `...^
end `cursor^


XPT case hint=case\ ..\ of\ ..\ ->\ ..\ end
case `matched^ of
    `pattern^ ->
        `body^`...^;
    `patternn^ ->
        `bodyn^`...^
end `cursor^


XPT receive hint=receive\ ..\ ->\ ..\ end
receive
    `pattern^ ->
        `body^` `...^;
    `patternn^ ->
        `body^` `...^`
   `after...{{^
    after
    `afterBody^`}}^
end



XPT fun hint=fun\ ..\ ->\ ..\ end
fun (`params^) `_^ -> `body^`
    `more...{{^;
    (`params^) `_^ -> `body^`
    `...{{^;
    (`params^) `_^ -> `body^`
    `...^`}}^`}}^
end `cursor^


XPT try hint=try\ ..\ catch\ ..\ end
try `what^
catch
    `except^ -> `toRet^`
    `...^;
    `except^ -> `toRet^`
    `...^`
`after...{{^
after
    `afterBody^`}}^
end `cursor^


XPT tryof hint=try\ ..\ of\ ..
try `what^ of
    `pattern^ ->
        `body^` `more...^;
    `patternn^ ->
        `body^` `more...^
catch
    `excep^ -> `toRet^` `...^;
    `except^ -> `toRet^` `...^`
`after...{{^
after
    `afterBody^`}}^
end `cursor^


XPT function hint=f\ \(\ ..\ \)\ ->\ ..
`funName^ ( `args0^ ) `_^ ->
    `body0^ `...^;
`name^R('funName')^ ( `argsn^ ) `_^ ->
    `bodyn^`...^
.


" ================================= Wrapper ===================================

XPT try_ hint=try\ SEL\ catch...
try
    `wrapped^
catch
    `excep^ -> `toRet^` `...0^;
    `except^ -> `toRet^` `...0^
`after...{{^after
    `afterBody^`}}^
end


