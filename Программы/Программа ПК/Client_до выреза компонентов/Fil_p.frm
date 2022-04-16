VERSION 5.00
Begin VB.Form Fil_p 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Фильтр персонал"
   ClientHeight    =   1830
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2175
   Icon            =   "Fil_p.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1830
   ScaleWidth      =   2175
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      Height          =   195
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "Fil_p"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Me.Cls
    Me.Width = 273 * 15
    Me.Height = 248 * 15
    LoadImage App.Path & "\res\" & "filter_p.png", Me.hdc, 0, 0
    Me.Refresh
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print "Фильтр по персоналу"
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
        If X >= 13 * 15 And X <= 154 * 15 And Y >= 65 * 15 And Y <= 78 * 15 Then 'мастер
            Ch_p(0) = Not Ch_p(0)
        ElseIf X >= 13 * 15 And X <= 154 * 15 And Y >= 93 * 15 And Y <= 106 * 15 Then 'аккумуляторщик
            Ch_p(1) = Not Ch_p(1)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 65 * 15 And Y <= 78 * 15 Then 'оператор
            Ch_p(2) = Not Ch_p(2)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 93 * 15 And Y <= 106 * 15 Then 'механик
            Ch_p(3) = Not Ch_p(3)
        ElseIf X >= 13 * 15 And X <= 154 * 15 And Y >= 161 * 15 And Y <= 174 * 15 Then 'в работе
            Ch_p(4) = Not Ch_p(4)
        ElseIf X >= 157 * 15 And X <= 267 * 15 And Y >= 161 * 15 And Y <= 174 * 15 Then 'простой
            Ch_p(5) = Not Ch_p(5)
        ElseIf X >= 13 * 15 And X <= 125 * 15 And Y >= 195 * 15 And Y <= 235 * 15 Then 'применить
            With Form1
                .Find_P = ""
                id_prev = -1
                .Sc_p.Top = 0
                If Ch_p(0) = False And Ch_p(1) = False And Ch_p(2) = False And Ch_p(3) = False And Ch_p(4) = False And Ch_p(5) = False Then
                    For i = 0 To .Pers_index.UBound
                        Ar = Split(.List1.List(i), "|")
                        .Pers_index(Ar(1)).Visible = True
                        If id_prev > -1 Then .Pers_index(Ar(1)).Top = .Pers_index(id_prev).Top + .Pers_index(id_prev).Height + 6 * 15 Else .Pers_index(Ar(1)).Top = 0
                        id_prev = Ar(1)
                    Next
                    If id_prev > -1 Then .Frame_p.Height = .Pers_index(id_prev).Top + .Pers_index(id_prev).Height + 6 * 15: .Frame_p.Top = 0
                Else
                    For i = 0 To .Pers_index.UBound
                        .Pers_index(i).Visible = False
                    Next
                    For i = 0 To .Pers_index.UBound
                        Ar = Split(.List1.List(i), "|")
                        If Pers(Ar(1)).Position = 1 And Ch_p(0) Then .Pers_index(Ar(1)).Visible = True
                        If Pers(Ar(1)).Position = 4 And Ch_p(1) Then .Pers_index(Ar(1)).Visible = True
                        If Pers(Ar(1)).Position = 2 And Ch_p(2) Then .Pers_index(Ar(1)).Visible = True
                        If Pers(Ar(1)).Position = 3 And Ch_p(3) Then .Pers_index(Ar(1)).Visible = True
                        If Ch_p(4) And .Pers_index(Ar(1)).Tag <> "" Then .Pers_index(Ar(1)).Visible = True
                        If Ch_p(5) And .Pers_index(Ar(1)).Tag = "" Then .Pers_index(Ar(1)).Visible = True
                        If .Pers_index(Ar(1)).Visible Then
                            If id_prev > -1 Then .Pers_index(Ar(1)).Top = .Pers_index(id_prev).Top + .Pers_index(id_prev).Height + 6 * 15 Else .Pers_index(Ar(1)).Top = 0
                            id_prev = Ar(1)
                        End If
                    Next
                    If id_prev > -1 Then .Frame_p.Height = .Pers_index(id_prev).Top + .Pers_index(id_prev).Height + 6 * 15: .Frame_p.Top = 0
                End If
            End With
            Me.Visible = False: Form1.Enabled = True: Form1.Show
        ElseIf X >= 137 * 15 And X <= 237 * 15 And Y >= 195 * 15 And Y <= 235 * 15 Then 'сброс
            For i = 0 To 5
                Ch_p(i) = False
            Next
        End If
        ch_p_sub
    End If
End Sub

Public Sub ch_p_sub()
    LoadImage App.Path & "\res\" & IIf(Ch_p(0), "check.png", "check_.png"), Me.hdc, 13, 65
    LoadImage App.Path & "\res\" & IIf(Ch_p(1), "check.png", "check_.png"), Me.hdc, 13, 93
    LoadImage App.Path & "\res\" & IIf(Ch_p(2), "check.png", "check_.png"), Me.hdc, 157, 65
    LoadImage App.Path & "\res\" & IIf(Ch_p(3), "check.png", "check_.png"), Me.hdc, 157, 93
    LoadImage App.Path & "\res\" & IIf(Ch_p(4), "check.png", "check_.png"), Me.hdc, 13, 161
    LoadImage App.Path & "\res\" & IIf(Ch_p(5), "check.png", "check_.png"), Me.hdc, 157, 161
    Me.Refresh
End Sub
