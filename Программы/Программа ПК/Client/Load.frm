VERSION 5.00
Begin VB.Form Form5 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Инициализация..."
   ClientHeight    =   2295
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4560
   Icon            =   "Load.frx":0000
   LinkTopic       =   "Form5"
   ScaleHeight     =   2295
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "инициализация..."
      ForeColor       =   &H009C928C&
      Height          =   195
      Left            =   1380
      TabIndex        =   0
      Top             =   555
      Width           =   1305
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Me.Cls
    Me.Width = 273 * 15: Me.Height = 68 * 15
    Me.Move Screen.Width \ 2 - Me.Width \ 2, Screen.Height \ 2 - Me.Height \ 2
    LoadImage App.Path & "\Res\" & "Load.png", Me.hdc, 0, 0
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 3630 And Y <= 390 Then 'Кнопка закрыть крест
        If MsgBox("Выйти из приложения?", vbYesNo, "Выход") = 6 Then End
    End If
End Sub

