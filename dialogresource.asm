
dialog      dialogsetup,\
            "TaskDialog Demo",\
            0, 0, 177, 213,\
            WS_CAPTION or WS_POPUP or WS_SYSMENU or DS_MODALFRAME
            
    ; Main dialog buttons
            
    dialogitem  'BUTTON',   "&Show",            IDSHOW,             66, 192, 50, 14,\
                WS_VISIBLE
    dialogitem  'BUTTON',   "&Close",           IDCANCEL,           120,192,50,14,\
                WS_VISIBLE
                
    ; Text fields and associated labels
                
    dialogitem  'STATIC',   "&Window Title:",   -1,                 7,7,44,8,\
                WS_VISIBLE
    dialogitem  'EDIT',     "",                 IDC_WINDOWCAPTION,  6,18,162,12,\
                WS_VISIBLE or ES_AUTOHSCROLL
                
    dialogitem  'STATIC',   "&Main Instruction:",-1,                6,36,55,8,\
                WS_VISIBLE
    dialogitem  'EDIT',     "",                 IDC_BODYHEADER,     6,48,162,12,\
                WS_VISIBLE or ES_AUTOHSCROLL
                
    dialogitem  'STATIC',   "Content &Text:",   -1,                 6,66,46,8,\
                WS_VISIBLE
    dialogitem  'EDIT',     "",                 IDC_BODYTEXT,       6,78,162,12,\
                WS_VISIBLE or ES_AUTOHSCROLL
    
    ; Button groupbox
    
    dialogitem  'BUTTON',   "Buttons",          -1,                 6,96,78,90,\
                WS_VISIBLE or BS_GROUPBOX
    dialogitem  'BUTTON',   "O&K",              IDC_OKBUTTON,       12,108,25,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    dialogitem  'BUTTON',   "&Yes",              IDC_YESBUTTON,     12,120,27,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    dialogitem  'BUTTON',   "&No",              IDC_NOBUTTON,       12,132,25,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    dialogitem  'BUTTON',   "C&ancel",          IDC_CANCELBUTTON,   12,144,37,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    dialogitem  'BUTTON',   "&Retry",           IDC_RETRYBUTTON,    12,156,34,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    dialogitem  'BUTTON',   "C&lose",           IDC_CLOSEBUTTON,    12,168,33,10,\
                WS_VISIBLE or BS_AUTOCHECKBOX or WS_TABSTOP
    
    ; Icon groupbox
    
    dialogitem  'BUTTON',   "Icon",             -1,                 90,96,78,90,\
                WS_VISIBLE or BS_GROUPBOX
    dialogitem  'BUTTON',   "N&one",            IDC_NONEICON,       96,108,33,10,\
                WS_VISIBLE or BS_AUTORADIOBUTTON or WS_TABSTOP
    dialogitem  'BUTTON',   "&Error",           IDC_ERRORICON,      96,120,32,10,\
                WS_VISIBLE or BS_AUTORADIOBUTTON
    dialogitem  'BUTTON',   "&Information",     IDC_INFORMATIONICON,96,132,53,10,\
                WS_VISIBLE or BS_AUTORADIOBUTTON
    dialogitem  'BUTTON',   "Shiel&d",          IDC_SHIELDICON,     96,144,35,10,\
                WS_VISIBLE or BS_AUTORADIOBUTTON
    dialogitem  'BUTTON',   "Warnin&g",         IDC_WARNINGICON,    96,156,43,10,\
                WS_VISIBLE or BS_AUTORADIOBUTTON
            
enddialog
