
; COMCTL32.DLL structures and constants for TaskDialogs

; Common button flags

TDCBF_OK_BUTTON     = 0x01
TDCBF_YES_BUTTON    = 0x02
TDCBF_NO_BUTTON     = 0x04
TDCBF_CANCEL_BUTTON = 0x08
TDCBF_RETRY_BUTTON  = 0x10
TDCBF_CLOSE_BUTTON  = 0x20

; TaskDialog icons

TD_WARNING_ICON         = 0xFFFF - 1
TD_ERROR_ICON           = 0xFFFF - 2
TD_INFORMATION_ICON     = 0xFFFF - 3
TD_INFORMATION_SHIELD   = 0xFFFF - 4

; HRESULT values

S_OK            = 0
E_OUTOFMEMORY   = 0x8007000E
E_INVALIDARG    = 0x80070057
E_FAIL          = 0x80004005