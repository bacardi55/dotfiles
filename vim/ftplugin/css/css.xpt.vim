XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPTvar $VOID_LINE  /* void */;
XPTvar $CURSOR_PH      /* cursor */

XPTvar $CL  /*
XPTvar $CM   *
XPTvar $CR   */

XPTinclude
      \ _common/common
      \ _comment/doubleSign


" ========================= Function and Variables =============================

fun! s:f.css_braced_post()
  let v = self.V()
  let v = substitute( v, '^\s*$', '', 'g' )

  if v =~ '^\s*\w\+('
    let name = matchstr( v, '^\s*\zs\w\+(' )
    return self.Build( ' ' . name . self.ItemCreate( '', {}, {} ) . ')' )
  else
    return v
  endif
endfunction

" ================================= Snippets ===================================
XPTemplateDef


XPT padding " padding:
padding: `v^`v^AutoCmpl( 1, 'auto', '0px' )^;

XPT width " width :
width: `^;


XPT height " height :
height: `^;


XPT backrep hint=background-repeat
XSET rep=Choose(['repeat', 'repeat-x','repeat-y','no-repeat'])
background-repeat: `rep^;


XPT azimuth hint=azimuth
XSET azim=Choose(['left-side', 'far-left', 'left', 'center-left', 'center', 'center-right', 'right', 'far-right', 'right-side', 'behind', 'leftwards', 'rightwards'])
azimuth: `azim^;


XPT backpos hint=background-position
XSET horiz=Choose(['left', 'center', 'right'])
XSET horiz|post=SV('^\s*$', '', 'g')
XSET vert=Choose(['top', 'center', 'bottom'])
XSET vert|post=SV('^\s*$', '', 'g')
background-position:` `vert`^` `horiz`^;


XPT border hint=border
XSET pos=ChooseStr( '-top', '-right', '-bottom', '-left' )
XSET thick=Choose(['thin', 'thick', 'medium'])
XSET thick|post=SV('^\s*$', '', 'g')
XSET kind=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
XSET kind|post=SV('^\s*$', '', 'g')
XSET color=Choose(['rgb()', '#', 'transparent'])
XSET color|post=css_braced_post()
border`pos^:` `thick^` `kind^` `color^;


XPT backgroundattachment hint=background-attachment
XSET selec=Choose(['scroll', 'fixed'])
background-attachment: `selec^;


XPT backgroundcolor hint=background-color
XSET selec=Choose(['transparent', 'rgb()', '#'])
XSET selec|post=css_braced_post()
background-color:` `selec^;


XPT backgroundimage hint=background-image
XSET selec=Choose(['url()', 'none'])
XSET selec|post=css_braced_post()
background-image:` `selec^;


XPT backgroundrepeat hint=background-repeat
XSET selec=Choose(['repeat', 'repeat-x','repeat-y','no-repeat'])
background-repeat: `selec^;


XPT background hint=background
XSET selec=Choose(['url()', 'scroll', 'fixed', 'transparent', 'rgb()', '#', 'none', 'top', 'center', 'bottom' , 'left', 'right', 'repeat', 'repeat-x', 'repeat-y', 'no-repeat'])
XSET selec|post=css_braced_post()
background:` `selec^;


XPT bordercollapse hint=border-collapse
XSET selec=Choose(['collapse', 'separate'])
border-collapse: `selec^;


XPT bordercolor hint=border-color
XSET selec=Choose(['rgb()', '#', 'transparent'])
XSET selec|post=css_braced_post()
border-color:` `selec^;


XPT borderspacing hint=border-spacing
XSET select_disabled=Choose([''])
border-spacing: `select^;


XPT borderstyle hint=border-style
XSET selec=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
border-style: `selec^;


XPT borderwidth hint=border-width
XSET selec=Choose(['thin', 'thick', 'medium'])
border-width: `selec^;


XPT bottom hint=bottom
XSET selec=Choose(['auto'])
bottom: `selec^;


XPT captionside hint=caption-side
XSET selec=Choose(['top', 'bottom'])
caption-side: `selec^;


XPT clear hint=clear
XSET selec=Choose(['none', 'left', 'right', 'both'])
clear: `selec^;


XPT clip hint=clip
XSET selec=Choose(['auto', 'rect('])
clip: `selec^;


XPT color hint=color
XSET selec=Choose(['rgb()', '#'])
XSET selec|post=css_braced_post()
color:` `selec^;


XPT content hint=content
XSET selec=Choose(['normal', 'attr(', 'open-quote', 'close-quote', 'no-open-quote', 'no-close-quote'])
content: `selec^;


XPT cursor hint=cursor
XSET selec=Choose(['url()', 'auto', 'crosshair', 'default', 'pointer', 'move', 'e-resize', 'ne-resize', 'nw-resize', 'n-resize', 'se-resize', 'sw-resize', 's-resize', 'w-resize', 'text', 'wait', 'help', 'progress'])
XSET selec|post=css_braced_post()
cursor:` `selec^;


XPT direction hint=direction
XSET selec=Choose(['ltr', 'rtl'])
direction: `selec^;


XPT display hint=display
XSET selec=Choose(['inline', 'block', 'list-item', 'run-in', 'inline-block', 'table', 'inline-table', 'table-row-group', 'table-header-group', 'table-footer-group', 'table-row', 'table-column-group', 'table-column', 'table-cell', 'table-caption', 'none'])
display: `selec^;


XPT elevation hint=elevation
XSET selec=Choose(['below', 'level', 'above', 'higher', 'lower'])
elevation: `selec^;


XPT emptycells hint=empty-cells
XSET selec=Choose(['show', 'hide'])
empty-cells: `selec^;


XPT float hint=float
XSET selec=Choose(['left', 'right', 'none'])
float: `selec^;


XPT fontfamily hint=font-family
XSET selec=Choose(['sans-serif', 'serif', 'monospace', 'cursive', 'fantasy'])
font-family: `selec^;


XPT fontsize hint=font-size
XSET selec=Choose(['xx-small', 'x-small', 'small', 'medium', 'large', 'x-large', 'xx-large', 'larger', 'smaller'])
font-size: `selec^;


XPT fontstyle hint=font-style
XSET selec=Choose(['normal', 'italic', 'oblique'])
font-style: `selec^;


XPT fontvariant hint=font-variant
XSET selec=Choose(['normal', 'small-caps'])
font-variant: `selec^;


XPT fontweight hint=font-weight
XSET selec=Choose(['normal', 'bold', 'bolder', 'lighter'])
font-weight: `selec^;


XPT font hint=font
XSET kind=Choose(['normal', 'italic', 'oblique', 'small-caps', 'bold', 'bolder', 'lighter'])
XSET kind|post=SV('^\s*$', '', 'g')
XSET size=Choose(['xx-small', 'x-small', 'small', 'medium', 'large', 'x-large', 'xx-large', 'larger', 'smaller'])
XSET size|post=SV('^\s*$', '', 'g')
XSET font=Choose(['sans-serif', 'serif', 'monospace', 'cursive', 'fantasy', 'caption', 'icon', 'menu', 'message-box', 'small-caption', 'status-bar'])
XSET font|post=SV('^\s*$', '', 'g')
font:` `kind`^` `size`^` `font`^;


XPT letterspacing hint=letter-spacing
XSET selec=Choose(['normal'])
letter-spacing: `selec^;


XPT lineheight hint=line-height
XSET selec=Choose(['normal'])
line-height: `selec^;


XPT liststyleimage hint=list-style-image
XSET selec=Choose(['url()', 'none'])
XSET selec|post=css_braced_post()
list-style-image:` `selec^;


XPT liststyleposition hint=list-style-position
XSET selec=Choose(['inside', 'outside'])
list-style-position: `selec^;


XPT liststyletype hint=list-style-type
XSET selec=Choose(['disc', 'circle', 'square', 'decimal', 'decimal-leading-zero', 'lower-roman', 'upper-roman', 'lower-latin', 'upper-latin', 'none'])
list-style-type: `selec^;


XPT margin hint=margin
XSET selec=Choose(['auto'])
margin: `selec^;


XPT maxheight hint=max-height
XSET selec=Choose(['auto'])
max-height: `selec^;


XPT maxwidth hint=max-width
XSET selec=Choose(['none'])
max-width: `selec^;


XPT minheight hint=min-height
XSET selec=Choose(['none'])
min-height: `selec^;


XPT minwidth hint=min-width
XSET selec=Choose(['none'])
min-width: `selec^;

XPT outline hint=outline
XSET color=Choose(['rgb()', '#'])
XSET color|post=css_braced_post()
XSET style=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
XSET style|post=SV('^\s*$', '', 'g')
XSET width=Choose(['thin', 'thick', 'medium'])
XSET width|post=SV('^\s*$', '', 'g')
outline:` `width`^` `style`^` `color`^;

XPT outlinecolor hint=outline-color
XSET selec=Choose(['rgb()', '#'])
XSET selec|post=css_braced_post()
outline-color:` `selec^;


XPT outlinestyle hint=outline-style
XSET selec=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
outline-style: `selec^;


XPT outlinewidth hint=outline-width
XSET selec=Choose(['thin', 'thick', 'medium'])
outline-width: `selec^;


XPT overflow hint=overflow
XSET selec=Choose(['visible', 'hidden', 'scroll', 'auto'])
overflow: `selec^;


XPT pagebreakinside hint=page-break-inside
XSET selec=Choose(['auto', 'avoid'])
page-break-inside: `selec^;


XPT pitch hint=pitch
XSET selec=Choose(['x-low', 'low', 'medium', 'high', 'x-high'])
pitch: `selec^;


XPT playduring hint=play-during
XSET selec=Choose(['url()', 'mix', 'repeat', 'auto', 'none'])
XSET selec|post=css_braced_post()
play-during:` `selec^;


XPT position hint=position
XSET selec=Choose(['static', 'relative', 'absolute', 'fixed'])
position: `selec^;


XPT quotes hint=quotes
XSET selec=Choose(['none'])
quotes: `selec^;


XPT speakheader hint=speak-header
XSET selec=Choose(['once', 'always'])
speak-header: `selec^;


XPT speaknumeral hint=speak-numeral
XSET selec=Choose(['digits', 'continuous'])
speak-numeral: `selec^;


XPT speakpunctuation hint=speak-punctuation
XSET selec=Choose(['code', 'none'])
speak-punctuation: `selec^;


XPT speak hint=speak
XSET selec=Choose(['normal', 'none', 'spell-out'])
speak: `selec^;


XPT speechrate hint=speech-rate
XSET selec=Choose(['x-slow', 'slow', 'medium', 'fast', 'x-fast', 'faster', 'slower'])
speech-rate: `selec^;


XPT tablelayout hint=table-layout
XSET selec=Choose(['auto', 'fixed'])
table-layout: `selec^;


XPT textindent " text-indent
text-indent: `^;`cursor^

XPT textalign hint=text-align
XSET selec=Choose(['left', 'right', 'center', 'justify'])
text-align: `selec^;


XPT textdecoration hint=text-decoration
XSET selec=Choose(['none', 'underline', 'overline', 'line-through', 'blink'])
text-decoration: `selec^;


XPT texttransform hint=text-transform
XSET selec=Choose(['capitalize', 'uppercase', 'lowercase', 'none'])
text-transform: `selec^;


XPT top hint=top
XSET selec=Choose(['auto'])
top: `selec^;


XPT unicodebidi hint=unicode-bidi
XSET selec=Choose(['normal', 'embed', 'bidi-override'])
unicode-bidi: `selec^;


XPT verticalalign hint=vertical-align
XSET selec=Choose(['baseline', 'sub', 'super', 'top', 'text-top', 'middle', 'bottom', 'text-bottom'])
vertical-align: `selec^;


XPT visibility hint=visibility
XSET selec=Choose(['visible', 'hidden', 'collapse'])
visibility: `selec^;


XPT volume hint=volume
XSET selec=Choose(['silent', 'x-soft', 'soft', 'medium', 'loud', 'x-loud'])
volume: `selec^;


XPT whitespace hint=white-space
XSET selec=Choose(['normal', 'pre', 'nowrap', 'pre-wrap', 'pre-line'])
white-space: `selec^;


XPT wordspacing hint=word-spacing
XSET selec=Choose(['normal'])
word-spacing: `selec^;


XPT zindex hint=z-index
XSET selec=Choose(['auto'])
z-index: `selec^;


XPT bordertopcolor hint=border-top-color
XSET col=Choose(['rgb()', '#', 'transparent'])
XSET col|post=css_braced_post()
border-top-color:` `col^;

XPT borderbottomcolor hint=border-bottom-color
XSET col=Choose(['rgb()', '#', 'transparent'])
XSET col|post=css_braced_post()
border-bottom-color:` `col^;

XPT borderrightcolor hint=border-right-color
XSET col=Choose(['rgb()', '#', 'transparent'])
XSET col|post=css_braced_post()
border-right-color:` `col^;

XPT borderleftcolor hint=border-left-color
XSET col=Choose(['rgb()', '#', 'transparent'])
XSET col|post=css_braced_post()
border-left-color:` `col^;

XPT bordertopstyle hint=border-top-style
XSET col=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
border-top-style: `col^;

XPT borderbottomstyle hint=border-bottom-style
XSET col=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
border-bottom-style: `col^;

XPT borderrightstyle hint=border-right-style
XSET col=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
border-right-style: `col^;

XPT borderleftstyle hint=border-left-style
XSET col=Choose(['none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'])
border-left-style: `col^;

XPT bordertopwidth hint=border-top-width
XSET col=Choose(['rgb()', '#', 'transparent'])
XSET col|post=css_braced_post()
border-top-width:` `col^;

XPT borderbottomwidth hint=border-bottom-width
XSET col=Choose(['thin', 'thick', 'medium'])
border-bottom-width: `col^;

XPT borderrightwidth hint=border-right-width
XSET col=Choose(['thin', 'thick', 'medium'])
border-right-width: `col^;

XPT borderleftwidth hint=border-left-width
XSET col=Choose(['thin', 'thick', 'medium'])
border-left-width: `col^;

XPT pagebreakafter hint=page-break-after
XSET what=Choose(['auto', 'always', 'avoid', 'left', 'right'])
page-break-after: `what^;

XPT pagebreakbefore hint=page-break-before
XSET what=Choose(['auto', 'always', 'avoid', 'left', 'right'])
page-break-before: `what^;

