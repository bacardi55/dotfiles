XPTemplate priority=personal

let s:f = g:XPTfuncs()

XPTvar $me            'Raphael khaiat'

XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     null

XPTvar $VOID_LINE      /* void */;
XPTvar $CURSOR_PH      /* cursor */

XPTvar $BRif          ' '
XPTvar $BRel          \n
XPTvar $BRloop        ' '
XPTvar $BRstc         ' '
XPTvar $BRfun         ' '

XPTinclude
      \ _common/common

XPTvar $CL    /*
XPTvar $CM    *
XPTvar $CR    */
XPTinclude
      \ _comment/doubleSign

XPTvar $VAR_PRE   $
XPTvar $FOR_SCOPE
XPTinclude
      \ _loops/for

XPTinclude
      \ _condition/c.like
      \ _loops/c.while.like

XPTembed
      \ html/html
      \ html/php*



if exists( 'php_noShortTags' )
    XPTvar $PHP_TAG php
else
    XPTvar $PHP_TAG
endif

" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPTemplateDef

XPT html hint=<?$PHP_TAG\ ...\ ?>
?>`html^<?`$PHP_TAG^

XPT ifelse hint=if\ (..)\ {..}
if($`var^)
{
    `cursor^
}
else if($`var^)
{
}
else
{
}

XPT for hint=for\ (..;..;..)\ {..}
for($i = 0; $i < $`var^; $i++)
{
    `cursor^
}

XPT doc hint=/**\ *\ @author\ ...\ */
/**
 * `description^
 * @author `$me^ `date()^
 * @param $`var^
 * @return $`var^
 */

XPT foreach hint=foreach\ (..\ as\ ..)\ {..}
foreach($`var^ as `container^)`$BRloop^
{
    `cursor^
}

XPT while hint="while\ (..)\ {..}"
while(`container^)
{
    `cursor^
}

XPT cfun hint="/**\ description\ .."
/**
 * `description^
 * @author `$me^ `date()^
 * @param `var1^
 * @return `var2^
 */

XPT fun hint=function\ ..(\ ..\ )\ {..}
XSET params=Void()
XSET params|post=EchoIfEq('  ', '')
/**
 * `description^
 * @author `$me^ `date()^
 * @param `var1^
 * @return `var2^
 */
public function `funName^(``params`^)`$BRfun^
{
    `cursor^
}

XPT class hint=class\ ..\ {\ ..\ }
/**
 * `description^
 * @author `$me^ `date()^
 */
class `className^`$BRfun^
{
    /**
     * Constructor
     * @author `$me^ `date()^
     * @param $`var^
     */
    function __construct( `args^ )`$BRfun^
    {
        `cursor^
    }
}


XPT interface hint=interface\ ..\ {\ ..\ }
/**
 * `description^
 * @author `$me^ `date()^
 */
interface `interfaceName^`$BRfun^
{
    `cursor^
}


" ================================= Wrapper ===================================
