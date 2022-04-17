VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form4 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Заметки"
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8760
   BeginProperty Font 
      Name            =   "Segoe UI Light"
      Size            =   8.25
      Charset         =   204
      Weight          =   300
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Notepad.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5055
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Not_item 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      ForeColor       =   &H00808080&
      Height          =   855
      Index           =   2
      Left            =   4080
      ScaleHeight     =   855
      ScaleWidth      =   1815
      TabIndex        =   4
      Top             =   3360
      Visible         =   0   'False
      Width           =   1815
      Begin VB.TextBox Item 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Segoe UI"
            Size            =   9
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   2
         Left            =   0
         MultiLine       =   -1  'True
         TabIndex        =   7
         Text            =   "Notepad.frx":0442
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.PictureBox Not_item 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      ForeColor       =   &H00808080&
      Height          =   855
      Index           =   1
      Left            =   4080
      ScaleHeight     =   855
      ScaleWidth      =   1815
      TabIndex        =   3
      Top             =   2400
      Visible         =   0   'False
      Width           =   1815
      Begin VB.TextBox Item 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Segoe UI"
            Size            =   9
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Index           =   1
         Left            =   0
         MultiLine       =   -1  'True
         TabIndex        =   6
         Text            =   "Notepad.frx":0448
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.PictureBox Not_item 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      ForeColor       =   &H00808080&
      Height          =   855
      Index           =   0
      Left            =   4080
      ScaleHeight     =   855
      ScaleWidth      =   1815
      TabIndex        =   2
      Top             =   1440
      Visible         =   0   'False
      Width           =   1815
      Begin VB.TextBox Item 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Segoe UI"
            Size            =   9
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   495
         Index           =   0
         Left            =   0
         MultiLine       =   -1  'True
         TabIndex        =   5
         Text            =   "Notepad.frx":044E
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Segoe UI Light"
         Size            =   9
         Charset         =   204
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   1215
      Left            =   4080
      MaxLength       =   255
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
   Begin MSForms.ListBox List 
      Height          =   1335
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   1815
      BackColor       =   16183789
      ForeColor       =   8421504
      BorderStyle     =   1
      ScrollBars      =   3
      DisplayStyle    =   2
      Size            =   "3201;2355"
      MatchEntry      =   0
      BorderColor     =   16183789
      SpecialEffect   =   0
      FontName        =   "Segoe UI Light"
      FontHeight      =   240
      FontCharSet     =   204
      FontPitchAndFamily=   2
      FontWeight      =   300
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   2880
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim delbt As Boolean, svbt As Boolean

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 10125 And Y <= 390 Then 'Кнопка закрыть крест
        Unload Me
        If Karta_p.Visible Then
            Karta_p.Enabled = True: Karta_p.Show
        ElseIf Karta_t.Visible Then
            Karta_t.Enabled = True: Karta_t.Show
        Else
            Form1.Enabled = True: Form1.Show
        End If
    End If
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
End Sub

Private Sub Form_Load()
    Me.Cls
    Me.Width = 708 * 15
    Me.Height = 421 * 15
    LoadImage App.Path & "\res\" & "note_.png", Me.hdc, 0, 0
    Me.Refresh
    Text1.Move 16 * 15, 303 * 15, 239 * 15, 61 * 15
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print "Заметки по оператору"
    List.Move 22 * 15, 45 * 15, 670 * 15, 285 * 15
    Text1.Move 452 * 15, 348 * 15

   LoadImage App.Path & "\res\" & "add_note.png", Me.hdc, 17, 373
   LoadImage App.Path & "\res\" & "save_note.png", Me.hdc, 170, 373
   LoadImage App.Path & "\res\" & "del_note.png", Me.hdc, 283, 373
   Me.Line (281 * 15, 371 * 15)-(370 * 15, 414 * 15), QBColor(15), BF 'квадрат для удалить
   Me.Line (166 * 15, 371 * 15)-(275 * 15, 414 * 15), QBColor(15), BF 'квадрат для сохранить
   Me.Refresh
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If X >= 17 * 15 And X <= 160 * 15 And Y >= 373 * 15 And Y <= 414 * 15 And Text1 <> "" And (Dostup = 1 Or Dostup = 2) Then  'Добавить
            Form1.WinS.SendData "AddNote:" & Date & " " & Time & "|" & Note_Type & "|" & Note_UID & "|" & Text1 & "|" & Us_Name
            List.ListIndex = -1
            Text1 = ""
            Me.Line (281 * 15, 371 * 15)-(370 * 15, 414 * 15), QBColor(15), BF 'квадрат для удалить
            Me.Line (166 * 15, 371 * 15)-(275 * 15, 414 * 15), QBColor(15), BF 'квадрат для сохранить
            svbt = False: delbt = False
        ElseIf X >= 170 * 15 And X <= 273 * 15 And Y >= 373 * 15 And Y <= 414 * 15 And svbt And (Dostup = 1) Then    'Сохранить
            Note(List.ListIndex).Text = Text1
            Form1.WinS.SendData "EditNote:" & Note(List.ListIndex).ID & "|" & Date & " " & Time & "|" & Us_Name & "|" & Note(List.ListIndex).Text
            List.ListIndex = -1
            Text1 = ""
            Me.Line (281 * 15, 371 * 15)-(370 * 15, 414 * 15), QBColor(15), BF 'квадрат для удалить
            Me.Line (166 * 15, 371 * 15)-(275 * 15, 414 * 15), QBColor(15), BF 'квадрат для сохранить
            svbt = False: delbt = False
        ElseIf X >= 283 * 15 And X <= 368 * 15 And Y >= 373 * 15 And Y <= 414 * 15 And delbt And (Dostup = 1) Then    'Удалить
            Form1.WinS.SendData "RemNote:" & Note(List.ListIndex).ID & "|" & Note_Type & "|" & Note_UID
            List.ListIndex = -1
            Text1 = ""
            Me.Line (281 * 15, 371 * 15)-(370 * 15, 414 * 15), QBColor(15), BF 'квадрат для удалить
            Me.Line (166 * 15, 371 * 15)-(275 * 15, 414 * 15), QBColor(15), BF 'квадрат для сохранить
            svbt = False: delbt = False
        End If
    End If
End Sub

Private Sub List_DblClick(Cancel As MSForms.ReturnBoolean)
    If (Dostup = 1) Then
        Dim diffd As Integer
        tmp_date = Split(Note(List.ListIndex).Date, ".")
        If UBound(tmp_date) = 0 Then Note(List.ListIndex).Date = Date & " " & Time
        If List.ListIndex > -1 And List.List(0) <> "Нет заметок" Then diffd = DateDiff("h", Note(List.ListIndex).Date, Date & " " & Time)
        If List.ListIndex > -1 And List.List(0) <> "Нет заметок" Then 'And diffd < 48 Then 'запрос на редактирование записи
            Text1 = Note(List.ListIndex).Text
            Text1.SetFocus: Text1.SelStart = Len(Text1)
            LoadImage App.Path & "\res\" & "save_note.png", Me.hdc, 170, 373
            LoadImage App.Path & "\res\" & "del_note.png", Me.hdc, 283, 373
            svbt = True: delbt = True
            Me.Refresh
        End If
    End If
End Sub

Private Sub Text1_Change()
    Tx_reserv Text1
End Sub
