'**************************************************************************
'*  File:           LDAP_Cream.vbs                                        *
'*  Created:        March 2003, old tech still kicks ass                  *
'*  Version:        1.0                                                   *
'*                                                                        *
'*  Description:    Diagnostic utility that attempts to connect to the    *
'*                  rootDSE entry of an AD domain controller to return    *
'*                  the DnsHostName property. The purpose is to provide   *
'*                  an equivalent utility to ping that checks for the     *
'*                  availability of the directory service on an Active    *
'*                  Directory domain controller.                          *
'*                                                                        *
'*  Compatibility:  This script requires WSH 5.6, CScript, ADSI           *
'*                  and access to Active Directory                        *
'**************************************************************************
Option Explicit
'Define any constants used in this script
Const LDAP_SERVER_DOWN = &h8007203a
'Declare global variables
Dim objArgs,strServerName,strMessage
'Use Named Arguments collection for the command line argument.
'The WSHArguments Object is included in WSH version 5.6 and later
Set objArgs = WScript.Arguments.Named
strServerName = objArgs.Item("dc")
If WScript.Arguments.Named.Count < 1 Then
  Call Usage()
   WScript.Quit
ElseIf Not Wscript.Arguments.Named.Exists("dc") Then
  Call Usage()
  WScript.Quit
Else
  strMessage = PingDS(strServerName)
  WScript.Echo strMessage
End If
'**********************************************************************
'* Routine: Usage
'**********************************************************************
Sub Usage()
    WScript.Echo "Usage: LDAP_Cream /dc:target_name"  & VbCrLf & _
     "For target_name, specify the ip address or name (NetBIOS name or FQDN)" & VbCrLf & _
     "of an Active Directory domain controller."
End Sub
'**********************************************************************
'* Function: PingDS
'**********************************************************************
  Do
  WScript.Sleep 300000
Function PingDS(ServerName)
  Dim  objRootDSE, strDNSHostName
  On Error Resume Next
  Set objRootDSE = GetObject("LDAP://" & serverName & "/rootDSE")
  If err.number = LDAP_SERVER_DOWN Then
    PingDS = ServerName & " did not reply."
  Else
    On Error GoTo 0
    strDNSHostName = "LDAP://" & objRootDSE.Get("DnsHostName")
    PingDS = "DnsHostName: " & strDNSHostName & " replied."
  End If
End Function
    Loop
