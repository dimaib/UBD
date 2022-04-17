VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00808080&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "KS_WDTLauncher"
   ClientHeight    =   1815
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3495
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Launcher.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1815
   ScaleWidth      =   3495
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.CommandButton Command7 
      Caption         =   "Обновить"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   120
      Top             =   960
   End
   Begin VB.CommandButton Command6 
      BackColor       =   &H00808080&
      Caption         =   "Остановить"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1800
      TabIndex        =   8
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Запустить"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Спрятать"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1320
      TabIndex        =   4
      Top             =   1440
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Выход"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   0
      Top             =   1440
      Width           =   855
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   120
      Top             =   360
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Запустить"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Остановить"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1800
      TabIndex        =   1
      Top             =   360
      Width           =   1575
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Сервер управления клиентами"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   210
      Index           =   1
      Left            =   120
      TabIndex        =   6
      Top             =   720
      Width           =   3315
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Сервер управления устройствами"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   210
      Index           =   0
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   3375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   240
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Visible         =   0   'False
      Width           =   720
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Function Shell_NotifyIconA Lib "SHELL32" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Integer
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetWindow Lib "user32" ( _
  ByVal hWnd As Long, _
  ByVal wCmd As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" ( _
  ByVal hWnd As Long, _
  lpdwProcessId As Long) As Long

Private Declare Function PostMessage Lib "user32" _
  Alias "PostMessageA" ( _
  ByVal hWnd As Long, _
  ByVal wMsg As Long, _
  ByVal wParam As Long, _
  ByVal lParam As Long) As Long
  
Private Const GW_HWNDFIRST = 0
Private Const GW_HWNDNEXT = 2
Private Const GW_CHILD = 5
Private Const WM_QUIT = &H12


Private Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    UID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type
   
Const NIM_ADD = 0
Const NIM_DELETE = 2
Const NIF_MESSAGE = 1
Const NIF_ICON = 2
Const NIF_TIP = 4

Const WM_MOUSEMOVE = &H200
Const WM_LBUTTONDOWN = &H201
Const WM_LBUTTONUP = &H202
Const WM_LBUTTONDBLCLK = &H203
Const WM_RBUTTONDOWN = &H204
Const WM_RBUTTONUP = &H205
Const WM_RBUTTONDBLCLK = &H206

Dim Proc As Long
Dim hProc As Long
Dim Flag As Boolean
Dim N_zap As Long
Dim hWnd1 As Long

Dim Proc_k As Long
Dim hProc_k As Long
Dim Flag_k As Boolean
Dim N_zap_k As Long
Dim hWnd1_k As Long


Private Function setNOTIFYICONDATA(hWnd As Long, ID As Long, Flags As Long, CallbackMessage As Long, Icon As Long, Tip As String) As NOTIFYICONDATA
    Dim nidTemp As NOTIFYICONDATA
    nidTemp.cbSize = Len(nidTemp)
    nidTemp.hWnd = hWnd
    nidTemp.UID = ID
    nidTemp.uFlags = Flags
    nidTemp.uCallbackMessage = CallbackMessage
    nidTemp.hIcon = Icon
    nidTemp.szTip = Tip & Chr$(0)
    setNOTIFYICONDATA = nidTemp
End Function


 
Private Sub Command1_Click() 'принудительное закрытие сервера
    If Flag And MsgBox("Остановить сервер устройств?", vbYesNo, "Остановка!") = 6 Then
        Stop_serv
    End If
End Sub

Private Sub Command2_Click() 'запуск сервера
    If Flag = False Then
        Proc = Shell(App.Path & "\Server_new.exe", vbMinimizedFocus And vbHide): N_zap = N_zap + 1: Timer1.Enabled = True
        hWnd1 = FindWindow(vbNullString, "KS_Server")
        If Proc Then Flag = True
        Command2.Enabled = False
        Command1.Enabled = True
    End If
End Sub

Private Sub Command3_Click()
    If MsgBox("Выйти с дальнейшей остановкой серверов?", vbYesNo, "Остановка!") = 6 Then
        Command1_Click
        Command6_Click
        End
    End If
End Sub

Private Sub Command4_Click()
    Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hWnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "Сторожевой таймер!")
    If Me.WindowState <> vbMinimized Then Me.Visible = False ': Me.WindowState = vbMinimized
End Sub

Private Sub Command5_Click()
    If Flag_k = False Then
        Proc_k = Shell(App.Path & "\Serv_client.exe", vbMinimizedFocus And vbHide): N_zap_k = N_zap_k + 1: Timer2.Enabled = True
        hWnd1_k = FindWindow(vbNullString, "Server_Client")
        If Proc_k Then Flag = True
        Command5.Enabled = False
        Command6.Enabled = True
    End If
End Sub

Private Sub Command6_Click()
    If Flag And MsgBox("Остановить сервер клиентов?", vbYesNo, "Остановка!") = 6 Then
        Stop_serv_k
    End If
End Sub

Private Sub Command7_Click()
    Shell App.Path & "\up.exe", vbNormalFocus
End Sub

Private Sub Form_Load()
    If App.PrevInstance Then MsgBox "Копия программы уже запущена!": End
    Label1 = "Количество перезапусков сервера: 0"
    Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hWnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "Сторожевой таймер")
    'Command2_Click
    'Command5_Click
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        Select Case X \ Screen.TwipsPerPixelX
            Case WM_MOUSEMOVE
            Case WM_LBUTTONDOWN
            Case WM_LBUTTONUP
            Case WM_LBUTTONDBLCLK
                Me.Visible = True
                Me.WindowState = vbNormal
                Me.Show
            Case WM_RBUTTONDOWN
            Case WM_RBUTTONUP
            Case WM_RBUTTONDBLCLK
        End Select
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next
    Dim Buf As String
'    Dim asf As String * 100
'    GetWindowText hWnd1, asf, 100
'    For i = 1 To Len(asf)
'        If Asc(Mid$(asf, i, 1)) = 0 Then Exit For
'    Next
    fff = FreeFile
    Open ("c:\WDT\WDT.ini") For Input As #fff
    Line Input #fff, Buf
    Close #fff
    'If i > 1 Then Buf = Mid$(asf, 1, i - 1) Else Buf = "01.01.2010 12:12:12"
    Buf = Trim$(Buf)
    If Trim$(Buf) = "" Then Buf = "01.01.2010 12:12:12"
    If Buf <> "KS_Server" Then
        Me.Caption = "Минут прошло: " & DateDiff("n", Buf, Date & " " & Time)
        If DateDiff("n", Buf, Date & " " & Time) >= 5 Then Stop_serv: Command2_Click
    Else
        Me.Caption = Buf & " " & Time
    End If
    Label2(0) = "Количество перезапусков сервера: " & N_zap
End Sub

Sub Stop_serv()
    hProc = OpenProcess(&H1, False, Proc)
    TerminateProcess hProc, 0
    CloseHandle hProc
    Flag = False
    Command2.Enabled = True
    Command1.Enabled = False
    Timer1.Enabled = False
    'Me.Caption = "Сервер остановлен!"
End Sub

Sub Stop_serv_k()
    hProc_k = OpenProcess(&H1, False, Proc_k)
    TerminateProcess hProc_k, 0
    CloseHandle hProc_k
    Flag_k = False
    Command5.Enabled = True
    Command6.Enabled = False
    Timer2.Enabled = False
    'Me.Caption = "Сервер остановлен!"
End Sub

Public Function fnGetWindowHwndByProcessID(lngProcessID As Long) As Long
    Dim lngCurProcessID As Long
    Dim lngRetVal As Long
    Dim hwndTemp As Long
    
    On Error GoTo HandleErr
    
    hwndTemp = GetDesktopWindow()
    hwndTemp = GetWindow(hwndTemp, GW_CHILD)
    
    Do While hwndTemp <> 0
        lngRetVal = GetWindowThreadProcessId(hwndTemp, lngCurProcessID)
        If lngCurProcessID = lngProcessID Then
            fnGetWindowHwndByProcessID = hwndTemp
            Exit Do
        End If
        hwndTemp = GetWindow(hwndTemp, GW_HWNDNEXT)
    Loop

    Exit Function
HandleErr:
    fnGetWindowHwndByProcessID = 0
End Function

Private Sub Timer2_Timer()
    On Error Resume Next
    Dim Buf As String
'    Dim asf As String * 100
'    GetWindowText hWnd1, asf, 100
'    For i = 1 To Len(asf)
'        If Asc(Mid$(asf, i, 1)) = 0 Then Exit For
'    Next
    fff = FreeFile
    Open ("c:\WDT\WDT_k.ini") For Input As #fff
    Line Input #fff, Buf
    Close #fff
    Buf = Trim$(Buf)
    If Trim$(Buf) = "" Then Buf = "01.01.2010 12:12:12"
    If Buf <> "Serv_client" Then
        'Me.Caption = "Минут прошло: " & DateDiff("n", Buf, Date & " " & Time)
        If DateDiff("s", Buf, Date & " " & Time) >= 60 Then Stop_serv_k: Command5_Click
    Else
        'Me.Caption = Buf & " " & Time
    End If
    Label2(1) = "Количество перезапусков сервера: " & N_zap_k
End Sub
