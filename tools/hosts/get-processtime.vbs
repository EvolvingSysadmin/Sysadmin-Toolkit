Set objFS = CreateObject("Scripting.FileSystemObject")
Set objNewFile = objFS.CreateTextFile("ProcessList.txt")
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" _
& strComputer & "\root\cimv2")

Set dtmProcTime = CreateObject( _
"WbemScripting.SWbemDateTime")

Set colProcesses = objWMIService.ExecQuery( _
"select * from win32_process" )

For Each objProcess In colProcesses
strOutput = strOutput & _
objProcess.Name & " (" & objProcess.ProcessID & ")"

If NOT IsNull(objProcess.CreationDate) Then
strOutput = strOutput & vbTab & _
getmytime(objProcess.CreationDate)
End If

If NOT IsNull(objProcess.ExecutablePath) Then
strOutput = strOutput & vbTab & _
objProcess.ExecutablePath
End If
strOutput = strOutput & vbCrLf
Next
objNewFile.WriteLine strOutput

Function getmytime(wmitime)
dtmProcTime.Value = wmitime
getmytime = dtmProcTime.GetVarDate
End Function