VERSION 5.00
Begin VB.Form Fil_t 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Фильтр техника"
   ClientHeight    =   3030
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4560
   BeginProperty Font 
      Name            =   "Segoe UI"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Fil_t.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   2  'CenterScreen
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
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "Fil_t"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Me.Cls
    Me.Width = 273 * 15
    Me.Height = 267 * 15
    LoadImage App.Path & "\res\" & "Filter_t.png", Me.hdc, 0, 0
    Me.Refresh
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print "Фильтр по технике"
    Day1 = True
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 247 * 15 And Y <= 26 * 15 Then Me.Visible = False: Form1.Enabled = True: Form1.Show 'кнопка закрыть
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
End Sub

Public Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    '''Form_MouseUp 1, 13 * 15, 195 * 15
    If Button = 1 Then
        If X >= 13 * 15 And X <= 154 * 15 And Y >= 65 * 15 And Y <= 78 * 15 Then 'электротележка
            Ch_t(0) = Not Ch_t(0)
        ElseIf X >= 13 * 15 And X <= 154 * 15 And Y >= 93 * 15 And Y <= 106 * 15 Then 'электропогрузчик
            Ch_t(1) = Not Ch_t(1)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 65 * 15 And Y <= 78 * 15 Then 'штабелёр
            Ch_t(2) = Not Ch_t(2)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 93 * 15 And Y <= 106 * 15 Then 'ричтрак
            Ch_t(3) = Not Ch_t(3)
        ElseIf X >= 13 * 15 And X <= 154 * 15 And Y >= 121 * 15 And Y <= 134 * 15 Then 'Комплектовшик
            Ch_t(4) = Not Ch_t(4)
         ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 121 * 15 And Y <= 134 * 15 Then 'Узкопроходник
            Ch_t(5) = Not Ch_t(5)
        ElseIf X >= 13 * 15 And X <= 154 * 15 And Y >= 180 * 15 And Y <= 193 * 15 Then 'в работе
            Ch_t(6) = Not Ch_t(6)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 180 * 15 And Y <= 193 * 15 Then 'простой
            Ch_t(7) = Not Ch_t(7)
        ElseIf X >= 13 * 15 And X <= 125 * 15 And Y >= 214 * 15 And Y <= 255 * 15 Then 'применить
            With Form1
                .Find_T = ""
                .Sc_t.Top = 0
                id_prev = -1
                If Ch_t(0) = False And Ch_t(1) = False And Ch_t(2) = False And Ch_t(3) = False And Ch_t(4) = False And Ch_t(5) = False _
                    And Ch_t(6) = False And Ch_t(7) = False Then
                    For i = 0 To .Teh_index.UBound
                        Ar = Split(.List2.List(i), "|")
                        .Teh_index(Ar(1)).Visible = True
                        If id_prev > -1 Then .Teh_index(Ar(1)).Top = .Teh_index(id_prev).Top + .Teh_index(id_prev).Height + 6 * 15 Else .Teh_index(Ar(1)).Top = 0
                        id_prev = Ar(1)
                    Next
                    If id_prev > -1 Then .Frame_t.Height = .Teh_index(id_prev).Top + .Teh_index(id_prev).Height + 6 * 15: .Frame_t.Top = 0
                Else
                    For i = 0 To .Teh_index.UBound
                        .Teh_index(i).Visible = False
                    Next
                    For i = 0 To .Teh_index.UBound
                        Ar = Split(.List2.List(i), "|")
                        If Teh(Ar(1)).Type = 1 And Ch_t(0) Then .Teh_index(Ar(1)).Visible = True 'электротележка
                        If Teh(Ar(1)).Type = 3 And Ch_t(1) Then .Teh_index(Ar(1)).Visible = True '"Электропогрузчик"
                        If Teh(Ar(1)).Type = 2 And Ch_t(2) Then .Teh_index(Ar(1)).Visible = True '"Штабелёр"
                        If Teh(Ar(1)).Type = 4 And Ch_t(3) Then .Teh_index(Ar(1)).Visible = True '"Ричтрак"
                        If Teh(Ar(1)).Type = 5 And Ch_t(4) Then .Teh_index(Ar(1)).Visible = True '"Комплектовщик"
                        If Teh(Ar(1)).Type = 6 And Ch_t(5) Then .Teh_index(Ar(1)).Visible = True '"Узкопроходник"
                        If Ch_t(6) And .Teh_index(Ar(1)).Tag <> "" Then .Teh_index(Ar(1)).Visible = True '
                        If Ch_t(7) And .Teh_index(Ar(1)).Tag = "" Then .Teh_index(Ar(1)).Visible = True '
                        If .Teh_index(Ar(1)).Visible Then
                            If id_prev > -1 Then .Teh_index(Ar(1)).Top = .Teh_index(id_prev).Top + .Teh_index(id_prev).Height + 6 * 15 Else .Teh_index(Ar(1)).Top = 0
                            id_prev = Ar(1)
                        End If
                    Next
                    If id_prev > -1 Then .Frame_t.Height = .Teh_index(id_prev).Top + .Teh_index(id_prev).Height + 6 * 15: .Frame_t.Top = 0
                End If
            End With
            Me.Visible = False: Form1.Enabled = True: Form1.Show
        ElseIf X >= 137 * 15 And X <= 237 * 15 And Y >= 214 * 15 And Y <= 255 * 15 Then 'сброс
            For i = 0 To 7
                Ch_t(i) = False
            Next
        End If
        ch_t_sub
    End If
End Sub

Public Sub ch_t_sub()
    LoadImage App.Path & "\res\" & IIf(Ch_t(0), "check.png", "check_.png"), Me.hdc, 13, 65
    LoadImage App.Path & "\res\" & IIf(Ch_t(1), "check.png", "check_.png"), Me.hdc, 13, 93
    LoadImage App.Path & "\res\" & IIf(Ch_t(2), "check.png", "check_.png"), Me.hdc, 157, 65
    LoadImage App.Path & "\res\" & IIf(Ch_t(3), "check.png", "check_.png"), Me.hdc, 157, 93
    LoadImage App.Path & "\res\" & IIf(Ch_t(4), "check.png", "check_.png"), Me.hdc, 13, 121
    LoadImage App.Path & "\res\" & IIf(Ch_t(5), "check.png", "check_.png"), Me.hdc, 157, 121
    LoadImage App.Path & "\res\" & IIf(Ch_t(6), "check.png", "check_.png"), Me.hdc, 13, 180
    LoadImage App.Path & "\res\" & IIf(Ch_t(7), "check.png", "check_.png"), Me.hdc, 157, 180
    Me.Refresh
End Sub

