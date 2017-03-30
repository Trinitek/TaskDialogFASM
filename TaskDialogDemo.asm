
format PE64 console 6.0
entry start

    include "win64a.inc"
    include "COMCTL32_TD_DEF.inc"
    include "resource.inc"

section '.text' code readable executable

    macro   __TestInitError {
        cmp rax, 0
        jnz @f
            invoke  MessageBoxW,\
                    0,\
                    msg_InitError,\
                    msg_Title,\
                    MB_OK or MB_ICONERROR
            jmp .finish
        @@:
    }
    
    start:
        and rsp, -16
        
        invoke  InitCommonControlsEx,\
                ccInit
        
        invoke	TaskDialog,\
                0,\
                0,\
                msg_Title,\
                msg_helloWorld,\
                msg_helloExamp,\
                TDCBF_OK_BUTTON or TDCBF_CANCEL_BUTTON,\
                TD_INFORMATION_SHIELD,\
                td_result
                
        ; Create new dialog box from TASKDIALOGSETUP resource, in our .res file
        invoke  CreateDialogParamW,\
                0,\
                IDD_TASKDIALOGSETUP,\
                0,\
                SetupDialogProc,\
                0
                
        __TestInitError
        
        mov [dHandle], rax
        
        ; Get working area on desktop
        invoke  SystemParametersInfo,\
                SPI_GETWORKAREA,\
                0,\
                workArea,\
                0
                
        ; Get window size/position
        invoke  GetWindowRect,\
                [dHandle],\
                dSize
                
        ; Calculate new window position -- default is top left of screen
        mov eax, [dSize.left]       ; dSize.right -= dSize.left (== absolute width)
        sub [dSize.right], eax
        shr [dSize.right], 1        ; width /= 2
        
        mov eax, [dSize.top]        ; dSize.bottom -= dSize.top (== absolute height)
        sub [dSize.bottom], eax
        shr [dSize.bottom], 1       ; height /= 2
        
        mov eax, [workArea.left]    ; workArea.right -= workArea.left (== absolute width)
        sub [workArea.right], eax
        shr [workArea.right], 2     ; workArea_width /= 4
        
        mov eax, [workArea.top]     ; workArea.bottom -= workArea.top (== absolute height)
        sub [workArea.bottom], eax
        shr [workArea.bottom], 1    ; workArea_height /= 2
        
        mov eax, [dSize.right]      ; x = (workArea_width / 4) - (width / 2)
        sub [workArea.right], eax
        
        mov eax, [dSize.bottom]     ; y = (workArea_height) / 2) - (height / 2)
        sub [workArea.bottom], eax
                
        ; Center in the left half of the desktop horizontally, and center vertically
        ; And show the window.
        invoke  SetWindowPos,\
                [dHandle],\
                0,\
                [workArea.right],\
                [workArea.bottom],\
                0,\
                0,\
                SWP_NOSIZE or SWP_NOZORDER; or SWP_SHOWWINDOW
                
        invoke  ShowWindow,\
                [dHandle],\
                SW_SHOW
                
        ;invoke  PostMessage,\
        ;        [dHandle],\
        ;        WM_INITDIALOG,\
        ;        0,\
        ;        0
        
        .messageLoop:
            ; Get next GUI message
            invoke  GetMessage,\
                    dMessage,\
                    0,\
                    0,\
                    0
            
            ; If -1, an error occurred
            ; If  0, WM_QUIT was posted
            cmp rax, 1
            jb .finish
            
            ; Else, handle dialog-specific messages
            invoke  IsDialogMessage,\
                    [dHandle],\
                    dMessage,\
            
            ; If no messages were handled, translate and dispatch as normal
            ;cmp rax, FALSE
            ;jne @f
            ;invoke  TranslateMessage,\
            ;        dMessage
            ;invoke  DispatchMessage,\
            ;        dMessage
            ;
            ;@@:
            jmp .messageLoop
        
        .finish:
        invoke  printf,\
                msg_finished
        invoke  ExitProcess,\
                0
        
    ; DialogProc callback function
    ; Handles message dispatching for the main dialog window
    proc    SetupDialogProc\
            hDialog, dMessage, wParam, lParam
            
        mov [hDialog], rcx
        mov [dMessage], rdx
        mov [wParam], r8
        mov [lParam], r9
            
        mov rax, [dMessage]
        cmp eax, WM_INITDIALOG
        je .wmInitDialog
        cmp eax, WM_SHOWWINDOW
        je .wmInitDialog
        cmp eax, WM_COMMAND
        je .wmCommand
        cmp eax, WM_DESTROY
        je .wmDestroy
        
        ; Additional window message processing
        invoke  DefWindowProc,\
                [hDialog],\
                [dMessage],\
                [wParam],\
                [lParam]
        
        ; No specific messages were processed
        jmp .finishNotProcessed
        
        .wmInitDialog:
            invoke  CheckRadioButton,\
                    [dHandle],\
                    IDC_NONEICON,\
                    IDC_WARNINGICON,\
                    IDC_NONEICON
            jmp .finishProcessed
        
        .wmCommand:
            mov rax, [wParam]
            cmp ax, IDC_CLOSE
            je .wmc_CloseButton
            cmp ax, IDC_SHOW
            je .wmc_ShowButton
            jmp .finishNotProcessed
            
            .wmc_CloseButton:
                jmp .wmDestroy
                
            .wmc_ShowButton:
                jmp .wmInitDialog
                
        .wmDestroy:
            invoke  PostQuitMessage,\
                    0
            invoke  printf,\
                    msg_destroy
                    
            jmp .finishProcessed
        
        .finishProcessed:
            mov rax, TRUE
            ret
            
        .finishNotProcessed:
            mov rax, FALSE
            ret
        
    endp
    
section '.data' data readable writeable

    ccInit  INITCOMMONCONTROLSEX \
	    8,\
	    0
        
    dMessage        MSG
    dHandle         dq ?
    workArea        RECT
    dSize           RECT
    newX            dq ?
    newY            dq ?

    msg_Title	    du "TaskDialog Example", 0
    msg_InitError   du "There was a problem during initialization.", 0
    msg_LoopError   du "There was a problem when handling the message loop.",0
    msg_CloseButton du "IDC_CLOSEBUTTON",0
    msg_helloWorld  du "Hello World!", 0
    msg_helloExamp  du "This is an example of the TaskDialog. This code sample also shows how to embed a manifest file, which is required to enable visual styles.", 0
    td_result	    dq ?
    
    msg_initdialog  db "WM_INITDIALOG",0x0A,0
    msg_destroy     db "WM_DESTROY",0x0A,0
    
    msg_message     db "%d",0x0A,0
    msg_looperr     db "Message loop error",0x0A,0
    msg_finished    db "Finished",0x0A,0
    
section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            comctl32,'COMCTL32.DLL',\
            user32,'USER32.DLL',\
            msvcrt,'MSVCRT.DLL'
    
    include 'api/kernel32.inc'
    include 'api/user32.inc'
    include 'COMCTL32_TD_API.inc'
    
    import  msvcrt,\
            printf,'printf'
    
section '.rsrc' data readable resource from 'resources.res'
