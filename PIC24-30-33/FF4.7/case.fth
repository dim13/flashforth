\ *******************************************************************
\    Case for FlashForth                                            *
\    Filename:      case.fth                                        *
\    Date:          1.1.2009                                        *
\    FF Version:    3.3 4.2                                         *
\    MCU:           PIC18F dsPIC30F                                 *
\    Copyright:     Mikael Nordman                                  *
\    Author:        Mikael Nordman                                  *
\ *******************************************************************
\ FlashForth is licensed according to the GNU General Public License*
\ *******************************************************************
\ A case implementation posted by Jenny Brien on c.l.f.
\ Modified to use for..next instead of do..loop

-case
marker -case
hex ram

variable #of
: case  (  x -- x #of )
  #of @  0 #of !  \ allow nesting
; immediate


: of  ( -- orig)
    postpone over  postpone = ( copy and test case value)
    postpone if    ( add orig to control flow stack )
    postpone drop  ( discards case value if = )
; immediate

: endof ( orig1  -- orig2 )
   postpone else 1 #of +!
; immediate

: endcase  ( #of  orig1..orign  -- )
    postpone drop  ( discard case value )
    #of @ for
      postpone then
    next
    #of !
; immediate
