VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSComm32.Ocx"
Begin VB.Form Form1 
   BackColor       =   &H000000FF&
   BorderStyle     =   0  'None
   Caption         =   "Считыватель карт"
   ClientHeight    =   1215
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4335
   Icon            =   "RFID_READ.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1215
   ScaleWidth      =   4335
   StartUpPosition =   2  'CenterScreen
   Begin MSCommLib.MSComm comm2 
      Left            =   2760
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.TextBox Text2 
      Height          =   1695
      Left            =   360
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "RFID_READ.frx":0442
      Top             =   1320
      Width           =   2535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Выход"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3120
      TabIndex        =   2
      Top             =   720
      Width           =   1095
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   720
      Top             =   240
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   240
      Top             =   240
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Копировать RFID"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   2895
   End
   Begin MSCommLib.MSComm comm 
      Left            =   2160
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   21.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   0
      Text            =   "Подключение..."
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim St As String, RFID_Cur As Long, Port_i As Integer, Port_cout As Integer
Dim arr() As Integer
Dim fff

Private Sub Command1_Click()
    If Val(Text1) > 9000 Then
        Clipboard.Clear
        Clipboard.SetText Text1.Text
    ElseIf Text1 = "Подключение..." Then
        MsgBox "Считыватель не подключен" & vbNewLine & "или не установлены драйвера", , "Считыватель карт"
    ElseIf Val(Text1) = 0 Then
        MsgBox "Приложите карту к считываетлю!", , "Считыватель карт"
    End If
End Sub

Private Sub Comm_Free()
    DoEvents
    ReDim arr(0)
    Text2 = ""
    For i = 3 To 100
        If comm2.PortOpen Then comm2.PortOpen = False
        comm2.CommPort = i
        On Error Resume Next
        comm2.PortOpen = True
        If Not (Err) And comm2.PortOpen Then
            If UBound(arr) = 0 And arr(0) = 0 Then
                arr(0) = i
            Else
                ReDim Preserve arr(UBound(arr) + 1)
                arr(UBound(arr)) = i
            End If
            Text2 = Text2 & arr(UBound(arr)) & vbNewLine
        End If
        If comm2.PortOpen Then comm2.PortOpen = False
    Next
End Sub

Private Sub Command2_Click()
    End
End Sub

Private Sub Form_Load()
    Port_i = 1
    ReDim arr(0)
    Timer1.Enabled = True
    'Timer2.Enabled = True
End Sub

Private Sub Timer1_Timer()
    DoEvents
    If comm.PortOpen Then
        'Command2.Caption = Rnd(100)
        On Error Resume Next
        St = comm.Input
        If Err Then comm.PortOpen = False
        'Text2 = St
        If Len(St) > 9 Then
            If Mid(St, 1, 9) = "RFID_CUR=" Then
                On Error Resume Next
                RFID_Cur = Val(Mid(St, 10, Len(St)))
                If RFID_Cur > 9000 Or RFID_Cur = 0 Then
                    Text1 = IIf(RFID_Cur > 0, RFID_Cur, "Приложите карту")
                    Port_cout = 0: Timer2.Enabled = False: Me.BackColor = QBColor(10)
                Else
                    Port_cout = Port_cout + 1
                End If
            End If
        'Else
            'Port_cout = Port_cout + 1
        End If
    Else
        
        Comm_Free
        'For i = 0 To UBound(arr)
        '    MsgBox arr(i)
        'Next
        'Command2.Caption = Command2.Caption & "1"
        'If arr(0) = 0 Then arr(0) = 1
        'Me.Caption = arr(Port_i)
        On Error Resume Next
        comm.CommPort = arr(Port_i)
        comm.Settings = "9600,N,8,1"
        comm.PortOpen = True
        'Command1.Caption = Mid(Rnd(100), 1, 3) & "-" & comm.CommPort
        If Err Then
            If comm.PortOpen Then comm.PortOpen = False
            Port_cout = Port_cout + 1
            If Port_cout > 3 Then
                Me.BackColor = QBColor(12)
                Port_cout = 0
                Timer2.Enabled = True
                Port_i = Port_i + 1
                If Port_i > UBound(arr) Then Port_i = 0 'поиск среди портов от 1 до 20
            End If
        End If
    End If
    'Command2.Caption = fff
End Sub

Private Sub Timer2_Timer()
    fff = fff + 1
    Port_cout = Port_cout + 1
    If Port_cout > 4 Then 'кол-во считываний при поиске нужного порта. => влияет на скорость поиска
        Port_i = Port_i + 1
        Text1 = "Подключение..."
        Port_cout = 0
        If comm.PortOpen Then comm.PortOpen = False
    End If
End Sub
