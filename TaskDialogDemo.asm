
format PE64 GUI 6.0
entry start

    include "win64a.inc"
    include "COMCTL32_TD_DEF.inc"

section '.text' code readable executable
    
    start:
	and rsp, -16
    
	;invoke  InitCommonControlsEx,\
	;	 ccInit
    
	invoke	TaskDialog,\
		0,\
		0,\
		msg_Title,\
		msg_helloWorld,\
		msg_helloExamp,\
		TDCBF_OK_BUTTON or TDCBF_CANCEL_BUTTON,\
		TD_INFORMATION_SHIELD,\
		td_result
		
	invoke ExitProcess, 0
    
section '.data' data readable writeable

    ccInit  INITCOMMONCONTROLSEX \
	    8,\
	    0

    msg_Title	    du "TaskDialog Example", 0
    msg_helloWorld  du "Hello World!", 0
    msg_helloExamp  du "This is an example of the TaskDialog. This code sample also shows how to embed a manifest file, which is required to enable visual styles.", 0
    td_result	    dq ?
    
section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            comctl32,'COMCTL32.DLL'
    
    include 'api/kernel32.inc'
    include 'COMCTL32_TD_API.inc'
    
section '.rsrc' data readable resource from 'resources.res'
