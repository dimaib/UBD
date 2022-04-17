VERSION 5.00
Begin VB.Form Set_frm 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'Нет
   Caption         =   "Система бесключвого доступа"
   ClientHeight    =   2865
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4350
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   FillStyle       =   6  'Пересечение
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   9
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   FontTransparent =   0   'False
   Icon            =   "Set.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Set_frm"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2865
   ScaleWidth      =   4350
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Alignment       =   2  'Центровка
      Appearance      =   0  'Плоска
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'Нет
      BeginProperty Font 
         Name            =   "Segoe UI Light"
         Size            =   9.75
         Charset         =   204
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00828894&
      Height          =   255
      Left            =   960
      MaxLength       =   50
      TabIndex        =   0
      Top             =   720
      Width           =   2310
   End
End
Attribute VB_Name = "Set_frm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Form_MouseUp 1, 0, 195, 1290
    If KeyAscii = 27 Then End
End Sub

Private Sub Form_Load()
    Me.Cls
    Me.Width = 273 * 15
    Me.Height = 140 * 15
    LoadImage App.Path & "\res\" & "Set.png", Me.hdc, 0, 0
    Me.Refresh
    Text1.Move 115 * 15, 53 * 15, 140 * 15
    Text1 = Addr_Server
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 3630 And Y <= 390 Then Me.Visible = False 'Кнопка закрыть крест
End Sub


Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X >= 195 And X <= 3900 And Y >= 1290 And Y <= 1950 Then 'кнопка авторизации
        If Text1 <> "" Then
            Open (Path_File) For Output As #10
            Print #10, "Server=" & Trim(Text1)
            Close #10
            Me.Visible = False
        Else
            MsgBox "Поля не заполнены!"
        End If
    End If
End Sub

Private Sub Text1_GotFocus()
    Text1.SelStart = 0
    Text1.SelLength = Len(Text1)
End Sub

