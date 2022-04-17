VERSION 5.00
Begin VB.Form Form2 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00686868&
   BorderStyle     =   0  'None
   Caption         =   "Система бесключвого доступа"
   ClientHeight    =   2865
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4350
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   FillStyle       =   6  'Cross
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
   Icon            =   "Form2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2865
   ScaleWidth      =   4350
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Segoe UI Light"
         Size            =   14.25
         Charset         =   204
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00828894&
      Height          =   255
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   600
      MaxLength       =   50
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   1200
      Visible         =   0   'False
      Width           =   2670
   End
   Begin VB.TextBox Text 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Segoe UI Light"
         Size            =   14.25
         Charset         =   204
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00828894&
      Height          =   255
      Index           =   0
      Left            =   600
      MaxLength       =   50
      TabIndex        =   0
      Top             =   720
      Visible         =   0   'False
      Width           =   2670
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Button_Click
    If KeyAscii = 27 Then End
End Sub

Private Sub Form_Load()
    Me.Cls
    Me.Width = 273 * 15
    Me.Height = 199 * 15
    LoadImage App.Path & "\res\" & "auth_.png", Me.hdc, 0, 0
    Me.Refresh
    
    Text(0).Move 17 * 15, 49 * 15, 239 * 15
    Text(1).Move 17 * 15, 101 * 15, 239 * 15
End Sub

Private Sub Label1_Click()

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 3630 And Y <= 390 Then End 'Кнопка закрыть крест
    If X >= 3285 And X <= 3615 And Y <= 390 Then Set_frm.Show
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X >= 195 And X <= 3900 And Y >= 2175 And Y <= 2790 Then 'кнопка авторизации
        Button_Click
    End If
End Sub

Private Sub Text_GotFocus(Index As Integer)
    Text(Index).SelStart = 0
    Text(Index).SelLength = Len(Text(Index))
End Sub

Public Sub Button_Click()
    If Text(0).Visible Then
        Text(0).Enabled = False: Text(1).Enabled = False
        Form1.WinS.SendData "Login:" & Text(0) & "|" & Text(1)
    End If
End Sub

