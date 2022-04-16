VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSComm32.Ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00404040&
   BorderStyle     =   0  'None
   Caption         =   "Посотроение графиков по данным UARTa"
   ClientHeight    =   11280
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   19920
   FillColor       =   &H00404040&
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   11280
   ScaleWidth      =   19920
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CD 
      Left            =   11040
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Открыть"
      Height          =   375
      Left            =   1920
      TabIndex        =   9
      Top             =   0
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00404040&
      Caption         =   "Данные из порта"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   3000
      TabIndex        =   8
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Сохранить"
      Height          =   375
      Left            =   960
      TabIndex        =   7
      Top             =   0
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Выход"
      Height          =   375
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   13800
      Top             =   2760
   End
   Begin VB.TextBox Text1 
      BorderStyle     =   0  'None
      Height          =   11295
      Left            =   17760
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   2175
   End
   Begin MSCommLib.MSComm Comm 
      Left            =   12960
      Top             =   960
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Label TestL 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      Caption         =   "---"
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   3000
      TabIndex        =   5
      Top             =   2400
      Visible         =   0   'False
      Width           =   180
   End
   Begin VB.Line Test 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   2880
      X2              =   2880
      Y1              =   2400
      Y2              =   4800
   End
   Begin VB.Label Label 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Label1"
      ForeColor       =   &H00FFFF00&
      Height          =   195
      Index           =   3
      Left            =   5160
      TabIndex        =   4
      Top             =   3720
      Width           =   465
   End
   Begin VB.Label Label 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Label1"
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   2
      Left            =   5160
      TabIndex        =   3
      Top             =   3480
      Width           =   465
   End
   Begin VB.Label Label 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Label1"
      ForeColor       =   &H000000FF&
      Height          =   195
      Index           =   1
      Left            =   5160
      TabIndex        =   2
      Top             =   3240
      Width           =   465
   End
   Begin VB.Label Label 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Label1"
      ForeColor       =   &H0000FF00&
      Height          =   195
      Index           =   0
      Left            =   5160
      TabIndex        =   1
      Top             =   3000
      Width           =   465
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type UART_AR_
    a(3) As Long
End Type

Dim Incr_graf As Long
Dim YY_(3) As Long, YY As Long
Dim ZeroX(3) As Integer, ZeroY(3) As Integer 'Задание нуля по X и Y осям (смещение)
Dim Lab(3) As String 'подпись перед меткой
Dim Uart() As UART_AR_



Private Sub Check1_Click()
    Timer1.Enabled = Check1.Value
End Sub

Private Sub Command1_Click()
    End
End Sub

Private Sub Command2_Click()
    Save_Graf
End Sub

Private Sub Command3_Click()
    CD.ShowOpen
    fl = CD.FileName
    F = FreeFile
    Incr_graf = 0
    oi = 0
    Open fl For Input As #F
        Do Until EOF(F)
            Line Input #F, mytext
            aff = Split(mytext, " ")
            ReDim Preserve Uart(Incr_graf)
            For i = 0 To UBound(aff)
                Uart(Incr_graf).a(i) = aff(i)
            Next
            
            UB = UBound(aff)
            If UB > 3 Then UB = 3
            For i = 0 To UB
                If Val(aff(i)) > 255 And Incr_graf > 0 Then aff(i) = Uart(Incr_graf - 1).a(i)
                Graf_Paint i, Val(aff(i)), Label(i).ForeColor
                Uart(oi).a(i) = Val(aff(i))
            Next
            Incr_graf = Incr_graf + 1
        Loop
    Close
End Sub

Private Sub Form_Load()
    ZeroY(0) = 750: ZeroY(1) = 400: ZeroY(2) = 900: ZeroY(3) = 850
    'ZeroY(0) = 500: ZeroY(1) = 500: ZeroY(2) = 500: ZeroY(3) = 500
    ZeroX(0) = 0: ZeroX(1) = 40: ZeroX(2) = 80: ZeroX(3) = 120
    Lab(0) = "X=": Lab(1) = "Y=": Lab(2) = "Z=": Lab(3) = "P=":
    Me.Left = 0
    Me.Width = Screen.Width
    Text1.Left = (Screen.Width - Text1.Width) '\ 15
    Grid
    Me.DrawWidth = 1
    Test.Y1 = 0: Test.Y2 = Me.Height
    ReDim Uart(0)
    If Comm.PortOpen Then Comm.PortOpen = False
    Comm.CommPort = 6
    Comm.Settings = "9600,N,8,1"
    Comm.PortOpen = True
    'Timer1.Enabled = True
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Test.X1 = X: Test.X2 = X: TestL.Move X, 0
    If Test.Visible Then
        If X \ 15 <= UBound(Uart) Then TestL = Lab(0) & Uart(X \ 15).a(0) & " " & Lab(1) & Uart(X \ 15).a(1) & " " & Lab(2) & Uart(X \ 15).a(2) & " " & Lab(3) & Uart(X \ 15).a(3) Else TestL = "---"
    End If
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then Test.Visible = Not (Test.Visible): TestL.Visible = Test.Visible
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next
    'If Comm.PortOpen Then
        'If Comm.InBufferCount Then in_tmp = Comm.Input
    'End If
    in_tmp = in_tmp & Comm.Input
    If Mid$(in_tmp, Len(in_stp) - 2, 2) = vbNewLine Then
        in_tmp = Mid$(in_tmp, 1, Len(in_tmp) - 2)
'        Text1 = Text1 & in_tmp
'        Text1.SelStart = Len(Text1)
        If in_tmp <> "" And Len(in_tmp > 9) Then
            'Text1 = in_tmp
            ar = Split(in_tmp, " ")
            UB = UBound(ar)
            If UB > 3 Then UB = 3
            If UB = 2 Then
                For i = 0 To UB
                    If Val(ar(i)) > 255 And Incr_graf > 0 Then ar(i) = Uart(Incr_graf - 1).a(i)
                    Graf_Paint i, Val(Trim(ar(i))), Label(i).ForeColor
                    Uart(Incr_graf).a(i) = Val(ar(i))
                    Text1 = Text1 & ar(i) & " "
                    Text1.SelStart = Len(Text1)
                Next
                Text1 = Text1 & vbNewLine
            End If
            Incr_graf = Incr_graf + 1
            ReDim Preserve Uart(Incr_graf)
            If Incr_graf > Me.Width / 15 Then Grid
        End If
        in_tmp = ""
    End If
End Sub

Private Sub Graf_Paint(N, Y As Long, Color)
    Me.Line ((Incr_graf + ZeroX(N)) * 15, (ZeroY(N) - YY_(N)) * 15)-((Incr_graf + ZeroX(N)) * 15, (ZeroY(N) - Y) * 15), Color
    YY_(N) = Y
    If (ZeroY(N) - Y) * 15 < 0 Then
        Label(N).Move (Incr_graf + 3 + ZeroX(N)) * 15, 0
    ElseIf (ZeroY(N) - Y) * 15 > Me.Width - Label(N).Height Then
        Label(N).Move (Incr_graf + 3 + ZeroX(N)) * 15, Me.Height - Label(N).Height
    Else
        Label(N).Move (Incr_graf + 3 + ZeroX(N)) * 15, (ZeroY(N) - Y) * 15 - Label(N).Height \ 2
    End If
    Label(N) = Lab(N) & Y
End Sub

Private Sub Save_Graf()
    If UBound(Uart) > 0 Then
        F = FreeFile
        fl = "c:\grafic_" & Date & "_" & Format(Time, "hh.mm.ss") & ".txt"
        Open fl For Output As #F
            For i = 0 To UBound(Uart)
                Print #1, Uart(i).a(0) & " " & Uart(i).a(1) & " " & Uart(i).a(2) & " " & Uart(i).a(3)
            Next
        Close
        Grid
    End If
End Sub

Private Sub Grid()
    Incr_graf = 0: Me.Cls: Me.DrawWidth = 1
    ReDim Uart(0)
    For i = 0 To Me.Width Step 10 '* 15
        'Me.Line (i * 15, 0)-(i * 15, Me.Height), QBColor(2)
        'Me.Line (0, i * 15)-(Me.Width, i * 15), QBColor(2)
    Next
    Me.DrawStyle = 2
    For i = 0 To 3
        Me.Line (0, ZeroY(i) * 15)-(Screen.Width, ZeroY(i) * 15), Label(i).ForeColor
    Next
    Me.DrawStyle = 0
End Sub
