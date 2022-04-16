VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.ocx"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Система доступа"
   ClientHeight    =   9885
   ClientLeft      =   4050
   ClientTop       =   3645
   ClientWidth     =   20715
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Client.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9885
   ScaleWidth      =   20715
   Visible         =   0   'False
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   17520
      Picture         =   "Client.frx":0442
      ScaleHeight     =   300
      ScaleWidth      =   345
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   150
      Width           =   345
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00808080&
      Caption         =   "Command2"
      Height          =   375
      Left            =   9840
      TabIndex        =   26
      Top             =   0
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7335
      Left            =   2040
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   960
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.PictureBox Menu_Priv 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00F6F1EE&
      BorderStyle     =   0  'None
      FillColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Segoe UI Light"
         Size            =   8.25
         Charset         =   204
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2775
      Left            =   9480
      ScaleHeight     =   2775
      ScaleWidth      =   3375
      TabIndex        =   3
      Top             =   3600
      Visible         =   0   'False
      Width           =   3375
      Begin VB.Label Priv_lab 
         Appearance      =   0  'Flat
         BackColor       =   &H00ECFFF1&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   120
         Visible         =   0   'False
         Width           =   3135
      End
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2370
      Left            =   6720
      Sorted          =   -1  'True
      TabIndex        =   8
      Top             =   4800
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.PictureBox Pers_Win_s 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00F6F1EE&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   600
      ScaleHeight     =   975
      ScaleWidth      =   8175
      TabIndex        =   17
      Top             =   960
      Width           =   8175
      Begin VB.TextBox Find_P 
         Appearance      =   0  'Flat
         BackColor       =   &H00F5F5F5&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   11.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   6360
         TabIndex        =   24
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.PictureBox Teh_Win_s 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00F6F1EE&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   11760
      ScaleHeight     =   975
      ScaleWidth      =   8175
      TabIndex        =   16
      Top             =   600
      Width           =   8175
      Begin VB.TextBox Find_T 
         Appearance      =   0  'Flat
         BackColor       =   &H00F5F5F5&
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   11.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   4320
         TabIndex        =   25
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.PictureBox Таймеры 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   6975
      Left            =   0
      ScaleHeight     =   6945
      ScaleWidth      =   705
      TabIndex        =   2
      Top             =   1920
      Visible         =   0   'False
      Width           =   735
      Begin VB.Timer Timer12 
         Enabled         =   0   'False
         Interval        =   4000
         Left            =   120
         Top             =   5520
      End
      Begin VB.Timer Timer11 
         Enabled         =   0   'False
         Interval        =   5000
         Left            =   120
         Tag             =   "Обработка буфера привязок"
         Top             =   6000
      End
      Begin VB.Timer Timer10 
         Enabled         =   0   'False
         Interval        =   4000
         Left            =   120
         Tag             =   "Зависание передачи техники"
         Top             =   5040
      End
      Begin VB.Timer Timer9 
         Enabled         =   0   'False
         Interval        =   4000
         Left            =   120
         Tag             =   "Зависание передачи персонала"
         Top             =   4560
      End
      Begin VB.Timer Timer8 
         Enabled         =   0   'False
         Interval        =   200
         Left            =   120
         Tag             =   "Мигание при добавлении привязки"
         Top             =   3960
      End
      Begin VB.Timer Timer7 
         Enabled         =   0   'False
         Interval        =   200
         Left            =   120
         Tag             =   "Задержка на посылку команды"
         Top             =   3480
      End
      Begin VB.Timer Timer6 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   120
         Tag             =   "Скролл на персонале"
         Top             =   3000
      End
      Begin VB.Timer Timer5 
         Interval        =   500
         Left            =   120
         Tag             =   "Часы в шапке"
         Top             =   2520
      End
      Begin VB.Timer Timer4 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   120
         Tag             =   "Скролл на технике"
         Top             =   2040
      End
      Begin VB.Timer Timer3 
         Enabled         =   0   'False
         Interval        =   500
         Left            =   120
         Tag             =   "Проверка подключения"
         Top             =   1560
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   30
         Left            =   120
         Tag             =   "Перетаскивание техники"
         Top             =   1080
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   30
         Left            =   120
         Tag             =   "Перетаскивание персонала"
         Top             =   600
      End
      Begin MSWinsockLib.Winsock WinS 
         Left            =   120
         Top             =   120
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
   End
   Begin VB.PictureBox Info_sclad 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   120
      ScaleHeight     =   375
      ScaleWidth      =   2700
      TabIndex        =   13
      Top             =   120
      Width           =   2700
   End
   Begin VB.ListBox List2 
      Appearance      =   0  'Flat
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2370
      Left            =   15120
      Sorted          =   -1  'True
      TabIndex        =   9
      Top             =   5760
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.PictureBox Pers_win 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00F6F1EE&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7455
      Left            =   3720
      ScaleHeight     =   7455
      ScaleWidth      =   7935
      TabIndex        =   0
      Top             =   2160
      Width           =   7935
      Begin VB.PictureBox Sc_p 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00434AD2&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1125
         Left            =   7440
         Picture         =   "Client.frx":0A85
         ScaleHeight     =   1125
         ScaleWidth      =   300
         TabIndex        =   20
         Top             =   0
         Width           =   300
      End
      Begin VB.PictureBox Frame_p 
         Appearance      =   0  'Flat
         BackColor       =   &H00F6F1EE&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2175
         Left            =   120
         ScaleHeight     =   2175
         ScaleWidth      =   7695
         TabIndex        =   18
         Top             =   0
         Visible         =   0   'False
         Width           =   7695
         Begin VB.PictureBox Pers_index 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
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
            ForeColor       =   &H80000008&
            Height          =   495
            Index           =   0
            Left            =   0
            ScaleHeight     =   495
            ScaleWidth      =   7215
            TabIndex        =   19
            Top             =   0
            Visible         =   0   'False
            Width           =   7215
         End
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Загрузка списка персонала..."
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000080FF&
         Height          =   315
         Index           =   0
         Left            =   360
         TabIndex        =   22
         Top             =   240
         Width           =   3480
      End
   End
   Begin VB.PictureBox Teh_win 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00F6F1EE&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7455
      Left            =   12120
      ScaleHeight     =   7455
      ScaleWidth      =   8340
      TabIndex        =   1
      Top             =   1920
      Width           =   8340
      Begin VB.PictureBox Sc_t 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00434AD2&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1125
         Left            =   7920
         Picture         =   "Client.frx":2FA2
         ScaleHeight     =   1125
         ScaleWidth      =   300
         TabIndex        =   12
         Top             =   0
         Width           =   300
      End
      Begin VB.PictureBox Frame_t 
         Appearance      =   0  'Flat
         BackColor       =   &H00F6F1EE&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   2175
         Left            =   120
         ScaleHeight     =   2175
         ScaleWidth      =   7695
         TabIndex        =   10
         Top             =   0
         Visible         =   0   'False
         Width           =   7695
         Begin VB.PictureBox Teh_index 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
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
            ForeColor       =   &H80000008&
            Height          =   495
            Index           =   0
            Left            =   0
            ScaleHeight     =   495
            ScaleWidth      =   7695
            TabIndex        =   11
            Top             =   0
            Visible         =   0   'False
            Width           =   7695
         End
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Загрузка списка техники..."
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000080FF&
         Height          =   315
         Index           =   1
         Left            =   360
         TabIndex        =   23
         Top             =   240
         Width           =   3210
      End
   End
   Begin VB.PictureBox Online 
      Appearance      =   0  'Flat
      BackColor       =   &H000000FF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   840
      ScaleHeight     =   225
      ScaleWidth      =   225
      TabIndex        =   6
      Top             =   5880
      Width           =   255
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label7"
      Height          =   300
      Left            =   5040
      TabIndex        =   21
      Top             =   0
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Data"
      Height          =   300
      Left            =   8640
      TabIndex        =   15
      Top             =   120
      Width           =   525
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "00:00:00"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   24
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   6480
      TabIndex        =   14
      Top             =   0
      Width           =   1725
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Нет подключения к серверу"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1200
      TabIndex        =   7
      Top             =   5880
      Width           =   2820
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Function WD(day) As String
    xday = Weekday(day, vbMonday)
End Function

Private Sub Command2_Click()
    MsgBox UBound(Priv) + 1
End Sub

Private Sub Find_P_Change()
    id_prev = -1
    If Find_P = "" Then
        For i = 0 To Pers_index.UBound
            Ar = Split(List1.List(i), "|")
            Pers_index(Ar(1)).Visible = True
            If id_prev > -1 Then Pers_index(Ar(1)).Top = Pers_index(id_prev).Top + Pers_index(id_prev).Height + 6 * 15 Else Pers_index(Ar(1)).Top = 0
            id_prev = Ar(1)
        Next
        If id_prev > -1 Then Frame_p.Height = Pers_index(id_prev).Top + Pers_index(id_prev).Height + 6 * 15: Frame_p.Top = 0
    Else
        For i = 0 To Pers_index.UBound
            Ar = Split(List1.List(i), "|")
            If InStr(1, Pers(Ar(1)).Surname, Find_P, vbTextCompare) Or InStr(1, Pers(Ar(1)).Name, Find_P, vbTextCompare) Or _
                InStr(1, Pers(Ar(1)).Lastname, Find_P, vbTextCompare) Or InStr(1, Pers(Ar(1)).RFID, Find_P, vbTextCompare) Then
                Pers_index(Ar(1)).Visible = True
            Else
                Pers_index(Ar(1)).Visible = False
            End If
            If Pers_index(Ar(1)).Visible Then
                If id_prev > -1 Then Pers_index(Ar(1)).Top = Pers_index(id_prev).Top + Pers_index(id_prev).Height + 6 * 15 Else Pers_index(Ar(1)).Top = 0
                id_prev = Ar(1)
            End If
        Next
        If id_prev > -1 Then Frame_p.Height = Pers_index(id_prev).Top + Pers_index(id_prev).Height + 6 * 15: Frame_p.Top = 0
    End If
End Sub

Private Sub Find_T_Change()
    id_prev = -1
    If Find_T = "" Then
        For i = 0 To Teh_index.UBound
            Ar = Split(List2.List(i), "|")
            Teh_index(Ar(1)).Visible = True
            If id_prev > -1 Then Teh_index(Ar(1)).Top = Teh_index(id_prev).Top + Teh_index(id_prev).Height + 6 * 15 Else Teh_index(Ar(1)).Top = 0
            id_prev = Ar(1)
        Next
        If id_prev > -1 Then Frame_t.Height = Teh_index(id_prev).Top + Teh_index(id_prev).Height + 6 * 15: Frame_t.Top = 0
    Else
        For i = 0 To Teh_index.UBound
            Ar = Split(List2.List(i), "|")
            If InStr(1, Teh(Ar(1)).Gnomer, Find_T, vbTextCompare) Or InStr(1, Teh(Ar(1)).Vp, Find_T, vbTextCompare) Then
                Teh_index(Ar(1)).Visible = True
            Else
                Teh_index(Ar(1)).Visible = False
            End If
            If Teh_index(Ar(1)).Visible Then
                If id_prev > -1 Then Teh_index(Ar(1)).Top = Teh_index(id_prev).Top + Teh_index(id_prev).Height + 6 * 15 Else Teh_index(Ar(1)).Top = 0
                id_prev = Ar(1)
            End If
        Next
        If id_prev > -1 Then Frame_t.Height = Teh_index(id_prev).Top + Teh_index(id_prev).Height + 6 * 15: Frame_t.Top = 0
    End If
End Sub

Private Sub Form_Click()
    Menu_Priv.Visible = False
End Sub

Private Sub Form_Load()
    Find_P.Font.Italic = True: Find_P.ForeColor = &H808080
    Find_T.Font.Italic = True: Find_T.ForeColor = &H808080
    Label5 = Time
    Path_File = App.Path & "\Server.ini" 'путь к файлу настроек
    Form3.List_p.AddItem "Admin": Form3.List_p.AddItem "Master": Form3.List_p.AddItem "User"
    Form2.Visible = True
    ReDim Pers(0): ReDim Teh(0): ReDim Priv(0) 'начальная инициализация массивов техники и персонала
    ReDim Exc(0)
    ReDim Buffer_Priv(0) 'буфер для отправки операций с привязками на сервер
    ReDim Note_p(200)
    ReDim Note_t(200)
    Online.BackColor = QBColor(12)
    Timer3.Enabled = True
    xs = 250 * 15: ys = 30 * 15
    Teh_init
    Init_Paint
    If Is_Comp = False Then
        WheelHook (Me.hWnd)
    Else
        User = "admin": Form2.Text(0) = User 'закоментировать или раскоментировать для автоматической авторизации
        Pass = "admin": Form2.Text(1) = Pass 'закоментировать или раскоментировать для автоматической авторизации
    End If
End Sub

Public Sub Init_Paint()
    Ef_porog(0) = 25: Ef_porog(1) = 40: Ef_porog(2) = 70
    Ef_color(0) = &H8087FC: Ef_color(1) = &H434AD2: Ef_color(2) = &H82A6FF: Ef_color(3) = &H4B7EFD: Ef_color(4) = &H9CDEC3: Ef_color(5) = &H1FA06B:
    'Me.Move 0, 0, Screen.Width - 30 * 15, Screen.Height - 30 * 15
    Win_start_pos
    LoadImage App.Path & "\res\" & "logo_s.png", Me.hdc, 0, 3 'логотип градиента шапка
    Me.FontName = "Segoe UI": Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 37 * 15: Me.CurrentY = 15 * 15
    Me.Print "Контроль персонала и техники склада Major П. Слобода"
    LoadImage App.Path & "\res\" & "exit_s.png", Me.hdc, Me.Width \ 15 - 30, 12 'закрыть шапка
    LoadImage App.Path & "\res\" & "min_s.png", Me.hdc, Me.Width \ 15 - 70, 12 'свернуть шапка
    LoadImage App.Path & "\res\" & "menu_s.png", Me.hdc, Me.Width \ 15 - 110, 12 'меню шапка
    LoadImage App.Path & "\res\" & "noudar_s.png", Me.hdc, Me.Width \ 15 - 160, 9 'удар шапка
    'LoadImage App.Path & "\res\" & "Ref_list.png", Me.hdc, Me.Width \ 15 - 200, 11 'обновить списки персонала и техники
    Label5.FontName = "Segoe UI": Label5.FontSize = 15: Label5.ForeColor = &H828894: Label5.FontBold = False
    Label6.FontName = "Segoe UI": Label6.FontSize = 8: Label6.ForeColor = &H828894: Label6.FontBold = False
    Label5 = Format(Time, "hh" & ":" & "mm"): Label6 = Date
    tmp = Label5.Width + 50 * 15 + Info_sclad.Width + 4 * 15 + Label6.Width
    Label5.Move Me.Width \ 2 - tmp \ 2 + 130 * 15, 13 * 15 'координаты часов шапка
    Label6.Move Label5.Width + Label5.Left + 4 * 15, 25 * 15 'координаты даты шапка
    'LoadImage App.Path & "\res\" & "xls_s.png", Me.hdc, (Label6.Left + Label6.Width) \ 15 + 13, 12 'xls шапка
    Info_sclad.Move Label6.Left + Label6.Width + 13 * 15 + 50 * 15, 12 * 15 'координаты пульса
    
    Teh_Win_s.Width = Me.Width \ 2 - 9 * 15
    Teh_Win_s.Move Me.Width - Teh_Win_s.Width - 6 * 15, 48 * 15, Teh_Win_s.Width, 50 * 15
    Teh_win.Move Teh_Win_s.Left, Teh_Win_s.Top + Teh_Win_s.Height, Teh_Win_s.Width, 0
    Teh_win.Height = Me.Height - Teh_win.Top - 30 * 15
    Sc_t.Move Teh_win.Width - Sc_t.Width - 6 * 15, 0
    Teh_Win_s.BackColor = &HF6F1EE
    LoadImage App.Path & "\res\" & "frame_s_tp.png", Teh_Win_s.hdc, 0, Teh_Win_s.Height \ 15 - 5, 1000 'фрейм шапки на технике
    Teh_Win_s.FontName = "Segoe UI": Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H948882
    Teh_Win_s.CurrentX = 5 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print "Техника"
    Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H948882
    Teh_Win_s.CurrentX = 5 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print "Техника"
    Ef_paint Teh_Win_s, 400 * 15, Teh_Win_s.Height - 570 - 6 * 15, 40  'прорисовка эфективности в шапке техники
'    Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H948882: Teh_Win_s.CurrentX = 110 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print "18"
'    Teh_Win_s.FontSize = 10: Teh_Win_s.ForeColor = &H948882: Teh_Win_s.CurrentX = 135 * 15: Teh_Win_s.CurrentY = 16 * 15: Teh_Win_s.Print "Выдано в смену"
'    Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H434AD2: Teh_Win_s.CurrentX = 250 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print "10"
'    Teh_Win_s.FontSize = 10: Teh_Win_s.CurrentX = 275 * 15: Teh_Win_s.CurrentY = 16 * 15: Teh_Win_s.Print "Не выдано в смену"
    LoadImage App.Path & "\res\" & "add.png", Teh_Win_s.hdc, Teh_Win_s.Width / 15 - 31, 14 'добавить в шапке на технике
    LoadImage App.Path & "\res\" & "filter.png", Teh_Win_s.hdc, Teh_Win_s.Width / 15 - 31 - 45, 14 'фильтр в шапке на технике
    Find_T.Move Teh_Win_s.Width - 85 * 15 - Find_T.Width, 12 * 15, Find_T.Width - 5 * 15  ', Find_t.Height - 5 * 15
    Find_T.FontSize = 12
    
    Pers_Win_s.Width = Me.Width \ 2 - 9 * 15
    Pers_Win_s.Move 6 * 15, 48 * 15, Pers_Win_s.Width, 50 * 15
    Pers_win.Move Pers_Win_s.Left, Pers_Win_s.Top + Pers_Win_s.Height, Pers_Win_s.Width, 0
    Pers_win.Height = Me.Height - Pers_win.Top - 30 * 15
    Sc_p.Move Pers_win.Width - Sc_p.Width - 6 * 15, 0
    Pers_Win_s.BackColor = &HF6F1EE
    LoadImage App.Path & "\res\" & "frame_s_tp.png", Pers_Win_s.hdc, 0, Pers_Win_s.Height \ 15 - 5, 1000 'фрейм шапки на персонала
    Pers_Win_s.FontName = "Segoe UI": Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H948882
    Pers_Win_s.CurrentX = 5 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print "Персонал"
    Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H948882
    Pers_Win_s.CurrentX = 5 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print "Персонал"
    Ef_paint Pers_Win_s, 400 * 15, Pers_Win_s.Height - 570 - 6 * 15, 90 'прорисовка эфективности в шапке персонала
'    Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H948882: Pers_Win_s.CurrentX = 110 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print "18"
'    Pers_Win_s.FontSize = 10: Pers_Win_s.ForeColor = &H948882: Pers_Win_s.CurrentX = 135 * 15: Pers_Win_s.CurrentY = 16 * 15: Pers_Win_s.Print "Вышло в смену"
'    Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H434AD2: Pers_Win_s.CurrentX = 250 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print "10"
'    Pers_Win_s.FontSize = 10: Pers_Win_s.CurrentX = 275 * 15: Pers_Win_s.CurrentY = 16 * 15: Pers_Win_s.Print "Не вышло в смену"
    LoadImage App.Path & "\res\" & "add.png", Pers_Win_s.hdc, Pers_Win_s.Width / 15 - 31, 14 'добавить в шапке на технике
    LoadImage App.Path & "\res\" & "filter.png", Pers_Win_s.hdc, Pers_Win_s.Width / 15 - 31 - 45, 14  'фильтр в шапке на персонала
    Find_P.Move Pers_Win_s.Width - 85 * 15 - Find_P.Width, 12 * 15, Find_P.Width - 5 * 15  ', Find_P.Height - 5 * 15
    Find_P.FontSize = 12
    'Find_P.Left = Pers_Win_s.Width - 31 * 15 - 45 * 15 - Find_P.Width
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Label7 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > Me.Width - 30 * 15 And Y < 12 * 15 + 18 * 15 Then 'кнопка выхода в шапке
        'Call WheelUnHook(Me.hWnd)
        If Buffer_Priv(0) <> "" Then
            If MsgBox("Идёт обновление списка разрешений!" & vbNewLine & "Выход в данный момент может привести к потере данных!", vbYesNo) Then End
        Else
            If MsgBox("Выйти из приложения?", vbYesNo, "Выход") = 6 Then End
        End If
    ElseIf X > Me.Width - 80 * 15 And X < Me.Width - 40 * 15 And Y > 9 * 15 And Y < 9 * 15 + 20 * 15 Then
        Me.WindowState = 1
    ElseIf X > Me.Width - 160 * 15 And X < Me.Width - 160 * 15 + 29 * 15 And Y > 9 * 15 And Y < 9 * 15 + 20 * 15 Then 'кнопка ударов в шапке
        Reg_stat = "Uu"
        Me.Line (Me.Width - 160 * 15, 9 * 15)-(Me.Width - 130 * 15, 30 * 15), QBColor(15), BF
        LoadImage App.Path & "\res\" & "Noudar_s.png", Me.hdc, Me.Width \ 15 - 160, 9 'удар шапка
        Call SendMessage(Pers_win.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        Call SendMessage(Teh_win.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        If Udar Then WinS.SendData "!Stat>U#u#0#0"
        Udar = False
        '''''
        Jurnal.List.Clear
        Jurnal.Show
        Jurnal.Line (30 * 15, 7 * 15)-(700 * 15, 25 * 15), QBColor(15), BF
        Jurnal.FontSize = 10: Jurnal.ForeColor = &H828894: Jurnal.CurrentX = 30 * 15: Jurnal.CurrentY = 7 * 15
        Jurnal.Print "Журнал по ударам"
        Jurnal.Refresh
        Form1.Enabled = False
        Jurnal.time_0.ListIndex = 5: Jurnal.time_1.ListIndex = 23: Jurnal.Calend.Tag = "0": Jurnal.Calend_DateClick Date
        Jurnal.Calend.Tag = "1": Jurnal.Calend_DateClick Date: Jurnal.Calend.Tag = "2": Jurnal.Calend_DateClick Date
    'ElseIf X > Me.Width - 200 * 15 And X < Me.Width - 175 * 15 And Y > 9 * 15 And Y < 9 * 15 + 20 * 15 Then  'кнопка обновить списки в шапке
    '    WinS.SendData "Spisok_P": Frame_p.Visible = False: Frame_t.Visible = False: Me.Enabled = False
    '    Form5.Label1 = "инициализация...": Form5.Show
    ElseIf X > Me.Width - 1725 And X < Me.Width - 1290 And Y > 9 * 15 And Y < 9 * 15 + 20 * 15 And Dostup = 1 Then 'кнопка меню в шапке
'        User = "": Pass = ""
'        Form2.Text(0) = "": Form2.Text(1) = ""
'        Form3.Visible = False: Me.Visible = False: Form2.Visible = True
'        Form2.Text(0).Enabled = True: Form2.Text(1).Enabled = True
        Form3.Visible = True
        Form3.List_p.Clear
        Form3.List_p.AddItem "Admin": Form3.List_p.AddItem "Master": Form3.List_p.AddItem "User"
        WinS.SendData "UserList"
    End If
    
End Sub

Private Sub Karta_pers_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call ReleaseCapture
    Call SendMessage(Karta_pers.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
End Sub

Private Sub Karta_teh_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call ReleaseCapture
    Call SendMessage(Karta_teh.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
End Sub

Private Sub List_p_Change()
    List_p.BackColor = &HFFFFFF
    pos_inc = 0
    If Karta_pers.Visible Then
        For i = 0 To UBound(Pers)
            If Karta_pers.Tag <> "" Then
                If Karta_pers.Tag <> i And Pers(Karta_pers.Tag).Position = 1 Then pos_inc = pos_inc + 1
            Else
            End If
        Next
        MsgBox pos_inc
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Is_Comp = False Then Call WheelUnHook(Me.hWnd)
End Sub

Private Sub List1_Click()
    MsgBox List1.List(List1.ListIndex) & " " & List1.ListIndex
End Sub

Private Sub Menu_Priv_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And X < 2940 And (Shift And 2) Then
        Call ReleaseCapture
        Call SendMessage(Menu_Priv.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub

Private Sub Menu_Priv_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    For i = 0 To UBound(Priv_tmp)
        If Y >= i * 36 * 15 + 13 * 15 And Y <= i * 36 * 15 + 23 * 15 And X >= 2940 Then 'удаление привязки
            If Shift And 1 Then qw = 6 Else qw = MsgBox("Вы действительно хотите удалить связь?", vbQuestion Or vbYesNo, "Удаление связи!") '6=Да, 7=Нет
            If qw = 6 Then
                Dim Uid_tt, Uid_pp
                If Priv_tmp(0) > 0 And Online.BackColor = QBColor(10) Then tyu = "@Del_Priv@" & Priv_lab(i).Tag: WinS.SendData tyu: Buff_Priv tyu
                tmp_uid = Split(Priv_lab(i).Tag, "|")
                If UBound(tmp_uid) > 0 Then
                    Uid_tt = tmp_uid(0): Uid_pp = tmp_uid(1)
                    For iuid = 0 To UBound(Priv)
                        If Priv(iuid).UID_Teh = Uid_tt And Priv(iuid).UID_Pers = Uid_pp Then
                            If iuid < UBound(Priv) Then
                                For hhhh = iuid To UBound(Priv) - 1
                                    Priv(hhhh).UID_Pers = Priv(hhhh + 1).UID_Pers
                                    Priv(hhhh).UID_Teh = Priv(hhhh + 1).UID_Teh
                                Next
                            End If
                            ReDim Preserve Priv(UBound(Priv) - 1)
                            'X >= Teh_index(Index).Width - 211 * 15 And X <= Teh_index(Index).Width - 36 * 15 And Y >= 12 * 15 And Y <= 70 * 15
                            If Priv_type = "T" Then
                                Teh_index_MouseDown Priv_index, 1, 0, Teh_index(index).Width - 100 * 15, 50 * 15
                            ElseIf Priv_type = "P" Then
                                Pers_index_MouseDown Priv_index, 1, 0, Pers_index(index).Width - 100 * 15, 50 * 15
                            End If
                            Dopusk
                            Exit For
                        End If
                    Next
                End If
            End If
            Exit For
        End If
    Next
End Sub

Private Sub Pers_index_DblClick(index As Integer)
    If (Dostup = 1 Or Dostup = 2) Then
        Karta_p.Visible = False
        Pers(index).Ism_Kard = False
        Karta_p.Tag = index
        Karta_p.Form_Load
        Karta_p.Pol_pers(0) = Pers(index).Surname
        Karta_p.Pol_pers(1) = Pers(index).Name
        Karta_p.Pol_pers(2) = Pers(index).Lastname
        Karta_p.List_p.ListIndex = -1
        Karta_p.List_p.ListIndex = Pers(index).Position - 1
        If i = Karta_p.List_p.ListCount Then Karta_p.List_p.ListIndex = Karta_p.List_p.ListCount - 1
        Karta_p.Pol_pers(3) = Pers(index).RFID
        'Karta_p.List_BCp.ListIndex = -1: Karta_p.List_BCp.ListIndex = Pers(Index).Prava - 1
        Karta_p.Pol_pers(4) = Pers(index).Prava
        Karta_p.List_Sex.ListIndex = -1: Karta_p.List_Sex.ListIndex = Pers(index).Sex - 1
        If Pers(index).Date <> "" Then Karta_p.Calend_DateClick Pers(index).Date
        Date_r = Pers(index).Date
        Karta_p.List_Oc.ListIndex = -1: Karta_p.List_Oc.ListIndex = Pers(index).Ocenka - 1
        Me.Enabled = False: Karta_p.Show: Karta_p.Refresh
        For i = 0 To Karta_p.Pol_pers.UBound
            Karta_p.Pol_pers(i).BackColor = &HFFFFFF
        Next
        For i = 0 To UBound(Pers)
            Pers(i).Ism_Kard = False
        Next
    End If
End Sub

Private Sub Pers_index_MouseMove(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label7 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
    'Label7 = Index & "  " & Pers(Index).UID
    If Online.BackColor = QBColor(10) And False Then
        With Form1
            If Shift = 1 Then
                Seach_Priv_Pers index
                    For i = 0 To .Teh_index.UBound
                        For ii = 0 To UBound(Priv_tmp)
                            If Teh(i).UID = Priv_tmp(ii) Then Exit For
                        Next
                        If ii = UBound(Priv_tmp) + 1 Then
                            .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width, .Teh_index(i).Height), &HCFCEFF, BF
                            .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width - 20 * 15, .Teh_index(i).Height)
                        Else
                            .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width, .Teh_index(i).Height), IIf(ii = UBound(Priv_tmp) + 1, QBColor(2), QBColor(12)), BF
                            .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width - 20 * 15, .Teh_index(i).Height)
                        End If
                    Next
            Else
                For i = 0 To Teh_index.UBound
                    .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width, .Teh_index(i).Height), &HCFCEFF, BF
                    .Teh_index(i).Line (.Teh_index(i).Width - 20 * 15, 0)-(.Teh_index(i).Width - 20 * 15, .Teh_index(i).Height)
                Next
            End If
        End With
    End If
End Sub

Private Sub Pers_win_Click()
    Menu_Priv.Visible = False
End Sub

Private Sub Pers_Win_s_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > Pers_Win_s.Width - 31 * 15 - 13 * 15 And (Dostup = 1 Or Dostup = 2) Then 'добавить сотрудника
        Karta_p.Tag = ""
        Karta_p.Form_Load
        Karta_p.Show
        Me.Enabled = False
        For i = 0 To Karta_p.Pol_pers.UBound
            Karta_p.Pol_pers(i) = ""
        Next
        Karta_p.List_p.ListIndex = -1
        'Karta_p.List_BCp.ListIndex = 2
        Karta_p.List_Oc.ListIndex = -1
        Karta_p.List_Sex.ListIndex = -1
    ElseIf X > Pers_Win_s.Width - 31 * 15 - 45 * 15 - 13 * 15 And X < Pers_Win_s.Width - 31 * 15 - 13 * 15 Then 'фильтр
        Fil_p.Show: Me.Enabled = False
        Fil_p.ch_p_sub
    End If
End Sub

Private Sub Picture1_Click()
    WinS.SendData "Refresh"
End Sub

Private Sub Priv_lab_DblClick(index As Integer)
    'If Priv_tmp(0) > 0 And Online.BackColor = QBColor(10) Then WinS.SendData "@Del_Priv@" & Priv_lab(Index).Tag
End Sub

Private Sub Sc_p_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Menu_Priv.Visible = False
    If Frame_p.Height > Pers_win.Height Then
        cur_d.X = X: cur_d.Y = Y
        Timer6.Enabled = True
    End If
End Sub

Private Sub Sc_p_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    cur_d.X = 0: cur_d.Y = 0
    Timer6.Enabled = False
End Sub

Private Sub Sc_t_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Menu_Priv.Visible = False
    If Frame_t.Height > Teh_win.Height Then
        cur_d.X = X: cur_d.Y = Y
        Timer4.Enabled = True
    End If
End Sub

Private Sub Sc_t_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    cur_d.X = 0: cur_d.Y = 0
    Timer4.Enabled = False
End Sub

Private Sub Teh_index_DblClick(index As Integer)
    If (Dostup = 1 Or Dostup = 2) Then
        Karta_t.Visible = False
        Teh(index).Ism_Kard = False
        Karta_t.Tag = index
        Karta_t.Form_Load
        Karta_t.Pol_teh(1) = Teh(index).ID
        Karta_t.Pol_teh(2) = Teh(index).Gp
        Karta_t.Pol_teh(3) = Teh(index).Vp
        Karta_t.Calend_DateClick Teh(index).God
        Karta_t.Pol_teh(4) = Teh(index).Gnomer
        Karta_t.List_t.ListIndex = -1: Karta_t.List_b.ListIndex = -1: Karta_t.List_n.ListIndex = -1: Karta_t.List_God.ListIndex = -1: Karta_t.List_Oc.ListIndex = -1
        Karta_t.List_t.ListIndex = Teh(index).Type - 1
        Karta_t.List_b.ListIndex = Teh(index).Brend - 1
        Karta_t.List_n.ListIndex = Teh(index).Model - 1
        Karta_t.List_God.ListIndex = Teh(index).God - 1
        Date_r = Teh(index).God - 1
        Karta_t.List_Oc.ListIndex = val(Teh(index).Ocenka - 1)
        Me.Enabled = False: Karta_t.Show: Karta_t.Refresh
        For i = 0 To UBound(Teh)
            Teh(i).Ism_Kard = False
        Next
        set_pos_scroll 0, Teh(index).Porog_Z
        set_pos_scroll 1, Teh(index).Porog_X
    End If
End Sub

Private Sub Pers_index_MouseDown(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Menu_Priv.Visible = False
    If Button = 1 Then 'нажатие левой кнопки мыши
        If X >= Pers_index(index).Width - 35 * 15 And X <= Pers_index(index).Width - 13 * 15 Then 'перетаскивание левой кнопкой мыши
            If Dostup = 1 Or Dostup = 2 Then Drug_Pers index, X, Y
        ElseIf X >= 1380 And X <= 4215 And Y >= 690 Then 'журнал статистики
            Reg_stat = "P" & Pers(index).UID
            Jurnal.List.Clear
            Jurnal.Show
            Jurnal.Line (30 * 15, 7 * 15)-(700 * 15, 25 * 15), QBColor(15), BF
            Jurnal.FontSize = 10: Jurnal.ForeColor = &H828894: Jurnal.CurrentX = 30 * 15: Jurnal.CurrentY = 7 * 15
            Jurnal.Print "Журнал по оператору " & Pers(index).Surname & " " & Pers(index).Name
            Form1.Enabled = False
            Jurnal.time_0.ListIndex = 5: Jurnal.time_1.ListIndex = 23
            Jurnal.time_0.ListIndex = 5: Jurnal.time_1.ListIndex = 23: Jurnal.Calend.Tag = "0": Jurnal.Calend_DateClick Date
            Jurnal.Calend.Tag = "1": Jurnal.Calend_DateClick Date: Jurnal.Calend.Tag = "2": Jurnal.Calend_DateClick Date
        ElseIf X >= Pers_index(index).Width - 211 * 15 And X <= Pers_index(index).Width - 36 * 15 And Y >= 12 * 15 And Y <= 70 * 15 And _
        (Dostup = 1 Or Dostup = 2) Then 'меню привязок
            
            If Priv_lab.UBound > 0 Then 'удаление старых привязок
                For i = 1 To Priv_lab.UBound
                    Unload Priv_lab(i)
                Next
            End If
            Priv_lab(0).Tag = ""
            Priv_lab(0).BorderStyle = 0
            Seach_Priv_Pers index
            Menu_Priv.Cls
            Priv_index = index
            Priv_type = "P"
            If UBound(Priv_tmp) = 0 And Priv_tmp(0) = 0 Then
                Priv_lab(0) = "Нет привязок"
            Else
                Menu_Priv.Height = 37 * 15 * (UBound(Priv_tmp) + 1) + 6 * 15
                Incr_priv = 0
                For i = 0 To UBound(Priv_tmp)
                    
                    For ii = 0 To UBound(Teh)
                        If Teh(ii).UID = Priv_tmp(i) Then Exit For
                    Next
                    If ii < UBound(Teh) + 1 Then
                        If Incr_priv > 0 Then
                            Load Priv_lab(Incr_priv): Priv_lab(Incr_priv).Move Priv_lab(Incr_priv - 1).Left, Priv_lab(Incr_priv - 1).Top + Priv_lab(Incr_priv - 1).Height + 3 * 15
                            'Priv_lab(Incr_priv) = Teh(ii).UID & " [" & Teh(ii).Type & " #" & Teh(ii).ID & "]": 'Priv_lab(Incr_priv).Visible = True
                        Else
                            'Priv_lab(0) = Teh(ii).UID & " [" & Teh(ii).Type & " #" & Teh(ii).ID & "]": 'Priv_lab(0).Visible = True
                        End If
                        LoadImage Get_Icon(Teh(ii).Brend, Teh(ii).Type, Teh(ii).Model), Menu_Priv.hdc, 7, 6 * (Incr_priv * 6) + 6, 32, 32
                        Menu_Priv.Line (7 * 15, (6 * (Incr_priv * 6) + 6) * 15)-(7 * 15 + 32 * 15, (6 * (Incr_priv * 6) + 6) * 15 + 32 * 15), QBColor(7), B
                        Karta_t.List_t.ListIndex = -1: Karta_t.List_t.ListIndex = Teh(ii).Type - 1
                        Karta_t.List_b.ListIndex = -1: Karta_t.List_b.ListIndex = Teh(ii).Brend - 1
                        Karta_t.List_n.ListIndex = -1: Karta_t.List_n.ListIndex = Teh(ii).Model - 1
                        Menu_Priv.FontSize = 8: Menu_Priv.ForeColor = &H948882: Menu_Priv.CurrentX = 44 * 15: Menu_Priv.CurrentY = 6 * 15 * Incr_priv * 6 + 8 * 15
                        Menu_Priv.Print Karta_t.List_t.List(Karta_t.List_t.ListIndex) & " " & Karta_t.List_b.List(Karta_t.List_b.ListIndex)
                        Menu_Priv.FontSize = 8: Menu_Priv.ForeColor = &H948882: Menu_Priv.CurrentX = 44 * 15: Menu_Priv.CurrentY = 6 * 15 * Incr_priv * 6 + 21 * 15
                        Menu_Priv.Print Karta_t.List_n.List(Karta_t.List_n.ListIndex) & ", №" & Teh(ii).Vp
                        LoadImage App.Path & "\res\" & "exit_s.png", Menu_Priv.hdc, 200, 6 * (Incr_priv * 6) + 12, 12, 12 'крестик удалить
                        Menu_Priv.Refresh
                        Priv_lab(Incr_priv).Tag = Teh(ii).UID & "|" & Pers(index).UID
                        Incr_priv = Incr_priv + 1
                    Else
                        
                    End If
                Next
                
                Menu_Priv.Height = 37 * 15 * (Incr_priv) + 6 * 15
                Menu_Priv.Tag = "Pers" & index
                Menu_Priv.Move Pers_win.Left + Frame_p.Left + Pers_index(index).Left + Pers_index(index).Width - 211 * 15, _
                    Pers_win.Top + Frame_p.Top + Pers_index(index).Top + 71 * 15
                If Menu_Priv.Height + Menu_Priv.Top > Me.Height Then Menu_Priv.Top = Me.Height - Menu_Priv.Height
                Menu_Priv.Line (0, 0)-(Menu_Priv.Width - 15, Menu_Priv.Height - 15), &HCAC2BD, B
                Menu_Priv.Visible = True
                Menu_Priv.ZOrder vbBringToFront
            End If
            Incr_priv = 0
        ElseIf X > 373 * 15 And X < 405 * 15 And Y > 45 * 15 And Y < 70 * 15 Then  'кнопка блокнота
            Note_UID = Pers(index).UID
            Note_Type = "1"
            WinS.SendData "NoteList:" & Pers(index).UID & "|" & "1"
            Form4.Visible = True
            Me.Enabled = False
        ElseIf X < 80 * 15 Then
            Pers(index).Flag = Not Pers(index).Flag
            Paint_pers_item index
            Dopusk_pers index
        End If
    End If
End Sub

Private Sub Teh_index_MouseDown(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Menu_Priv.Visible = False
    If Button = 1 Then
        If X >= Teh_index(index).Width - 35 * 15 And X <= Teh_index(index).Width - 13 * 15 Then 'перетаскивание техники
            If Dostup = 1 Or Dostup = 2 Then Drug_Teh index, X, Y
        ElseIf X >= 1380 And X <= 4215 And Y >= 690 Then 'журнал статистики по персоналу
            Reg_stat = "T" & Teh(index).UID
            Jurnal.List.Clear
            Jurnal.Show
            Jurnal.Line (30 * 15, 7 * 15)-(700 * 15, 25 * 15), QBColor(15), BF
            Jurnal.FontSize = 10: Jurnal.ForeColor = &H828894: Jurnal.CurrentX = 30 * 15: Jurnal.CurrentY = 7 * 15
            Jurnal.Print "Журнал по борту " & Teh(index).Brend & " " & Teh(index).Model & " №" & Teh(index).ID
            Form1.Enabled = False
            Jurnal.time_0.ListIndex = 5: Jurnal.time_1.ListIndex = 23
            Jurnal.time_0.ListIndex = 5: Jurnal.time_1.ListIndex = 23: Jurnal.Calend.Tag = "0": Jurnal.Calend_DateClick Date
            Jurnal.Calend.Tag = "1": Jurnal.Calend_DateClick Date: Jurnal.Calend.Tag = "2": Jurnal.Calend_DateClick Date
        ElseIf X >= Teh_index(index).Width - 211 * 15 And X <= Teh_index(index).Width - 36 * 15 And Y >= 12 * 15 And Y <= 70 * 15 And _
        (Dostup = 1 Or Dostup = 2) Then 'меню привязок
            If Priv_lab.UBound > 0 Then
                For i = 1 To Priv_lab.UBound
                    Unload Priv_lab(i)
                Next
            End If
            Priv_lab(0).Tag = ""
            Priv_lab(0).BorderStyle = 0
            Seach_Priv_Teh index
            Menu_Priv.Cls
            Priv_index = index
            Priv_type = "T"
            If UBound(Priv_tmp) = 0 And Priv_tmp(0) = 0 Then
                Priv_lab(0) = "Нет привязок"
            Else
                Menu_Priv.Height = 37 * 15 * (UBound(Priv_tmp) + 1) + 6 * 15
                Incr_priv = 0
                For i = 0 To UBound(Priv_tmp)
                    For ii = 0 To UBound(Pers)
                        If Pers(ii).UID = Priv_tmp(i) Then Exit For
                    Next
                    If ii < UBound(Pers) + 1 Then
                        If Incr_priv > 0 Then
                            Load Priv_lab(Incr_priv): Priv_lab(Incr_priv).Move Priv_lab(Incr_priv - 1).Left, Priv_lab(Incr_priv - 1).Top + Priv_lab(Incr_priv - 1).Height + 3 * 15
                            Priv_lab(Incr_priv) = Pers(ii).UID & " [" & Pers(ii).Surname & " " & Pers(ii).Name & "]" ': Priv_lab(Incr_priv).Visible = True
                        Else
                            Priv_lab(0) = Pers(ii).UID & " [" & Pers(ii).Surname & " " & Pers(ii).Name & "]" ': Priv_lab(0).Visible = True
                        End If
                        LoadImage App.Path & "\res\" & "logo_user.png", Menu_Priv.hdc, 7, 6 * (Incr_priv * 6) + 6, 32, 32 'лого техники в меню привязкок
                        Menu_Priv.FontSize = 8: Menu_Priv.ForeColor = &H948882: Menu_Priv.CurrentX = 44 * 15: Menu_Priv.CurrentY = 6 * 15 * Incr_priv * 6 + 8 * 15
                        Menu_Priv.Print Pers(ii).Surname & " " & Pers(ii).Name
                        Menu_Priv.FontSize = 8: Menu_Priv.ForeColor = &H948882: Menu_Priv.CurrentX = 44 * 15: Menu_Priv.CurrentY = 6 * 15 * Incr_priv * 6 + 21 * 15
                        Karta_p.List_p.ListIndex = -1: Karta_p.List_p.ListIndex = Pers(ii).Position - 1
                        If Pers(ii).Date = "" Then
                            Menu_Priv.Print Karta_p.List_p.List(Karta_p.List_p.ListIndex) & ", " & "0л."
                        Else
                            Menu_Priv.Print Karta_p.List_p.List(Karta_p.List_p.ListIndex) & ", " & DateDiff("yyyy", Pers(ii).Date, Date) & " л."
                        End If
                        LoadImage App.Path & "\res\" & "exit_s.png", Menu_Priv.hdc, 200, 6 * (Incr_priv * 6) + 12, 12, 12 'крестик удалить
                        Menu_Priv.Refresh
                        Priv_lab(Incr_priv).Tag = Teh(index).UID & "|" & Pers(ii).UID
                        Incr_priv = Incr_priv + 1
                    End If
                Next
            
                Menu_Priv.Height = 37 * 15 * (Incr_priv) + 6 * 15
                Menu_Priv.Tag = "Teh" & index
                Menu_Priv.Move Teh_win.Left + Frame_t.Left + Teh_index(index).Left + Teh_index(index).Width - 211 * 15, _
                    Teh_win.Top + Frame_t.Top + Teh_index(index).Top + 71 * 15
                If Menu_Priv.Height + Menu_Priv.Top > Me.Height Then Menu_Priv.Top = Me.Height - Menu_Priv.Height
                Menu_Priv.Line (0, 0)-(Menu_Priv.Width - 15, Menu_Priv.Height - 15), &HCAC2BD, B
                Menu_Priv.Visible = True
                Menu_Priv.ZOrder vbBringToFront
            End If
            
            ElseIf X > 373 * 15 And X < 405 * 15 And Y > 45 * 15 And Y < 70 * 15 Then   'кнопка блокнота
                Note_UID = Teh(index).UID
                Note_Type = "2"
                WinS.SendData "NoteList:" & Teh(index).UID & "|" & "2"
                Form4.Visible = True
                Me.Enabled = False
            ElseIf X < 80 * 15 Then
                Teh(index).Flag = Not Teh(index).Flag
                Paint_teh_item index
                Dopusk_teh index
        End If
    End If
End Sub

Private Sub Teh_index_MouseMove(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Online.BackColor = QBColor(10) And False Then
        With Form1
            If Shift = 1 Then
                Seach_Priv_Teh index
                For i = 0 To .Pers_index.UBound
                    For ii = 0 To UBound(Priv_tmp)
                        If Pers(i).UID = Priv_tmp(ii) Then Exit For
                    Next
                    If ii = UBound(Priv_tmp) + 1 Then
                        .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width, .Pers_index(i).Height), &HC8FFC8, BF
                        .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width - 20 * 15, .Pers_index(i).Height)
                    Else
                        .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width, .Pers_index(i).Height), IIf(ii = UBound(Priv_tmp) + 1, QBColor(2), QBColor(12)), BF
                        .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width - 20 * 15, .Pers_index(i).Height)
                    End If
                Next
            Else
                For i = 0 To Pers_index.UBound
                    .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width, .Pers_index(i).Height), &HC8FFC8, BF
                    .Pers_index(i).Line (.Pers_index(i).Width - 20 * 15, 0)-(.Pers_index(i).Width - 20 * 15, .Pers_index(i).Height)
                Next
            End If
        End With
    End If
End Sub

Private Sub Teh_index_MouseUp(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > xs And X < xs + 65 * 15 And Y > ys And Y < ys + 20 * 15 Then
        Reg_stat = "T" & Teh(index).UID
    ElseIf X > xs - 30 * 15 And X < xs - 10 * 15 And Y > ys And Y < ys + 20 * 15 Then
        Note_UID = Teh(index).UID
        Note_Type = "1"
        WinS.SendData "NoteList:" & Teh(index).UID & "|" & "2"
        Form4.Visible = True
        Me.Enabled = False
    End If
End Sub

Private Sub Teh_win_Click()
    Menu_Priv.Visible = False
End Sub

Private Sub Teh_Win_s_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > Teh_Win_s.Width - 31 * 15 - 13 * 15 And (Dostup = 1 Or Dostup = 2) Then 'добавить борт
            Karta_t.Tag = ""
            Karta_t.Form_Load
            Karta_t.Show
            Me.Enabled = False
            For i = 1 To Karta_t.Pol_teh.UBound
                Karta_t.Pol_teh(i) = ""
            Next
            Karta_t.List_t.ListIndex = -1
            Karta_t.List_b.ListIndex = -1
            Karta_t.List_Oc.ListIndex = -1
            Karta_t.List_n.ListIndex = -1
            set_pos_scroll 0, 100
            set_pos_scroll 1, 150
    ElseIf X > Teh_Win_s.Width - 31 * 15 - 45 * 15 - 13 * 15 And X < Teh_Win_s.Width - 31 * 15 - 13 * 15 Then 'фильтр
        Fil_t.Show: Me.Enabled = False
        Fil_t.ch_t_sub
    End If
End Sub

Private Sub Timer1_Timer()
    Drug_Pers_Timer
End Sub

Private Sub Timer10_Timer()
    WinS.SendData "Spisok_T=" & Incr_Load + 1
End Sub

Private Sub Timer11_Timer()
    If Buffer_Priv(0) <> "" Then WinS.SendData Buffer_Priv(0)
End Sub

Private Sub Timer12_Timer()
    WinS.SendData "Spisok_Raz=" & Incr_Load + 1
End Sub

Private Sub Timer2_Timer()
    Drug_Teh_Timer
End Sub

Private Sub Timer3_Timer()
    Online.BackColor = QBColor(12)
    Load_Flag = False
    Form3.Visible = False: Me.Visible = False: Form2.Visible = True
    LoadImage App.Path & "\res\" & "auth_.png", Form2.hdc, 0, 0
    Form2.Refresh
    Form2.Text(0).Visible = False: Form2.Text(1).Visible = False
    For i = 0 To Pers_index.UBound
        If i > 0 Then Unload Pers_index(i)
    Next
    ReDim Pers(0): Pers_index(0).Visible = False: List1.Clear: Pers_index(0).Cls
    For i = 0 To Teh_index.UBound
        If i > 0 Then Unload Teh_index(i)
    Next
    ReDim Teh(0): Teh_index(0).Visible = False: List2.Clear: Teh_index(0).Cls
    Label1 = "Нет подключения к серверу"
    WinS.Close
    WinS.Connect Addr_Server, 3334
End Sub

Private Sub Timer4_Timer()
    GetCursorPos Cur
    If Cur.Y * 15 - Me.Top - cur_d.Y - Teh_win.Top < 0 Then
        Sc_t.Top = 0
    ElseIf Cur.Y * 15 - Me.Top - cur_d.Y - Teh_win.Top >= Teh_win.Height - Sc_t.Height Then
        Sc_t.Top = Teh_win.Height - Sc_t.Height
    Else
        Sc_t.Top = Cur.Y * 15 - Me.Top - cur_d.Y - Teh_win.Top - 15
    End If
    Frame_t.Top = Sc_t.Top * (Teh_win.Height - Frame_t.Height) \ (Teh_win.Height - Sc_t.Height)
End Sub

Private Sub Timer5_Timer()
    Razd_time = IIf(Razd_time = " ", ":", ":")
    Label5 = Format(Time, "hh" & Razd_time & "mm")
    Label6 = Date
End Sub

Private Sub Timer6_Timer()
    GetCursorPos Cur
    If Cur.Y * 15 - Me.Top - cur_d.Y - Pers_win.Top < 0 Then
        Sc_p.Top = 0
    ElseIf Cur.Y * 15 - Me.Top - cur_d.Y - Pers_win.Top >= Pers_win.Height - Sc_p.Height Then
        Sc_p.Top = Pers_win.Height - Sc_p.Height
    Else
        Sc_p.Top = Cur.Y * 15 - Me.Top - cur_d.Y - Pers_win.Top - 15
    End If
    Frame_p.Top = Sc_p.Top * (Pers_win.Height - Frame_p.Height) \ (Pers_win.Height - Sc_p.Height)
End Sub

Private Sub Timer7_Timer()
    WinS.SendData WaitStr
    WaitStr = ""
    Timer7.Enabled = False
End Sub

Private Sub Timer8_Timer()
    Ar = Split(Flash_Priv, "|")
    'MsgBox Flash_Priv
    If UBound(Ar) = 1 Then
        Form1.Pers_index(Ar(1)).DrawWidth = 2: Form1.Teh_index(Ar(0)).DrawWidth = 2
        Flash_Bool = Not (Flash_Bool)
        Form1.Pers_index(Ar(1)).Line (15, 15)-(Form1.Pers_index(Ar(1)).Width - 15, Form1.Pers_index(Ar(1)).Height - 15), IIf(Flash_Bool, QBColor(10), QBColor(15)), B
        Form1.Teh_index(Ar(0)).Line (15, 15)-(Form1.Teh_index(Ar(0)).Width - 15, Form1.Teh_index(Ar(0)).Height - 15), IIf(Flash_Bool, QBColor(10), QBColor(15)), B
    End If
    Flash_incr = Flash_incr + 1
    If Flash_incr > 5 Then Timer8.Enabled = False
End Sub

Private Sub Timer9_Timer()
    WinS.SendData "Spisok_P=" & Incr_Load + 1
End Sub

Private Sub WinS_Close()
    Timer3.Enabled = True
End Sub

Private Sub WinS_Connect()
    Timer3.Enabled = False
    Online.BackColor = QBColor(10)
    If User <> "" Then
        Form2.Text(0).Visible = True
        Form2.Button_Click
    Else
        Form2.Text(0).Enabled = True: Form2.Text(1).Enabled = True
        Form2.Text(0).Visible = True: Form2.Text(1).Visible = True
        LoadImage App.Path & "\res\" & "auth.png", Form2.hdc, 0, 0
        Form2.Refresh
    End If
    Label1 = "Подключено к серверу"
End Sub

Private Sub WinS_DataArrival(ByVal bytesTotal As Long) 'приём от сервера
    DoEvents
    Dim Get_st As String
    Dim Str_tmp As String
    Dim p_index As Integer, t_index As Integer
    Dim Ar, Ar_
    WinS.GetData Get_st
    If Mid(Get_st, 1, 1) = "*" Then
        List_priv Get_st 'список привязок
        Form5.Label1 = "получение статистики за неделю..."
        If Load_Flag = False Then WinS.SendData "List_Note"
    End If
    If Mid(Get_st, 1, 12) = "List_Online=" Then
        Str_tmp = Mid(Get_st, 13, Len(Get_st))
        Ar = Split(Str_tmp, "|")

        For ii = 0 To Pers_index.UBound 'прорисовка оффлайн персонала
            LoadImage App.Path & "\res\" & "frame_online.png", _
                Pers_index(ii).hdc, Pers_index(ii).Width \ 15 - 199 - 12, Pers_index(ii).Height \ 15 \ 2 - 30  'фрейм оффлайн персонала
            Pers_index(ii).Refresh
            Pers_index(ii).Tag = ""
        Next
        
        For ii = 0 To Teh_index.UBound 'прорисовка оффлайн техники
            LoadImage App.Path & "\res\" & "frame_online.png", _
                Teh_index(ii).hdc, Teh_index(ii).Width \ 15 - 199 - 12, Teh_index(ii).Height \ 15 \ 2 - 30 'фрейм онлайн техники
            Teh_index(ii).Refresh
            Teh_index(ii).Tag = ""
        Next

        For i = 0 To UBound(Ar)
            Ar_ = Split(Ar(i), ".")
            If UBound(Ar_) > 0 Then
                p_index = Get_Pers_Index(val(Ar_(1)))
                t_index = Get_Teh_Index(val(Ar_(0)))
                Text1 = p_index & vbNewLine & t_index & vbNewLine & vbNewLine
                If t_index > -1 And p_index > -1 And (Karta_p.Visible = False And Karta_t.Visible = False) Then
                    Teh_index(t_index).Tag = "1"
                    
                    For iu = 0 To UBound(Priv)
                        'Text1 = Text1 & Pers(p_index).UID & "|" & Priv(iu).UID_Pers & "   " & Teh(t_index).UID & "|" & Priv(iu).UID_Teh & vbNewLine
                        If Pers(p_index).UID = Priv(iu).UID_Pers And Teh(t_index).UID = Priv(iu).UID_Teh Then
                            Exit For
                        End If
                    Next
                    
                    If iu <= UBound(Priv) Then
                        LoadImage App.Path & "\res\" & "frame_online_.png", Teh_index(t_index).hdc, Teh_index(t_index).Width \ 15 - 199 - 12, Teh_index(t_index).Height \ 15 \ 2 - 30 'фрейм онлайн техники
                        LoadImage App.Path & "\res\" & "frame_online_.png", Pers_index(p_index).hdc, Pers_index(p_index).Width \ 15 - 199 - 12, Pers_index(p_index).Height \ 15 \ 2 - 30 'фрейм онлайн персонала
                        Pers_index(p_index).ForeColor = QBColor(15): Teh_index(t_index).ForeColor = QBColor(15)
                    Else
                        LoadImage App.Path & "\res\" & "frame_on.png", Teh_index(t_index).hdc, Teh_index(t_index).Width \ 15 - 199 - 12, Teh_index(t_index).Height \ 15 \ 2 - 30 'фрейм онлайн техники
                        LoadImage App.Path & "\res\" & "frame_on.png", Pers_index(p_index).hdc, Pers_index(p_index).Width \ 15 - 199 - 12, Pers_index(p_index).Height \ 15 \ 2 - 30 'фрейм онлайн персонала
                        Pers_index(p_index).ForeColor = QBColor(8): Teh_index(t_index).ForeColor = QBColor(8)
                    End If
                    
                    'LoadImage App.Path & "\res\" & "frame_online_.png", Pers_index(p_index).hdc, Pers_index(p_index).Width \ 15 - 199 - 12, Pers_index(p_index).Height \ 15 \ 2 - 30 'фрейм онлайн персонала
                    Pers_index(p_index).FontSize = 8  'прорисовка связи персонала и техники в работе
                    Pers_index(p_index).CurrentX = Pers_index(p_index).Width - 180 * 15: Pers_index(p_index).CurrentY = Pers_index(p_index).Height \ 2 - 26 * 15
                    Karta_t.List_b.ListIndex = -1: Karta_t.List_b.ListIndex = Teh(t_index).Brend - 1
                    Karta_t.List_t.ListIndex = -1: Karta_t.List_t.ListIndex = Teh(t_index).Type - 1
                    tmp_str = Karta_t.List_t.List(Karta_t.List_t.ListIndex) & " " & Karta_t.List_b.List(Karta_t.List_b.ListIndex)
                    If Len(tmp_str) > 27 Then tmp_str = Mid(tmp_str, 1, 25) & ".."
                    Pers_index(p_index).Print tmp_str
                    Pers_index(p_index).Tag = "1"
                    Pers_index(p_index).CurrentX = Pers_index(p_index).Width - 180 * 15: Pers_index(p_index).CurrentY = Pers_index(p_index).Height \ 2 - 13 * 15
                    Pers_index(p_index).Print Karta_t.List_n.List(Teh(t_index).Model - 1) & ", №" & Teh(t_index).Vp
                    Pers_index(p_index).Refresh
                    
                    'LoadImage App.Path & "\res\" & "frame_online_.png", Teh_index(t_index).hdc, Teh_index(t_index).Width \ 15 - 199 - 12, Teh_index(t_index).Height \ 15 \ 2 - 30 'фрейм онлайн техники
                    
                    Teh_index(t_index).FontSize = 8 'прорисовка связи персонала и техники в работе
                    Teh_index(t_index).CurrentX = Teh_index(t_index).Width - 180 * 15: Teh_index(t_index).CurrentY = Teh_index(t_index).Height \ 2 - 26 * 15
                    Teh_index(t_index).Tag = "1"
                    Teh_index(t_index).Print Pers(p_index).Surname & " " & Pers(p_index).Name
                    Teh_index(t_index).CurrentX = Teh_index(t_index).Width - 180 * 15: Teh_index(t_index).CurrentY = Teh_index(t_index).Height \ 2 - 13 * 15
                    Teh_index(t_index).Print Karta_p.List_p.List(Pers(p_index).Position - 1) & ", " & DateDiff("yyyy", Pers(p_index).Date, Date) & " л."
                    Teh_index(t_index).Refresh
                End If
            End If
        Next
        Dopusk ' прорисовка количества допущеных карт и бортов
    ElseIf Mid(Get_st, 1, 5) = "Stat>" Then 'обработка принятой статистики
        Dim Ident As String
        Ar = Split(Mid(Get_st, 6, Len(Get_st)), "|") 'ar(0)=UID техники или персонала; ar(1)=дата и время начала сессии<продолжительность сессии<UID техники или персонала. Зависит от ar(0)
        If UBound(Ar) > 0 Then
            If Mid(Ar(0), 1, 1) = "P" Or Mid(Ar(0), 1, 1) = "T" Then
                If Mid(Ar(0), 1, 1) = "P" Then
                    For i = 0 To UBound(Pers)
                        If val(Mid(Ar(0), 2, 10)) = Pers(i).UID Then Exit For
                    Next
                    Ident = "P": iii_p = i 'index массива персонала в котором хранится информация о присланном сотруднике
                ElseIf Mid(Ar(0), 1, 1) = "T" Then
                    For i = 0 To UBound(Teh)
                        If val(Mid(Ar(0), 2, 10)) = Teh(i).UID Then Exit For
                    Next
                    Ident = "T": iii_t = i 'index массива персонала в котором хранится информация о присланном сотруднике
                End If
                
                Jurnal.List.Clear
                Dim dd1() As dd_, Counter As Long
                ReDim Exc(0)
                ReDim dd1(0)
                For i = 1 To UBound(Ar)
                   arr = Split(Ar(i), "<") 'arr(0)=дата начала(открытие сессии); arr(1)=длительность сессии в секундах;arr(2)=борт или сотрудник
                    If UBound(arr) = 2 Then
                         If Ident = "P" Then
                             For iu = 0 To UBound(Teh)
                                If val(arr(2)) = Teh(iu).UID Then Exit For
                             Next
                             iii_t = iu 'index массива персонала в котором хранится информация о присланном сотруднике
                         ElseIf Ident = "T" Then
                             For iu = 0 To UBound(Pers)
                                 If val(arr(2)) = Pers(iu).UID Then Exit For
                             Next
                             iii_p = iu 'index массива персонала в котором хранится информация о присланном сотруднике
                         End If
                        For i_ = 0 To UBound(Teh)
                             If arr(2) = Teh(i_).UID Then arr(2) = Teh(i_).ID: Exit For
                        Next
                   End If
                    If UBound(arr) > 0 Then
                        If Day1 Or Not (Det) Then 'если требуется вывести статистику за день или за интервал дней детально'''''''''''''''''''''''''''''''''
                        'If Day1 Then
                            ReDim Preserve Exc(i)
                            tmp_date = Split(arr(0), ".")
                            tmp_date1 = Split(arr(1), ".")
                            If UBound(tmp_date) = 0 Then arr(0) = Date & " " & Time
                            Exc(i).d1 = arr(0)
                            Exc(i).d2 = DateAdd("s", arr(1), arr(0))
                            Exc(i).diff_d2_d1 = arr(1)
                            Exc(i).ID_bort = Teh(iii_t).Vp
                            Exc(i).FIO = Pers(iii_p).Surname & " " & Pers(iii_p).Name & " " & Pers(iii_p).Lastname
                            Exc(i).RFID = Pers(iii_p).RFID
                            Exc(i).prof = Karta_p.List_p.List(Pers(iii_p).Position - 1) 'Pers(iii_p).Position
                            Karta_t.List_t.ListIndex = Teh(iii_t).Type - 1
                            Karta_t.List_b.ListIndex = Teh(iii_t).Brend - 1
                            'Karta_t.List_n.ListIndex = Teh(iii_t).Model - 1
                            Exc(i).Type = Karta_t.List_t.List(Teh(iii_t).Type - 1)
                            Exc(i).Brebd = Karta_t.List_b.List(Teh(iii_t).Brend - 1)
                            Exc(i).Model = Karta_t.List_n.List(Teh(iii_t).Model - 1)
                        ElseIf Day1 = False Then 'если требуется вывести статистику сжатую. В данный момент не используется, из-за отсутствия данной опции
                        'требует доработки обработчика типов Date. Для активации из основного условия убрать Or Not (Det)
                            For io = 0 To UBound(dd1)
                                'tmp_date = Val(Mid(arr(0), 1, 10))
                                'If tmp_date > 0 Then
                                    'MsgBox Mid(arr(0), 1, 10)
                                    If dd1(io).d = Mid(arr(0), 1, 10) Then dd1(io).Counter = dd1(io).Counter + arr(1): Exit For
                                'End If
                            Next
                            If UBound(dd1) < io Then
                                If UBound(dd1) = 0 And dd1(0).d = "0:00:00" Then
                                    tmp_date = val(Mid(arr(0), 1, 10))
                                    If tmp_date > 0 Then dd1(0).d = Mid(arr(0), 1, 10) Else dd1(0).d = "0:00:01"
                                    dd1(0).Counter = arr(1)
                                Else
                                    tmp_date = val(Mid(arr(0), 1, 10))
                                    ReDim Preserve dd1(UBound(dd1) + 1)
                                    If tmp_date > 0 Then dd1(UBound(dd1)).d = Mid(arr(0), 1, 10) Else dd1(UBound(dd1)).d = "0:00:01"
                                    dd1(UBound(dd1)).Counter = arr(1)
                                End If
                            End If
                        End If
                    End If
                Next
                If UBound(Exc) > 0 And (Day1 Or Not (Det)) Then
                    Jurnal.List.Clear
                    For i = 1 To UBound(Exc)
                        Jurnal.List.AddItem Exc(i).d1 & " " & Exc(i).prof & " " & Exc(i).FIO & " получил доступ - " & Exc(i).Type & " " & Exc(i).Brebd & _
                            " " & Exc(i).Model & ", №" & Exc(i).ID_bort & " на " & Format(Exc(i).diff_d2_d1 / 60, "0.0") & " мин. "
                    Next
                End If
                If dd1(0).d <> "0:00:00" Then
                    Jurnal.List.Clear
                    ReDim Exc(UBound(dd1) + 1)
                    For i = 0 To UBound(dd1)
                        tmp_date = Split(dd1(i).d, ".")
                        If UBound(tmp_date) = 0 Then dd1(i).d = "00.00.00 00:00:00"
                        Exc(i + 1).d2 = DateAdd("s", dd1(i).Counter, dd1(i).d)
                        Exc(i + 1).diff_d2_d1 = dd1(i).Counter
                        Exc(i + 1).FIO = Pers(iii_p).Surname & " " & Pers(iii_p).Name & " " & Pers(iii_p).Lastname
                        Exc(i + 1).RFID = Pers(iii_p).RFID
                        Jurnal.List.AddItem "[" & Exc(i + 1).d1 & "] " & Exc(i + 1).FIO & " время активной работы: " & Exc(i + 1).diff_d2_d1 \ 60 & " мин."
                    Next
                End If
            ElseIf Mid(Ar(0), 1, 1) = "U" Then
                Jurnal.List.Clear
                ReDim Exc(0)
                For i = 1 To UBound(Ar)
                    arr = Split(Ar(i), "<") 'arr(0)=дата удара, arr(1)=время удара, arr(1)=UID сотрудника, arr(2)=UID техники
                    If UBound(arr) = 2 Then
                        For i_p = 0 To UBound(Pers)
                            If arr(1) = Pers(i_p).UID Then Exit For
                        Next
                        For i_t = 0 To UBound(Teh)
                            If arr(2) = Teh(i_t).UID Then Exit For
                        Next
                        If i_t < UBound(Teh) + 1 And i_p < UBound(Pers) + 1 Then
                            If Exc(0).FIO <> "" Then
                            Else
                                ReDim Preserve Exc(UBound(Exc) + 1)
                            End If
                            Exc(UBound(Exc)).ID_bort = Teh(i_t).Vp
                            Exc(UBound(Exc)).FIO = Pers(i_p).Surname & " " & Pers(i_p).Name
                            tmp_date = Split(arr(0), ".")
                            If UBound(tmp_date) = 0 Then arr(0) = "00.00.00 00:00:00"
                            Exc(UBound(Exc)).d1 = arr(0)
                            Exc(UBound(Exc)).RFID = Pers(i_p).RFID
                            
                            
                            
                            Karta_t.List_t.ListIndex = Teh(i_t).Type - 1
                            Karta_t.List_b.ListIndex = Teh(i_t).Brend - 1
                            'Karta_t.List_n.ListIndex = Teh(iii_t).Model - 1
                            Exc(UBound(Exc)).Type = Karta_t.List_t.List(Teh(i_t).Type - 1)
                            Exc(UBound(Exc)).Brebd = Karta_t.List_b.List(Teh(i_t).Brend - 1)
                            Exc(UBound(Exc)).Model = Karta_t.List_n.List(Teh(i_t).Model - 1)
                           'Jurnal.List.AddItem arr(0) & " " & arr(1) & " произошёл удар борта №" & Teh(i_t).ID & " ответственный " & Pers(i_p).Surname & " " & Pers(i_p).Name
                            Jurnal.List.AddItem arr(0) & " произошёл удар борта " & Mid$(Exc(UBound(Exc)).Brebd, 1, 6) & " " & Exc(UBound(Exc)).Type & " " & _
                                Exc(UBound(Exc)).Model & " №" & Exc(UBound(Exc)).ID_bort & " ответственный " & Pers(i_p).Surname & " " & Pers(i_p).Name
                        End If
                    End If
                Next
            End If
        Else
            Jurnal.List.Clear
            Jurnal.List.AddItem "Статистика для выбранного интервала дат отсутствует"
        End If
    ElseIf Mid(Get_st, 1, 11) = "List_Note>>" Then
        Ar = Split(Mid(Get_st, 12, Len(Get_st)), "|")
        ReDim Note_p(200): ReDim Note_t(200)
        For i = 0 To UBound(Ar)
            If i = 0 Then
                afg = Split(Ar(0), ":")
                If UBound(afg) = 1 Then
                    Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H948882: Pers_Win_s.CurrentX = 110 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print val(afg(0))
                    Pers_Win_s.FontSize = 10: Pers_Win_s.ForeColor = &H948882: Pers_Win_s.CurrentX = 140 * 15: Pers_Win_s.CurrentY = 16 * 15: Pers_Win_s.Print "Вышло в смену"
                    Pers_Win_s.FontSize = 16: Pers_Win_s.ForeColor = &H434AD2: Pers_Win_s.CurrentX = 250 * 15: Pers_Win_s.CurrentY = 6 * 15: Pers_Win_s.Print UBound(Pers) - val(afg(0)) + 1
                    Pers_Win_s.FontSize = 10: Pers_Win_s.CurrentX = 280 * 15: Pers_Win_s.CurrentY = 16 * 15: Pers_Win_s.Print "Не вышло в смену"
                    
                    Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H948882: Teh_Win_s.CurrentX = 110 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print val(afg(1))
                    Teh_Win_s.FontSize = 10: Teh_Win_s.ForeColor = &H948882: Teh_Win_s.CurrentX = 140 * 15: Teh_Win_s.CurrentY = 16 * 15: Teh_Win_s.Print "Выдано в смену"
                    Teh_Win_s.FontSize = 16: Teh_Win_s.ForeColor = &H434AD2: Teh_Win_s.CurrentX = 250 * 15: Teh_Win_s.CurrentY = 6 * 15: Teh_Win_s.Print UBound(Teh) - val(afg(1)) + 1
                    Teh_Win_s.FontSize = 10: Teh_Win_s.CurrentX = 280 * 15: Teh_Win_s.CurrentY = 16 * 15: Teh_Win_s.Print "Не выдано в смену"
                End If
            Else
                If Mid(Ar(i), 1, 1) = "1" Then
                    For ii = 0 To UBound(Pers)
                        If Mid(Ar(i), 2, 10) = Pers(ii).UID Then Note_p(ii) = Note_p(ii) + 1: Exit For
                    Next
                ElseIf Mid(Ar(i), 1, 1) = "2" Then
                    For ii = 0 To UBound(Teh)
                        If Mid(Ar(i), 2, 10) = Teh(ii).UID Then Note_t(ii) = Note_t(ii) + 1: Exit For
                    Next
                End If
            End If
        Next
        For i = 0 To UBound(Pers)
            Pers_index(i).Line (390 * 15, Pers_index(i).Height - 675)-(410 * 15, Pers_index(i).Height - 100), QBColor(15), BF
            Pers_index(i).FontSize = 20: Pers_index(i).ForeColor = &H948882
            Pers_index(i).CurrentX = 383 * 15: Pers_index(i).CurrentY = Pers_index(i).Height - 675
            Pers_index(i).Print Note_p(i) 'количество заметок
        Next
        
        For i = 0 To UBound(Teh)
            Teh_index(i).Line (390 * 15, Teh_index(i).Height - 675)-(410 * 15, Teh_index(i).Height - 100), QBColor(15), BF
            Teh_index(i).FontSize = 20: Teh_index(i).ForeColor = &H948882
            Teh_index(i).CurrentX = 383 * 15: Teh_index(i).CurrentY = Teh_index(i).Height - 675
            Teh_index(i).Print Note_t(i) 'количество заметок
        Next
        Form5.Label1 = "получение информации об ударах"
        WinS.SendData "Udar>>"
        Load_Flag = True
        Me.Show
        Form5.Visible = False
    ElseIf Mid(Get_st, 1, 6) = "Login:" Then
        User = Form2.Text(0): Pass = Form2.Text(1)
        Ar = Split(Mid(Get_st, 7, Len(Get_st)), "|")
        Form2.Visible = False
        'Me.Show
        Form5.Show
        Us_Name = Ar(0)
        Dostup = Ar(1)
        Me.ForeColor = QBColor(7)
        Me.CurrentX = 10 * 15: Me.CurrentY = Me.Height - 33 * 15
        If Ar(1) = 1 Then
            Me.Print "Права доступа: Администратор"
        ElseIf Ar(1) = 2 Then
            Me.Print "Права доступа: Мастер"
        ElseIf Ar(1) = 3 Then
            Me.Print "Права доступа: Пользователь"
        End If
        Me.CurrentX = 10 * 15: Me.CurrentY = Me.Height - 18 * 15: Me.Print "Пользователь: " & Ar(0)
        Pers_Cout = val(Ar(2)): Teh_Cout = val(Ar(3)): Priv_Cout = val(Ar(4))
        ReDim Pers(Pers_Cout - 1): ReDim Teh(Teh_Cout - 1): ReDim Priv(Priv_Cout)
        Incr_Load = 0: Temp_string = ""
        Flag_ListP = True: Flag_ListT = False
        WaitStr = "Spisok_P=1"
        Timer7.Enabled = True
    ElseIf Get_st = "NoLogin" Then
        Dostup = "": Us_Name = ""
        MsgBox "Не верный логин или пароль"
        Form2.Text(0).Enabled = True: Form2.Text(1).Enabled = True
    ElseIf Mid(Get_st, 1, 8) = "Profile:" Then
        Ar = Split(Mid(Get_st, 9, Len(Get_st)), vbNewLine)
        ReDim Profile(0)
        Form3.List.Clear
        
        For i = 0 To UBound(Ar)
            arr = Split(Ar(i), "|")
            If i = 0 And Profile(0).Login = "" Then
            Else
                ReDim Preserve Profile(i)
            End If
            Profile(i).Login = arr(0): Profile(i).Pass = arr(1): Profile(i).FIO = arr(2): Profile(i).Prava = arr(3): Profile(i).Prochee = arr(4)
            Form3.List.AddItem "[" & Profile(i).Prava & "] " & Profile(i).FIO
        Next
        Form3.Command1(1).Enabled = False: Form3.Command1(2).Enabled = False
    ElseIf Mid(Get_st, 1, 9) = "NoteList:" Then
        ReDim Note(0)
        Form4.List.Clear
        If Get_st <> "NoteList:" Then
            Ar = Split(Mid(Get_st, 10, Len(Get_st)), "@#@")
            For i = 0 To UBound(Ar)
                arr = Split(Ar(i), "|")
                If i = 0 And Note(0).UID = 0 Then
                Else
                    ReDim Preserve Note(i)
                End If
                On Error Resume Next
                tmp_date = Split(arr(0), ".")
                If UBound(tmp_date) = 0 Then arr(0) = Date & " " & Time
                Note(i).Date = (arr(0)): Note(i).UID = val(arr(2)): Note(i).Text = arr(3): Note(i).WhoIs = arr(4): Note(i).ID = val(arr(5))
                Form4.List.AddItem "[" & Note(i).Date & "] " & Note(i).WhoIs & ": " & Note(i).Text
            Next
        Else
            Form4.List.AddItem "Нет заметок"
        End If
        If Note_Type = "1" Then
            For i = 0 To UBound(Pers)
                If Pers(i).UID = Note_UID Then
                    Note_p(i) = UBound(Note) + 1
                    Pers_index(i).Line (390 * 15, Pers_index(i).Height - 675)-(410 * 15, Pers_index(i).Height - 100), QBColor(15), BF
                    Pers_index(i).FontSize = 20: Pers_index(i).ForeColor = &H948882
                    Pers_index(i).CurrentX = 383 * 15: Pers_index(i).CurrentY = Pers_index(i).Height - 675
                    Pers_index(i).Print IIf(Form4.List.List(0) = "Нет заметок", 0, Note_p(i)) 'количество заметок
                    Exit For
                End If
            Next
        ElseIf Note_Type = "2" Then
            For i = 0 To UBound(Teh)
                If Teh(i).UID = Note_UID Then
                    Note_t(i) = UBound(Note) + 1
                    Teh_index(i).Line (390 * 15, Teh_index(i).Height - 675)-(410 * 15, Teh_index(i).Height - 100), QBColor(15), BF
                    Teh_index(i).FontSize = 20: Teh_index(i).ForeColor = &H948882
                    Teh_index(i).CurrentX = 383 * 15: Teh_index(i).CurrentY = Teh_index(i).Height - 675
                    Teh_index(i).Print IIf(Form4.List.List(0) = "Нет заметок", 0, Note_t(i)) 'количество заметок
                    Exit For
                End If
            Next
        End If
    ElseIf Get_st = "Udar<<" Then
        Me.Line (Me.Width - 160 * 15, 9 * 15)-(Me.Width - 130 * 15, 30 * 15), QBColor(15), BF
        LoadImage App.Path & "\res\" & "udar_s.png", Me.hdc, Me.Width \ 15 - 160, 9 'удар шапка
        Call SendMessage(Pers_win.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        Call SendMessage(Teh_win.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        Udar = True
    ElseIf Mid$(Get_st, 1, 6) = "Addpn:" And Flag_ListP = True Then 'начало передачи списка персонала
        Incr_Load = Incr_Load + 1
        Ar = Split(Get_st, "|")
        If UBound(Ar) = 11 And Incr_Load = Ar(11) Then
            Timer9.Enabled = False
            If Temp_string = "" Then Temp_string = Mid(Get_st, 7, Len(Get_st)) Else Temp_string = Temp_string & vbNewLine & Mid(Get_st, 7, Len(Get_st))
            Form5.Label1 = "пол. списка сотрудников: " & Ar(11) & "\" & Pers_Cout
            If Pers_Cout > Ar(11) Then
                Timer9.Enabled = True
                WinS.SendData "Spisok_P=" & Ar(11) + 1
            Else
                Incr_Load = 0
                List_pers Temp_string
                Temp_string = ""
                Frame_p.Visible = True
                Temp_flag_p = False
                Timer9.Enabled = False
                Timer10.Enabled = True
                Flag_ListP = False: Flag_ListT = True
                WaitStr = "Spisok_T=1"
                Timer7.Enabled = True
            End If
        Else
            Incr_Load = Incr_Load - 1
            Timer9.Enabled = True
        End If
    ElseIf Mid(Get_st, 1, 6) = "Addtn:" And Flag_ListT = True Then 'начало передачи списка техники
        Incr_Load = Incr_Load + 1
        Ar = Split(Get_st, "|")
        If UBound(Ar) = 14 And Incr_Load = Ar(12) Then
            Timer10.Enabled = False
            If Temp_string = "" Then Temp_string = Mid(Get_st, 7, Len(Get_st)) Else Temp_string = Temp_string & vbNewLine & Mid(Get_st, 7, Len(Get_st))
            Form5.Label1 = "пол. списка техники: " & Ar(12) & "\" & Teh_Cout
            If Teh_Cout > Ar(12) Then
                Timer10.Enabled = True
                WinS.SendData "Spisok_T=" & Ar(12) + 1
            Else
                Incr_Load = 0
                'List_teh Mid$(Temp_string, 7, Len(Temp_string)): Temp_string = ""
                Timer9.Enabled = False
                Timer10.Enabled = False
                List_teh Temp_string: Temp_string = ""
                Frame_t.Visible = True
                Temp_flag_t = False
                If Load_Flag Then
                    Frame_p.Visible = True
                    Frame_t.Visible = True
                    Form5.Visible = False
                    Me.Enabled = True
                    Me.Show
                    Dopusk
                Else
                    Incr_Load = 0
                    Form5.Label1 = "получение общей статистики..."
                    Flag_ListP = False: Flag_ListT = False: Flag_ListPr = True
                    'WaitStr = "Zapros_Priv"
                    WaitStr = "Spisok_Raz=1"
                    Timer7.Enabled = True
                End If
            End If
        Else
            Incr_Load = Incr_Load - 1
            Timer10.Enabled = True
        End If
    ElseIf Mid$(Get_st, 1, 7) = "Addprn:" And Flag_ListPr = True Then 'начало передачи списка разрешений
        Incr_Load = Incr_Load + 1
        'Ar = Split(Get_st, "")
        Ar = Split(Mid$(Get_st, 8, Len(Get_st)), "$")
        'If UBound(Ar) = 2 And Incr_Load = Ar(2) Then 'проверка на валидность присланных данных
        If True Then
            Timer12.Enabled = False
            'If Temp_string = "" Then Temp_string = Mid$(Get_st, 8, Len(Get_st)) Else Temp_string = Temp_string & vbNewLine & Mid(Get_st, 8, Len(Get_st))
            For i = 0 To UBound(Ar)
                If Temp_string = "" Then Temp_string = Ar(i) Else Temp_string = Temp_string & vbNewLine & Ar(i)
            Next
            'Form5.Label1 = "пол. списка разрешений: " & Ar(2) & "\" & Priv_Cout
            temp_s_ub = Split(Temp_string, vbNewLine)
            Form5.Label1 = "пол. списка разрешений: " & UBound(temp_s_ub) + 1 & "\" & Priv_Cout
            If Priv_Cout > UBound(temp_s_ub) + 1 Then
                Timer12.Enabled = True
                WinS.SendData "Spisok_Raz=" & UBound(temp_s_ub) + 1
            Else
                Incr_Load = 0
                'List_pers Temp_string
                'Frame_p.Visible = True
                'Temp_flag_p = False
                Timer9.Enabled = False
                Timer10.Enabled = False
                Timer12.Enabled = False
                Flag_ListP = False: Flag_ListT = False: Flag_ListPr = False
                
                List_priv Temp_string 'список привязок
                Form5.Label1 = "получение статистики за неделю..."
                If Load_Flag = False Then WinS.SendData "List_Note"
                Temp_string = ""
            End If
        Else
            Incr_Load = Incr_Load - 1
            Timer9.Enabled = True
        End If
    
    
    
    
    ElseIf Mid$(Get_st, 1, 10) = "@Add_Priv@" Then 'добавление новой привязки
        Buff_Priv Get_st
    ElseIf Mid$(Get_st, 1, 10) = "@Del_Priv@" Then 'Удаление привязки
        Buff_Priv Get_st
    ElseIf Mid$(Get_st, 1, 10) = "@Add_Pers@" Then 'Добавление сотрудника
        Buff_Priv Get_st
    ElseIf Mid$(Get_st, 1, 11) = "@Edit_Pers@" Then 'Добавление сотрудника
        Buff_Priv Get_st
    ElseIf Mid$(Get_st, 1, 10) = "@Del_Pers@" Then 'Добавление сотрудника
        Buff_Priv Get_st
    ElseIf Mid$(Get_st, 1, 10) = "Max_UID_P=" Then
        MsgBox Mid$(Get_st, 11, Len(Get_st))
    ElseIf Mid$(Get_st, 1, 5) = "Obsh=" Then
        i_stat = Mid$(Get_st, 6, Len(Get_st))
        i_stat_incr = 0
        WinS.SendData "Ob_stat=" & i_stat_incr
'        Ar = Split(Mid$(Get_st, 6, Len(Get_st)), vbNewLine)
'        For i = 0 To UBound(Teh)
'            For ii = 0 To UBound(Ar)
'                If Ar(ii) <> "" Then
'                    arr = Split(Ar(ii), "|")
'                    If Teh(i).UID = arr(2) Then Text1 = Text1 & arr(2) & ". " & Ar(ii) & vbNewLine
'                End If
'            Next
'        Next
    End If
End Sub

Private Function Get_Teh_Index(ID As Integer) As Integer
    For i = 0 To UBound(Teh)
        If ID = Teh(i).ID Then Exit For
    Next
    If i > UBound(Teh) Then Get_Teh_Index = -1 Else Get_Teh_Index = i
End Function

Private Function Get_Pers_Index(UID As Integer) As Integer
    For i = 0 To UBound(Pers)
        If UID = Pers(i).UID Then Exit For
    Next
    If i > UBound(Pers) Then Get_Pers_Index = -1 Else Get_Pers_Index = i
End Function

Private Sub List_pers(ByVal Arrival As String) 'обработка присланного списка персонала
    Dim Ar, arr, indexx As Integer, Eff As Long
    Ar = Split(Arrival, vbNewLine)
    ReDim Pers(0)
    
    If Pers_index.UBound > 0 Then
        For i = 1 To Pers_index.UBound
            Unload Pers_index(i)
        Next
        List1.Clear
    End If
    Eff = 0
    For i = 0 To UBound(Ar)
        arr = Split(Ar(i), "|")
        If UBound(arr) = 11 Then
            Add_pers_item arr(7), arr(0), arr(1), arr(2), arr(3), arr(4), arr(5), arr(6), arr(8), arr(9), arr(10)
            Eff = Eff + arr(10)
        End If
    Next
    'Eff = ((Eff / 3600) * 100) \ (day(Date) * 12)
    Eff = Eff \ (UBound(Pers) + 1)
    Ef_paint Pers_Win_s, 400 * 15, Pers_Win_s.Height - 570 - 6 * 15, Eff 'прорисовка эфективности в шапке персонала
    For i = 0 To List1.ListCount - 1
        Ar = Split(List1.List(i), "|")
        If i = 0 Then
            Pers_index(val(Ar(1))).Move 0, 0
        Else
            Pers_index(val(Ar(1))).Move 0, Pers_index(indexx).Top + Pers_index(indexx).Height + 6 * 15
        End If
        indexx = Ar(1)
    Next
    Frame_p.Height = (Pers_index(0).Height + 6 * 15) * (Pers_index.UBound + 1)
    If Pers_win.Height - Frame_p.Height > 0 Then Sc_p.Enabled = False: Frame_p.Top = 0: Sc_p.Top = 0 Else Sc_p.Enabled = True
End Sub


Private Sub List_teh(ByVal Arrival As String) 'обработка присланного списка техники
    Dim Ar, arr, indexx As Integer, Eff As Long
    'Ar = Split(Mid(Arrival, 2, Len(Arrival)), vbNewLine)
    Ar = Split(Arrival, vbNewLine)
    ReDim Teh(0)
    'Label7 = UBound(Ar) + 1
    If Teh_index.UBound > 0 Then
        For i = 1 To Teh_index.UBound
            Unload Teh_index(i)
        Next
        List2.Clear
    End If
    Eff = 0
    For i = 0 To UBound(Ar)
        arr = Split(Ar(i), "|")
        'MsgBox arr(13) & " " & arr(14)
        If UBound(arr) = 14 Then
            Add_teh_item arr(8), arr(0), arr(1), arr(2), arr(3), arr(4), arr(5), arr(6), arr(7), arr(9), arr(10), arr(11), arr(13), arr(14)
            Eff = Eff + arr(11)
        End If
    Next
    'Eff = Eff \ (i - 1)
    'Eff = ((Eff / 3600) * 100) \ (day(Date) * 12)
    Eff = Eff \ (UBound(Teh) + 1)
    Ef_paint Teh_Win_s, 400 * 15, Teh_Win_s.Height - 570 - 6 * 15, Eff
    For i = 0 To List2.ListCount - 1
        Ar = Split(List2.List(i), "|")
        If i = 0 Then
            Teh_index(val(Ar(1))).Move 0, 0
        Else
            Teh_index(val(Ar(1))).Move 0, Teh_index(indexx).Top + Teh_index(indexx).Height + 6 * 15
        End If
        indexx = Ar(1)
    Next
    Frame_t.Height = (Teh_index(0).Height + 6 * 15) * (Teh_index.UBound + 1)
    If Teh_win.Height - Frame_t.Height > 0 Then Sc_t.Enabled = False: Frame_t.Top = 0: Sc_t.Top = 0 Else Sc_t.Enabled = True
End Sub

Private Sub List_priv(ByVal Arrival As String) 'обработка присланного списка привязок
    Dim Ar, arr
    'Ar = Split(Mid(Arrival, 2, Len(Arrival)), vbNewLine)
    Ar = Split(Arrival, vbNewLine)
    If UBound(Ar) + 1 = UBound(Priv) Then
        'ReDim Priv(0)
        For i = 0 To UBound(Ar)
            arr = Split(Ar(i), "|")
            If UBound(arr) = 1 Then
                'If i > 0 Then ReDim Preserve Priv(i)
                Priv(i).UID_Teh = val(arr(0))
                Priv(i).UID_Pers = val(arr(1))
            End If
        Next
        eerty = Priv(UBound(Priv)).UID_Teh
        eerty = Priv(UBound(Priv)).UID_Pers
    End If
    If Menu_Priv.Visible Then
        If Mid(Menu_Priv.Tag, 1, 4) = "Pers" Then Pers_index_MouseDown val(Mid(Menu_Priv.Tag, 5, 3)), 2, 0, _
            Menu_Priv.Left - Pers_win.Left - Pers_index(val(Mid(Menu_Priv.Tag, 5, 3))).Left, _
                Menu_Priv.Top - Pers_win.Top - Pers_index(val(Mid(Menu_Priv.Tag, 5, 3))).Top
        If Mid(Menu_Priv.Tag, 1, 3) = "Teh" Then Teh_index_MouseDown val(Mid(Menu_Priv.Tag, 4, 3)), 2, 0, _
            Menu_Priv.Left - Teh_win.Left - Teh_index(val(Mid(Menu_Priv.Tag, 4, 3))).Left, _
                Menu_Priv.Top - Teh_win.Top - Teh_index(val(Mid(Menu_Priv.Tag, 4, 3))).Top
    End If
    Dopusk
End Sub

Public Sub MouseWheel(ByVal MouseKeys As Long, ByVal Rotation As Long, ByVal Xpos As Long, ByVal Ypos As Long)
  Dim ctl As Control
  Dim bHandled As Boolean
  Dim bOver As Boolean
  For Each ctl In Controls
    ' Is the mouse over the control
    On Error Resume Next
    bOver = (ctl.Visible And IsOver(ctl.hWnd, Xpos, Ypos))
    On Error GoTo 0
    
    If bOver Then
      ' If so, respond accordingly
      bHandled = True
      Select Case True
          
        Case Else
          bHandled = False
            If ctl.Name = "Pers_win" Or ctl.Name = "Sc_p" Or ctl.Name = "Pers_index" Or ctl.Name = "Pers_win_s" Or ctl.Name = "Frame_p" Then
              If Sc_p.Top < 0 Then
                  Sc_p.Top = 0
              ElseIf Sc_p.Top > Pers_win.Height - Sc_p.Height Then
                  Sc_p.Top = Pers_win.Height - Sc_p.Height
              Else
                  Sc_p.Top = Sc_p.Top + IIf(Rotation < 0, 5 * 15, -5 * 15)
                  If Sc_p.Top < 0 Then Sc_p.Top = 0
                  If Sc_p.Top > Pers_win.Height - Sc_p.Height Then Sc_p.Top = Pers_win.Height - Sc_p.Height
              End If
              Frame_p.Top = Sc_p.Top * (Pers_win.Height - Frame_p.Height) \ (Pers_win.Height - Sc_p.Height)
            ElseIf ctl.Name = "Teh_win" Or ctl.Name = "Sc_t" Or ctl.Name = "Teh_index" Or ctl.Name = "Teh_win_s" Or ctl.Name = "Frame_t" Then
              If Sc_t.Top < 0 Then
                  Sc_t.Top = 0
              ElseIf Sc_t.Top > Teh_win.Height - Sc_t.Height Then
                  Sc_t.Top = Teh_win.Height - Sc_t.Height
              Else
                  Sc_t.Top = Sc_t.Top + IIf(Rotation < 0, 5 * 15, -5 * 15)
                  If Sc_t.Top < 0 Then Sc_t.Top = 0
                  If Sc_t.Top > Teh_win.Height - Sc_t.Height Then Sc_t.Top = Teh_win.Height - Sc_t.Height
              End If
              Frame_t.Top = Sc_t.Top * (Teh_win.Height - Frame_t.Height) \ (Teh_win.Height - Sc_t.Height)
            End If
      End Select
      If bHandled Then Exit Sub
    End If
    bOver = False
  Next ctl
End Sub

