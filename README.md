# TaskDialog Demo
This example showcases a number of things:
- The TaskDialog, introduced in Vista
- Embedding an external resource (.RES) file, containing a manifest to enable visual styles (required for TaskDialog) and the experimenter's dialog box
- How to create a dialog box object from a dialog resource in a RES file.
- How to build a message loop, and how to build the message handler for the dialog
- Some basic window and control operations, such as moving a window with respect to the available working area on the desktop

## Description of Files
- `TaskDialogDemo.asm` -- the main code file
- `resources.rc` -- the resource script containing the demo dialog box definition and manifest
- `resource.h` -- produced by VS2017; exports a list of resource constants for use in a C program
- `resource.inc` -- an adaptation of `resource.h` for use in `TaskDialogDemo.asm`
- `manifest.xml` -- the manifest file, required by Windows to enable visual styles

## Additional Comments
The resource script (.RC) file was created with Visual Studio 2017, and compiled with the resource compiler RC.EXE included in the Win32 SDK. During development, I discovered that VS2017's RC format does not seem compatible with Watcom's "Microsoft" format, and so you cannot mix those two toolsets (i.e. create RC in VS2017 and compile with Watcom's RC). Use one or the other, not both.

To start with, I was interested in using Watcom's resource editor. After I discovered how difficult it is to use in practice (no keyboard shortcuts to common functions, control positioning was too naive, no alignment grid) I decided to use VS2017's editor instead.
