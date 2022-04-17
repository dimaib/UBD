VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Karta_t 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'Нет
   Caption         =   "Карта борта"
   ClientHeight    =   4215
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8175
   Icon            =   "r.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   8175
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox List_God 
      Height          =   315
      Left            =   5400
      TabIndex        =   23
      Text            =   "Combo1"
      Top             =   2520
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox List_Oc 
      Height          =   315
      Left            =   5400
      TabIndex        =   22
      Text            =   "Combo1"
      Top             =   2040
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox List_BCt 
      Height          =   315
      Left            =   5400
      TabIndex        =   21
      Text            =   "Combo1"
      Top             =   1560
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox List_n 
      Height          =   315
      Left            =   5400
      TabIndex        =   20
      Text            =   "Combo1"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox List_b 
      Height          =   315
      Left            =   5400
      TabIndex        =   19
      Text            =   "Combo1"
      Top             =   600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ComboBox List_t 
      Height          =   315
      Left            =   5400
      TabIndex        =   18
      Text            =   "Combo1"
      Top             =   120
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.PictureBox scroll_bar_full 
      Appearance      =   0  'Плоска
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'Нет
      ForeColor       =   &H80000008&
      Height          =   345
      Index           =   1
      Left            =   4440
      Picture         =   "r.frx":0442
      ScaleHeight     =   345
      ScaleWidth      =   3600
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   3600
      Width           =   3600
      Begin VB.PictureBox Scroll_bar 
         Appearance      =   0  'Плоска
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'Нет
         ForeColor       =   &H80000008&
         Height          =   315
         Index           =   1
         Left            =   225
         ScaleHeight     =   315
         ScaleWidth      =   3150
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   15
         Width           =   3150
         Begin VB.PictureBox Scroll 
            Appearance      =   0  'Плоска
            AutoSize        =   -1  'True
            BackColor       =   &H000000FF&
            BorderStyle     =   0  'Нет
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   1
            Left            =   1800
            Picture         =   "r.frx":3408
            ScaleHeight     =   255
            ScaleWidth      =   255
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   30
            Width           =   255
         End
         Begin VB.Label Label_cur 
            Alignment       =   2  'Центровка
            Appearance      =   0  'Плоска
            BackColor       =   &H00CCC5C2&
            Caption         =   "00.00"
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   240
            Index           =   1
            Left            =   945
            TabIndex        =   15
            Top             =   0
            Width           =   555
         End
      End
   End
   Begin VB.PictureBox scroll_bar_full 
      Appearance      =   0  'Плоска
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'Нет
      ForeColor       =   &H80000008&
      Height          =   345
      Index           =   0
      Left            =   4440
      Picture         =   "r.frx":586B
      ScaleHeight     =   345
      ScaleWidth      =   3600
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   3120
      Width           =   3600
      Begin VB.PictureBox Scroll_bar 
         Appearance      =   0  'Плоска
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'Нет
         ForeColor       =   &H80000008&
         Height          =   315
         Index           =   0
         Left            =   225
         ScaleHeight     =   315
         ScaleWidth      =   3150
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   15
         Width           =   3150
         Begin VB.PictureBox Scroll 
            Appearance      =   0  'Плоска
            AutoSize        =   -1  'True
            BackColor       =   &H000000FF&
            BorderStyle     =   0  'Нет
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   1800
            Picture         =   "r.frx":8831
            ScaleHeight     =   255
            ScaleWidth      =   255
            TabIndex        =   10
            TabStop         =   0   'False
            Top             =   30
            Width           =   255
         End
         Begin VB.Label Label_cur 
            Alignment       =   2  'Центровка
            Appearance      =   0  'Плоска
            BackColor       =   &H00CCC5C2&
            Caption         =   "00.00"
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   9
               Charset         =   204
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   240
            Index           =   0
            Left            =   945
            TabIndex        =   11
            Top             =   0
            Width           =   555
         End
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   120
      Top             =   3120
   End
   Begin MSComCtl2.MonthView Calend 
      Height          =   2310
      Left            =   2880
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   2460
      _ExtentX        =   4339
      _ExtentY        =   4075
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   0
      StartOfWeek     =   97058818
      CurrentDate     =   43383
   End
   Begin VB.PictureBox List_m 
      Appearance      =   0  'Плоска
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2535
      Left            =   0
      ScaleHeight     =   2505
      ScaleWidth      =   2760
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   2790
      Begin VB.Label Item 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "Segoe UI"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C0C0&
         Height          =   315
         Index           =   0
         Left            =   0
         TabIndex        =   2
         Top             =   0
         Width           =   2775
      End
   End
   Begin VB.TextBox Pol_teh 
      Appearance      =   0  'Плоска
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
      Index           =   1
      Left            =   720
      MaxLength       =   50
      TabIndex        =   7
      Top             =   2760
      Width           =   2670
   End
   Begin VB.TextBox Pol_teh 
      Appearance      =   0  'Плоска
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
      Index           =   2
      Left            =   720
      MaxLength       =   50
      TabIndex        =   6
      Top             =   3120
      Width           =   2670
   End
   Begin VB.TextBox Pol_teh 
      Appearance      =   0  'Плоска
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
      Index           =   3
      Left            =   720
      MaxLength       =   50
      TabIndex        =   5
      Top             =   3480
      Width           =   2670
   End
   Begin VB.TextBox Pol_teh 
      Appearance      =   0  'Плоска
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
      Index           =   4
      Left            =   720
      MaxLength       =   50
      TabIndex        =   4
      Top             =   3840
      Width           =   2670
   End
   Begin VB.Label Scroll_lb 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Прозрачно
      Caption         =   "Порог уд."
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H009C928C&
      Height          =   240
      Index           =   1
      Left            =   3840
      TabIndex        =   17
      Top             =   2880
      Width           =   1080
   End
   Begin VB.Label Scroll_lb 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Прозрачно
      Caption         =   "Огран Z"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H009C928C&
      Height          =   240
      Index           =   0
      Left            =   3840
      TabIndex        =   16
      Top             =   2640
      Width           =   840
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Прозрачно
      Caption         =   "Label1"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   2760
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "Karta_t"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Obj_m As Object
Dim cur_index, xx

Public Sub Calend_DateClick(ByVal DateClicked As Date)
    Me.Line (546 * 15, 87 * 15)-(10395, 1635), QBColor(15), BF
    Me.CurrentX = 546 * 15: Me.CurrentY = 89 * 15
    Calend.Visible = False
    Date_r = DateClicked
    Me.Print Date_r
End Sub

Public Sub Form_Load()
    Me.Cls
    Me.Width = 739 * 15: Me.Height = 492 * 15
    LoadImage App.Path & "\res\" & "add_t.png", Me.hdc, 0, 0 'фон окна редактирования персонажа
    LoadImage App.Path & "\res\" & "circle.png", Me.hdc, 21, 46 'фон окна редактирования персонажа
    
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print IIf(Me.Tag <> "", "Редактирование борта", "Новый борт")

    Pol_teh(1).Move 545 * 15, 148 * 15 'номер
    Pol_teh(2).Move 210 * 15, 323 * 15 'Гп
    Pol_teh(3).Move 545 * 15, 323 * 15 'Вп
    Pol_teh(4).Move 545 * 15, 208 * 15 'Гос. номер
    
    scroll_bar_full(0).Move 486 * 15, 360 * 15: set_pos_scroll 0, 10.45
    scroll_bar_full(1).Move 486 * 15, scroll_bar_full(0).Top + scroll_bar_full(0).Height + 8 * 15: set_pos_scroll 1, 45
    Scroll_lb(0).Move scroll_bar_full(0).Left - Scroll_lb(0).Width - 60, scroll_bar_full(0).Top + scroll_bar_full(0).Height \ 2 - Scroll_lb(0).Height \ 2
    Scroll_lb(1).Move scroll_bar_full(1).Left - Scroll_lb(1).Width - 60, scroll_bar_full(1).Top + scroll_bar_full(1).Height \ 2 - Scroll_lb(1).Height \ 2
    
    
    LoadImage App.Path & "\res\" & IIf(Me.Tag <> "", "save_but.png", "add_but_t.png"), Me.hdc, 110, 430 '671 'логотип градиента шапка
    If Me.Tag <> "" Then LoadImage App.Path & "\res\" & "del_but.png", Me.hdc, 300, 430
    If Me.Tag <> "" Then LoadImage App.Path & "\res\note_but.PNG", Me.hdc, 490, 430  'добавление кнопки заметки
    Me.Refresh
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 10635 And Y <= 375 Then Karta_t.Visible = False: Form1.Enabled = True: Form1.Show   'Выход, нажатие крестика
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If List_m.Visible Then List_m.Visible = False
    If Calend.Visible Then Calend.Visible = False
    If Button = 1 Then
        If X >= 3075 And X <= 5850 And Y >= 1155 And Y <= 1725 Then 'тип
            List_m.Move 3075, 1725
            Add_item List_t
            List_m.Visible = True
        ElseIf X >= 3075 And X <= 5850 And Y >= 2070 And Y <= 2640 Then 'бренд
            List_m.Move 3075, 2640
            Add_item List_b
            List_m.Visible = True
        ElseIf X >= 3075 And X <= 5850 And Y >= 2985 And Y <= 3540 And List_n.ListCount > 0 Then 'модель
            List_m.Move 3075, 3555
            Add_item List_n
            List_m.Visible = True
        ElseIf X >= 3075 And X <= 5850 And Y >= 5640 And Y <= 6195 Then  'оценка
            Add_item List_Oc
            List_m.Move 3060, Me.Height - List_m.Height - 15
            List_m.Visible = True
        ElseIf X >= 8100 And X <= 10890 And Y >= 1155 And Y <= 1710 Then 'лист календарь
            Add_item List_God
            List_m.Move 8100, 1725
            List_m.Visible = True
        ElseIf X >= 1650 And X <= 4320 And Y >= 6450 And Y <= 7050 Then  'кнопка добавить\редактировать
            For i = 1 To Pol_teh.UBound
                Pol_teh(i) = Trim(Pol_teh(i))
            Next
            If Trim(Pol_teh(1)) = "" Then n = n + 1
            Pol_teh(1).Tag = ""
            For i = 0 To UBound(Teh)
                If val(Pol_teh(1)) = Teh(i).ID And val(Karta_t.Tag) <> i Then Pol_teh(1).Tag = "1": Exit For
            Next
            If List_t.ListIndex = -1 Then n = n + 1
            If List_b.ListIndex = -1 Then n = n + 1
            If List_n.ListIndex = -1 Then n = n + 1
            If List_God.ListIndex = -1 Then n = n + 1
            If n > 0 Or i < UBound(Teh) + 1 Then
                If n > 0 Then a = "Заполните все поля!"
                If i < UBound(Teh) + 1 Then a = a & vbNewLine & "Данный номер борта [" & Pol_teh(1) & "] уже существует!"
                MsgBox a
            Else
                If Me.Tag <> "" Then 'редактирование
                    Teh(Me.Tag).Type = List_t.ListIndex + 1: Teh(Me.Tag).Brend = List_b.ListIndex + 1
                    Teh(Me.Tag).Model = List_n.ListIndex + 1: Teh(Me.Tag).God = Date_r: Teh(Me.Tag).ID = Pol_teh(1): Teh(Me.Tag).Gnomer = Pol_teh(4)
                    Teh(Me.Tag).Gp = Pol_teh(2): Teh(Me.Tag).Vp = Pol_teh(3): Teh(Me.Tag).Ocenka = List_Oc.ListIndex + 1
                    Teh(Me.Tag).Porog_X = Label_cur(1): Teh(Me.Tag).Porog_Z = Label_cur(0): Paint_teh_item Me.Tag
                Else 'добавление
                    Add_teh_item Pol_teh(1), List_t.ListIndex + 1, List_b.ListIndex + 1, List_n.ListIndex + 1, _
                        Pol_teh(2), Pol_teh(3), Date_r, Pol_teh(4), List_God.ListIndex + 1, Max_UID("teh"), "1", "0", Label_cur(1), Label_cur(0)
                    For i = 0 To Form1.List2.ListCount - 1
                        Ar = Split(Form1.List2.List(i), "|")
                        If i = 0 Then
                            Form1.Teh_index(val(Ar(1))).Move 0, 0
                        Else
                            Form1.Teh_index(val(Ar(1))).Move 0, Form1.Teh_index(indexx).Top + Form1.Teh_index(indexx).Height + 6 * 15
                        End If
                        indexx = Ar(1)
                        Form1.Teh_index(i).Visible = True
                    Next
                    Form1.Frame_t.Height = (Form1.Teh_index(0).Height + 6 * 15) * (Form1.Teh_index.UBound + 1)
                    If Form1.Teh_win.Height - Form1.Frame_t.Height > 0 Then Form1.Sc_t.Enabled = False: Form1.Frame_t.Top = 0: Form1.Sc_t.Top = 0 Else Form1.Sc_t.Enabled = True
                End If
                Form1.WinS.SendData IIf(Me.Tag <> "", "@Edit_Teh@", "@Add_Teh@") & List_t.ListIndex + 1 & "|" & List_b.ListIndex + 1 & "|" & List_n.ListIndex + 1 & "|" & _
                    Pol_teh(2) & "|" & Pol_teh(3) & "|" & List_God.ListIndex + 1 & "|" & Pol_teh(4) & "|" & List_Oc.ListIndex + 1 & "|" & Pol_teh(1) & "|" & _
                        IIf(Me.Tag <> "", Teh(val(Karta_t.Tag)).UID, Max_UID("teh")) & "|1" & "|" & Label_cur(1) & "|" & Label_cur(0)
                Karta_t.Visible = False: Form1.Enabled = True: Form1.Show
            End If
        ElseIf X >= 4500 And X <= 7170 And Y >= 6450 And Y <= 7065 And Me.Tag <> "" Then  'кнопка Удалить
            uiddd = Teh(Me.Tag).UID
            If val(Me.Tag) < UBound(Teh) Then
                For i = val(Karta_t.Tag) To UBound(Teh) - 1 '''''''''''''''''''
                    Teh(i).Brend = Teh(i + 1).Brend: Teh(i).Effect = Teh(i + 1).Effect: Teh(i).Gnomer = Teh(i + 1).Gnomer
                    Teh(i).God = Teh(i + 1).God: Teh(i).Gp = Teh(i + 1).Gp: Teh(i).ID = Teh(i + 1).ID: Teh(i).Model = Teh(i + 1).Model: Teh(i).Ocenka = Teh(i + 1).Ocenka
                    Teh(i).Prava = Teh(i + 1).Prava: Teh(i).Type = Teh(i + 1).Type: Teh(i).UID = Teh(i + 1).UID: Teh(i).Vp = Teh(i + 1).Vp
                    Teh(i).Porog_X = Teh(i + 1).Porog_X: Teh(i).Porog_Z = Teh(i + 1).Porog_Z: Paint_teh_item i
                Next ''''''''''''''''''''
            End If
            ReDim Preserve Teh(UBound(Teh) - 1)
            Unload Form1.Teh_index(Form1.Teh_index.UBound)
            Form1.Frame_t.Height = (Form1.Teh_index(0).Height + 6 * 15) * (Form1.Teh_index.UBound + 1)
            If Form1.Teh_win.Height - Form1.Frame_t.Height > 0 Then Form1.Sc_t.Enabled = False: Form1.Frame_t.Top = 0: Form1.Sc_t.Top = 0 Else Form1.Sc_t.Enabled = True
            Form1.List2.Clear
            For i = 0 To UBound(Teh)
                Form1.List2.AddItem Teh(i).Vp & "|" & i
            Next
            For i = 0 To Form1.List2.ListCount - 1
                Ar = Split(Form1.List2.List(i), "|")
                If i = 0 Then
                    Form1.Teh_index(val(Ar(1))).Move 0, 0
                Else
                    Form1.Teh_index(val(Ar(1))).Move 0, Form1.Teh_index(indexx).Top + Form1.Teh_index(indexx).Height + 6 * 15
                End If
                indexx = Ar(1)
            Next
            Form1.WinS.SendData "@Del_Teh@" & uiddd
            Karta_t.Visible = False: Form1.Enabled = True: Form1.Show
        ElseIf X >= 7365 And X <= 9435 And Y >= 6450 And Y <= 7065 And Me.Tag <> "" Then 'кнопка Заметки
            Note_UID = Teh(Me.Tag).UID
            Note_Type = "2"
            Form1.WinS.SendData "NoteList:" & Teh(Me.Tag).UID & "|" & "2"
            Form4.Visible = True
            Me.Enabled = False
        End If
    End If
End Sub

Private Sub Item_Click(Index As Integer)
    Obj_m.ListIndex = Index
    List_m.Visible = False
End Sub

Private Sub Item_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    col1 = &HC0C0C0
    col2 = QBColor(15)
    For i = 0 To Item.UBound
        If i <> Index Then Item(i).BackColor = col2: Item(i).ForeColor = col1 Else Item(i).BackColor = col1: Item(i).ForeColor = col2
    Next
End Sub

Private Sub List_b_Click()
    'MsgBox "456"
    If List_b.ListIndex > -1 Then
        Me.Line (210 * 15, 147 * 15)-(5400, 2490), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 149 * 15
        Me.Print List_b.List(List_b.ListIndex)
    End If
    List_t_Click
    List_b.BackColor = &HFFFFFF
    List_n.BackColor = &HCFCEFF
End Sub

Private Sub List_God_Click()
    If List_God.ListIndex > -1 Then
        Me.Line (546 * 15, 87 * 15)-(10395, 1635), QBColor(15), BF
        Me.CurrentX = 546 * 15: Me.CurrentY = 89 * 15
        Me.Print List_God.List(List_God.ListIndex)
    End If
End Sub

Private Sub List_n_Click()
    If List_n.ListIndex > -1 Then
        Me.Line (210 * 15, 207 * 15)-(5400, 3435), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 211 * 15
        Me.Print List_n.List(List_n.ListIndex)
    End If
    
    If List_n.ListIndex > -1 Then
        LoadImage Get_Icon(List_b.ListIndex + 1, List_t.ListIndex + 1, List_n.ListIndex + 1), Me.hdc, 26, 51, 50, 50
        LoadImage App.Path & "\res\" & "circle.png", Me.hdc, 21, 46 'фон окна редактирования персонажа
    End If
End Sub

Private Sub List_Oc_Click()
    If List_Oc.ListIndex > -1 Then
        Me.Line (210 * 15, 385 * 15)-(5400, 404 * 15), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 387 * 15
        Me.Print List_Oc.List(List_Oc.ListIndex)
    End If
    
End Sub

Private Sub List_t_Click()
    'MsgBox "123"
    List_n.Clear
    If List_t.ListIndex > -1 Then
        Me.Line (210 * 15, 89 * 15)-(5400, 1590), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 89 * 15
        Me.Print List_t.List(List_t.ListIndex)
    End If
    If List_t.ListIndex = 0 And List_b.ListIndex = 0 Then 'Jungheinrich
        For i = 0 To UBound(t_t.Electrotel.Jungheinrich)
            List_n.AddItem t_t.Electrotel.Jungheinrich(i)
        Next
    ElseIf List_t.ListIndex = 1 And List_b.ListIndex = 0 Then
        For i = 0 To UBound(t_t.Shtab.Jungheinrich)
            List_n.AddItem t_t.Shtab.Jungheinrich(i)
        Next
    ElseIf List_t.ListIndex = 2 And List_b.ListIndex = 0 Then
        For i = 0 To UBound(t_t.Electropogruz.Jungheinrich)
            List_n.AddItem t_t.Electropogruz.Jungheinrich(i)
        Next
    ElseIf List_t.ListIndex = 3 And List_b.ListIndex = 0 Then
        For i = 0 To UBound(t_t.Rich.Jungheinrich)
            List_n.AddItem t_t.Rich.Jungheinrich(i)
        Next
    ElseIf List_t.ListIndex = 4 And List_b.ListIndex = 0 Then
        For i = 0 To UBound(t_t.Komplect.Jungheinrich)
            List_n.AddItem t_t.Komplect.Jungheinrich(i)
        Next
    ElseIf List_t.ListIndex = 5 And List_b.ListIndex = 0 Then
        For i = 0 To UBound(t_t.Uzkoprohod.Jungheinrich)
            List_n.AddItem t_t.Uzkoprohod.Jungheinrich(i)
        Next
        
    ElseIf List_t.ListIndex = 0 And List_b.ListIndex = 1 Then ' Linde
        For i = 0 To UBound(t_t.Electrotel.Linde)
            List_n.AddItem t_t.Electrotel.Linde(i)
        Next
    ElseIf List_t.ListIndex = 1 And List_b.ListIndex = 1 Then
        For i = 0 To UBound(t_t.Shtab.Linde)
            List_n.AddItem t_t.Shtab.Linde(i)
        Next
    ElseIf List_t.ListIndex = 2 And List_b.ListIndex = 1 Then
        For i = 0 To UBound(t_t.Electropogruz.Linde)
            List_n.AddItem t_t.Electropogruz.Linde(i)
        Next
    ElseIf List_t.ListIndex = 3 And List_b.ListIndex = 1 Then
        For i = 0 To UBound(t_t.Rich.Linde)
            List_n.AddItem t_t.Rich.Linde(i)
        Next
    ElseIf List_t.ListIndex = 4 And List_b.ListIndex = 1 Then
        For i = 0 To UBound(t_t.Komplect.Linde)
            List_n.AddItem t_t.Komplect.Linde(i)
        Next
    ElseIf List_t.ListIndex = 5 And List_b.ListIndex = 1 Then
        For i = 0 To UBound(t_t.Uzkoprohod.Linde)
            List_n.AddItem t_t.Uzkoprohod.Linde(i)
        Next
        
    ElseIf List_t.ListIndex = 0 And List_b.ListIndex = 2 Then 'Still
        For i = 0 To UBound(t_t.Electrotel.Still)
            List_n.AddItem t_t.Electrotel.Still(i)
        Next
    ElseIf List_t.ListIndex = 1 And List_b.ListIndex = 2 Then
        For i = 0 To UBound(t_t.Shtab.Still)
            List_n.AddItem t_t.Shtab.Still(i)
        Next
    ElseIf List_t.ListIndex = 2 And List_b.ListIndex = 2 Then
        For i = 0 To UBound(t_t.Electropogruz.Still)
            List_n.AddItem t_t.Electropogruz.Still(i)
        Next
    ElseIf List_t.ListIndex = 3 And List_b.ListIndex = 2 Then
        For i = 0 To UBound(t_t.Rich.Still)
            List_n.AddItem t_t.Rich.Still(i)
        Next
    ElseIf List_t.ListIndex = 4 And List_b.ListIndex = 2 Then
        For i = 0 To UBound(t_t.Komplect.Still)
            List_n.AddItem t_t.Komplect.Still(i)
        Next
    ElseIf List_t.ListIndex = 5 And List_b.ListIndex = 2 Then
        For i = 0 To UBound(t_t.Uzkoprohod.Still)
            List_n.AddItem t_t.Uzkoprohod.Still(i)
        Next
        
    ElseIf List_t.ListIndex = 0 And List_b.ListIndex = 3 Then 'BT
        For i = 0 To UBound(t_t.Electrotel.BT)
            List_n.AddItem t_t.Electrotel.BT(i)
        Next
    ElseIf List_t.ListIndex = 1 And List_b.ListIndex = 3 Then
        For i = 0 To UBound(t_t.Shtab.BT)
            List_n.AddItem t_t.Shtab.BT(i)
        Next
    ElseIf List_t.ListIndex = 2 And List_b.ListIndex = 3 Then
        For i = 0 To UBound(t_t.Electropogruz.BT)
            List_n.AddItem t_t.Electropogruz.BT(i)
        Next
    ElseIf List_t.ListIndex = 3 And List_b.ListIndex = 3 Then
        For i = 0 To UBound(t_t.Rich.BT)
            List_n.AddItem t_t.Rich.BT(i)
        Next
    ElseIf List_t.ListIndex = 4 And List_b.ListIndex = 3 Then
        For i = 0 To UBound(t_t.Komplect.BT)
            List_n.AddItem t_t.Komplect.BT(i)
        Next
    ElseIf List_t.ListIndex = 5 And List_b.ListIndex = 3 Then
        For i = 0 To UBound(t_t.Uzkoprohod.BT)
            List_n.AddItem t_t.Uzkoprohod.BT(i)
        Next
    End If
    List_t.BackColor = &HFFFFFF
    List_n.BackColor = &HCFCEFF
End Sub



Private Sub Clear()
    If Item.UBound > 0 Then
        For i = 1 To Item.UBound
            Unload Item(i)
        Next
    End If
End Sub

Private Sub Add_item(Obj As Object)
    Clear
    Set Obj_m = Obj
    Item(i).BackColor = QBColor(15): Item(i).ForeColor = &HC0C0C0
    For i = 0 To Obj.ListCount - 1
        If i > 0 Then Load Item(i): Item(i).Top = Item(i - 1).Top + Item(i).Height
        Item(i) = Obj.List(i)
        Item(i).Visible = True
    Next
    List_m.Height = Item(i - 1).Top + Item(i - i).Height + 30
End Sub

Private Sub Pol_teh_Change(Index As Integer)
    If val(Pol_teh(1)) > 255 Then
        Pol_teh(1) = 255: Pol_teh(1).SelStart = 0: Pol_teh(1).SelLength = Len(Pol_teh(1))
    ElseIf val(Pol_teh(1)) < 1 Then
        Pol_teh(1) = 1: Pol_teh(1).SelStart = 0: Pol_teh(1).SelLength = Len(Pol_teh(1))
    End If
    Tx_reserv Pol_teh(Index)
End Sub

Private Sub Pol_teh_KeyPress(Index As Integer, KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And Index = 1 Then KeyAscii = 0
End Sub

Private Sub scroll_bar_full_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Index = 0 Then kff = 10000: kfff = 880: delim = 100 Else kff = 150: kfff = 13: delim = 1
    If X < scroll_bar_full(Index).Width \ 2 Then
        X = Scroll(Index).Left - 15
        If X < 0 Then X = 0
    Else
        X = Scroll(Index).Left + 15
        If X + Scroll(Index).Width > Scroll_bar(Index).Width Then X = Scroll_bar(Index).Width - Scroll(Index).Width
    End If
    Scroll(Index).Left = X
    Label_cur(Index).Caption = (((Scroll(Index).Left + Scroll(Index).Width) * kff) \ ((Scroll_bar(Index).Width) - Scroll(Index).Width) - kfff) / delim
    If Scroll(Index).Left <= Scroll_bar(Index).Width \ 2 Then
        X = Scroll(Index).Left + Scroll(Index).Width + 30
    Else
        X = Scroll(Index).Left - Label_cur(Index).Width - 30
    End If
    Label_cur(Index).Move X, Scroll_bar(Index).Height \ 2 - Label_cur(Index).Height \ 2
End Sub

Private Sub Scroll_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    xx = X
    cur_index = Index
    Timer1.Enabled = True
End Sub

Private Sub Scroll_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Timer1.Enabled = False
    cur_index = 0
End Sub

Private Sub Timer1_Timer()
    Dim Cur_x
    rrr = 60
    GetCursorPos Cur
    Cur_x = Cur.X * 15 - Me.Left - Scroll_bar(cur_index).Left - scroll_bar_full(cur_index).Left - xx ' - 30
    If Cur_x < 0 Then
        Cur_x = 0
    ElseIf Cur_x + Scroll(cur_index).Width > Scroll_bar(cur_index).Width Then
        Cur_x = Scroll_bar(cur_index).Width - Scroll(cur_index).Width
    End If
    Scroll(cur_index).Move Cur_x
    If Scroll(cur_index).Left <= Scroll_bar(cur_index).Width \ 2 Then
        Cur_x = Scroll(cur_index).Left + Scroll(cur_index).Width + 30
    Else
        Cur_x = Scroll(cur_index).Left - Label_cur(cur_index).Width - 30
    End If
    If cur_index = 0 Then kff = 10000: kfff = 880: delim = 100 Else kff = 150: kfff = 13: delim = 1
    Label_cur(cur_index).Move Cur_x, Scroll_bar(cur_index).Height \ 2 - Label_cur(cur_index).Height \ 2
    Label_cur(cur_index).Caption = (((Scroll(cur_index).Left + Scroll(cur_index).Width) * kff) \ ((Scroll_bar(cur_index).Width) - Scroll(cur_index).Width) - kfff) / delim
End Sub



