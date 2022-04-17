VERSION 5.00
Begin VB.Form Form3 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Редактор учётных записей"
   ClientHeight    =   3135
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   6510
   Icon            =   "^.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3135
   ScaleWidth      =   6510
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox List_p 
      Height          =   315
      Left            =   2760
      TabIndex        =   21
      Text            =   "Combo1"
      Top             =   1920
      Width           =   1215
   End
   Begin VB.PictureBox Pro_Win 
      Appearance      =   0  'Плоска
      BackColor       =   &H00808080&
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   960
      ScaleHeight     =   2865
      ScaleWidth      =   4905
      TabIndex        =   4
      Top             =   120
      Visible         =   0   'False
      Width           =   4935
      Begin VB.TextBox prof 
         Appearance      =   0  'Плоска
         BackColor       =   &H00686868&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   4
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   17
         Top             =   2160
         Width           =   3015
      End
      Begin VB.TextBox prof 
         Appearance      =   0  'Плоска
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   3
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   14
         Top             =   1440
         Width           =   3015
      End
      Begin VB.TextBox prof 
         Appearance      =   0  'Плоска
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   1800
         MaxLength       =   50
         PasswordChar    =   "*"
         TabIndex        =   13
         Top             =   1080
         Width           =   3015
      End
      Begin VB.TextBox prof 
         Appearance      =   0  'Плоска
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   1800
         MaxLength       =   50
         PasswordChar    =   "*"
         TabIndex        =   12
         Top             =   720
         Width           =   3015
      End
      Begin VB.TextBox prof 
         Appearance      =   0  'Плоска
         BackColor       =   &H00000080&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   0
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   11
         Top             =   360
         Width           =   3015
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Прозрачно
         Caption         =   "Сохранить"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   1
         Left            =   3120
         TabIndex        =   18
         Top             =   2520
         Width           =   900
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Пароль"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   6
         Left            =   120
         TabIndex        =   16
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Прозрачно
         Caption         =   "Отмена"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   0
         Left            =   4200
         TabIndex        =   15
         Top             =   2520
         Width           =   645
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Информация"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   5
         Left            =   120
         TabIndex        =   10
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Права доступа"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   4
         Left            =   120
         TabIndex        =   9
         Top             =   1800
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Фамилия И.О."
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   3
         Left            =   120
         TabIndex        =   8
         Top             =   1440
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Пароль"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   2
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Правая привязка
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Прозрачно
         Caption         =   "Логин"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Центровка
         BackColor       =   &H00C0C0C0&
         Caption         =   "Профайл"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   0
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   4935
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Редактировать"
      Height          =   375
      Index           =   2
      Left            =   3720
      TabIndex        =   3
      Top             =   2640
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Удалить"
      Height          =   375
      Index           =   1
      Left            =   2520
      TabIndex        =   2
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Добавить"
      Height          =   375
      Index           =   0
      Left            =   1320
      TabIndex        =   1
      Top             =   2640
      Width           =   1095
   End
   Begin VB.ListBox List 
      Appearance      =   0  'Плоска
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2310
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Закрыть"
      Height          =   375
      Index           =   3
      Left            =   5520
      TabIndex        =   19
      Top             =   2640
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Настройки"
      Height          =   375
      Index           =   4
      Left            =   120
      TabIndex        =   20
      Top             =   2640
      Width           =   1095
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click(Index As Integer)
    Select Case Index
        Case 0
            Pro_Win.Visible = True
            Label2(1) = "Добавить"
            For i = 0 To prof.UBound
                prof(i) = ""
            Next
            List_p.ListIndex = -1
        Case 1
            Form1.WinS.SendData "RemUser:" & Profile(List.ListIndex).Login
        Case 2
            If List.ListIndex > -1 Then
                Pro_Win.Visible = True
                Label2(1) = "Сохранить"
                prof(0) = Profile(List.ListIndex).Login
                prof(1) = Profile(List.ListIndex).Pass
                prof(2) = Profile(List.ListIndex).Pass
                prof(3) = Profile(List.ListIndex).FIO
                Select Case Profile(List.ListIndex).Prava
                    Case "Admin": List_p.ListIndex = 0
                    Case "Master": List_p.ListIndex = 1
                    Case "User": List_p.ListIndex = 2
                End Select
                If List_p.ListIndex > -1 Then List_p.BackColor = &H686868 Else List_p.BackColor = &H80&
                prof(4) = Profile(List.ListIndex).Prochee
            End If
        Case 3
            Form3.Visible = False
            Form1.Enabled = True: Form1.Show
            Command1(1).Enabled = False: Command1(2).Enabled = False
        Case 4
            Set_frm.Show
    End Select
End Sub

Private Sub Label1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Index = 2 Or Index = 6 Then prof(1).PasswordChar = "": prof(2).PasswordChar = ""
End Sub

Private Sub Label1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Index = 2 Or Index = 6 Then prof(1).PasswordChar = "*": prof(2).PasswordChar = "*"
End Sub

Private Sub Label2_Click(Index As Integer)
    Dim err_ As Boolean
    err_ = False
    If Index = 0 Then Pro_Win.Visible = False
    If Index = 1 Then
        For i = 0 To prof.UBound - 1
            If prof(i).BackColor = &H80& Then err_ = True
        Next
        If err_ Then
            MsgBox "Некоторые поля не заполнены или заполнены не корректно"
        Else
            If Label2(1) = "Сохранить" Then
                Form1.WinS.SendData "EditUser:" & Profile(List.ListIndex).Login & "|" & prof(0) & "|" & prof(1) & "|" & prof(3) & _
                            "|" & List_p.List(List_p.ListIndex) & "|" & prof(4)
                Pro_Win.Visible = False
            ElseIf Label2(1) = "Добавить" Then
                Form1.WinS.SendData "AddUser:" & prof(0) & "|" & prof(1) & "|" & prof(3) & _
                            "|" & List_p.List(List_p.ListIndex) & "|" & prof(4)
                Pro_Win.Visible = False
            End If
        End If
    End If
End Sub

Private Sub List_Click()
    If List.ListIndex < 1 Then Command1(1).Enabled = False: Command1(2).Enabled = False Else Command1(1).Enabled = True: Command1(2).Enabled = True
End Sub

Private Sub List_DblClick()
    Command1_Click 2
End Sub

Private Sub List_p_Click()
    If List_p.ListIndex > -1 Then List_p.BackColor = &H686868 Else List_p.BackColor = &H80&
End Sub

Private Sub prof_Change(Index As Integer)
    For i = 0 To UBound(Profile)
        If Profile(i).Login = prof(0) And i <> List.ListIndex Or prof(0) = "" Then prof(0).BackColor = &H80&: Exit For Else prof(0).BackColor = &H686868
    Next
    If prof(1) = prof(2) And prof(1) <> "" And prof(2) <> "" Then prof(1).BackColor = &H686868: prof(2).BackColor = &H686868 _
            Else prof(1).BackColor = &H80&: prof(2).BackColor = &H80&
    If prof(3) = "" Then prof(3).BackColor = &H80& Else prof(3).BackColor = &H686868
    Tx_reserv prof(Index)
End Sub
