VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Karta_p 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Карта сотрудника"
   ClientHeight    =   2775
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11910
   BeginProperty Font 
      Name            =   "Segoe UI Light"
      Size            =   8.25
      Charset         =   204
      Weight          =   300
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Karta_pers.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2775
   ScaleWidth      =   11910
   StartUpPosition =   2  'CenterScreen
   Begin MSComCtl2.MonthView Calend 
      Height          =   2310
      Left            =   3000
      TabIndex        =   10
      Top             =   120
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   4075
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   0
      StartOfWeek     =   102694914
      CurrentDate     =   43383
   End
   Begin VB.PictureBox List_m 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2535
      Left            =   120
      ScaleHeight     =   2505
      ScaleWidth      =   2760
      TabIndex        =   7
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
         TabIndex        =   8
         Top             =   0
         Width           =   2775
      End
   End
   Begin VB.TextBox Pol_pers 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
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
      Left            =   9120
      MaxLength       =   50
      TabIndex        =   2
      Top             =   1200
      Width           =   2670
   End
   Begin VB.TextBox Pol_pers 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
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
      Left            =   9120
      MaxLength       =   50
      TabIndex        =   3
      Top             =   1680
      Width           =   2670
   End
   Begin VB.TextBox Pol_pers 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
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
      Left            =   9120
      MaxLength       =   50
      TabIndex        =   1
      Top             =   720
      Width           =   2670
   End
   Begin VB.TextBox Pol_pers 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
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
      Index           =   0
      Left            =   9120
      MaxLength       =   50
      TabIndex        =   0
      Top             =   240
      Width           =   2670
   End
   Begin VB.TextBox Pol_pers 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
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
      Left            =   9120
      MaxLength       =   50
      TabIndex        =   12
      Top             =   2160
      Width           =   2670
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Left            =   5520
      TabIndex        =   11
      Top             =   2040
      Visible         =   0   'False
      Width           =   2055
   End
   Begin MSForms.ComboBox List_Oc 
      Height          =   375
      Left            =   5520
      TabIndex        =   9
      Top             =   1560
      Visible         =   0   'False
      Width           =   3495
      VariousPropertyBits=   746604571
      BorderStyle     =   1
      DisplayStyle    =   7
      Size            =   "6165;661"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      SpecialEffect   =   0
      FontHeight      =   240
      FontCharSet     =   204
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox List_p 
      Height          =   375
      Left            =   5520
      TabIndex        =   6
      Top             =   120
      Visible         =   0   'False
      Width           =   3495
      VariousPropertyBits=   746604571
      BorderStyle     =   1
      DisplayStyle    =   7
      Size            =   "6165;661"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      SpecialEffect   =   0
      FontHeight      =   240
      FontCharSet     =   204
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox List_BCp 
      Height          =   375
      Left            =   5520
      TabIndex        =   5
      Top             =   600
      Visible         =   0   'False
      Width           =   3495
      VariousPropertyBits=   746604571
      BorderStyle     =   1
      DisplayStyle    =   7
      Size            =   "6165;661"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      SpecialEffect   =   0
      FontHeight      =   240
      FontCharSet     =   204
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox List_Sex 
      Height          =   375
      Left            =   5520
      TabIndex        =   4
      Top             =   1080
      Visible         =   0   'False
      Width           =   3495
      VariousPropertyBits=   746604571
      BorderStyle     =   1
      DisplayStyle    =   7
      Size            =   "6165;661"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      SpecialEffect   =   0
      FontHeight      =   240
      FontCharSet     =   204
      FontPitchAndFamily=   2
   End
End
Attribute VB_Name = "Karta_p"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Obj_m As Object

Public Sub Form_Load()
    Me.Cls
    LoadImage App.Path & "\res\" & "add_p.png", Me.hdc, 0, 0 'фон окна редактирования персонажа
    LoadImage App.Path & "\res\" & "Logo_user.png", Me.hdc, 21, 46 'фон окна редактирования персонажа
    Me.Width = 739 * 15: Me.Height = 589 * 15
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print IIf(Me.Tag <> "", "Редактирование сотрудника", "Новый сотрудник")
    Pol_pers(0).Move 209 * 15, 87 * 15 'Фамилия
    Pol_pers(1).Move 209 * 15, 148 * 15 'Имя
    Pol_pers(2).Move 209 * 15, 209 * 15 'Отчество
    Pol_pers(3).Move 209 * 15, 476 * 15, 510 * 15 'RFID
    Pol_pers(4).Move 209 * 15, 373 * 15 'Права
    LoadImage App.Path & "\res\" & IIf(Me.Tag <> "", "save_but.png", "add_but.png"), Me.hdc, 110, 527 'установка кнопки добавить или сохранить
    If Me.Tag <> "" Then LoadImage App.Path & "\res\note_but.PNG", Me.hdc, 491, 527  'добавление кнопки заметки
    If Me.Tag <> "" Then LoadImage App.Path & "\res\" & "del_but.png", Me.hdc, 300, 527
End Sub

Private Sub Clear()
    If Item.ubound > 0 Then
        For i = 1 To Item.ubound
            Unload Item(i)
        Next
    End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If List_m.Visible Then List_m.Visible = False
    If Calend.Visible Then Calend.Visible = False
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 10635 And Y <= 375 Then Karta_p.Visible = False: Form1.Enabled = True: Form1.Show   'Выход, нажатие крестика
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1 = X & "x" & Y
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If X >= 3075 And X <= 5850 And Y >= 4515 And Y <= 5070 Then 'лист оператора
            List_m.Move 3075, 5080
            Add_item List_p
            List_m.Visible = True
'        ElseIf X >= 3075 And X <= 5850 And Y >= 5430 And Y <= 6000 Then 'лист прав
'            List_m.Move 3075, 6000
'            Add_item List_BCp
'            List_m.Visible = True
        ElseIf X >= 8100 And X <= 10890 And Y >= 2070 And Y <= 2640 Then 'лист пол сотрудника
            List_m.Move 8100, 2640
            Add_item List_Sex
            List_m.Visible = True
        ElseIf X >= 8100 And X <= 10890 And Y >= 4515 And Y <= 5070 Then 'лист оценка
            List_m.Move 8100, 5070
            Add_item List_Oc
            List_m.Visible = True
        ElseIf X >= 8100 And X <= 10890 And Y >= 1155 And Y <= 1710 Then 'лист календарь
            Calend.Visible = True
            Calend.Move 8100, 1725
        'ElseIf X >= 1650 And X <= 4335 And Y >= 7905 And Y <= 8505 And Pers(Me.Tag).Ism_Kard Then  'кнопка добавить/сохранить
        ElseIf X >= 1650 And X <= 4335 And Y >= 7905 And Y <= 8505 Then   'кнопка добавить/сохранить
            'MsgBox Pers(Me.Tag).Ism_Kard
            If Trim(Pol_pers(0)) = "" Then n = n + 1
            If Trim(Pol_pers(1)) = "" Then n = n + 1
            For i = 0 To Pol_pers.ubound
                Pol_pers(i) = Trim$(Pol_pers(i))
            Next
            If Val(Pol_pers(3)) > 0 Then
                For i = 0 To UBound(Pers)
                    If Val(Pol_pers(3)) = Pers(i).RFID And Val(Karta_p.Tag) <> i Then Pol_pers(3).BackColor = &HCFCEFF: Exit For
                Next
            Else
                Pol_pers(3).BackColor = &HCFCEFF
                i = UBound(Pers) + 1
                n = n + 1
            End If
            If List_p.ListIndex = -1 Then n = n + 1
            If List_Sex.ListIndex = -1 Then n = n + 1
            If List_Oc.ListIndex = -1 Then n = n + 1
            If n > 0 Or i <= UBound(Pers) Then
                If n > 0 Then a = "Заполните корректно все обязательные поля!"
                If i < UBound(Pers) + 1 Then _
                    a = a & vbNewLine & "Данная карта [" & Pol_pers(3) & "] уже существует и принадлежит:" & vbNewLine & Pers(i).Surname & " " & Pers(i).Name
                MsgBox a
            Else
                If Me.Tag <> "" Then 'редактирование
                    Pers(Me.Tag).Surname = Pol_pers(0): Pers(Me.Tag).Name = Pol_pers(1): Pers(Me.Tag).Lastname = Pol_pers(2)
                    Pers(Me.Tag).Position = List_p.ListIndex + 1: Pers(Me.Tag).RFID = Pol_pers(3): Pers(Me.Tag).Date = Date_r
                    Pers(Me.Tag).Ocenka = List_Oc.ListIndex + 1: Pers(Me.Tag).Prava = Pol_pers(4) 'Pers(Me.Tag).Prava = List_BCp.ListIndex + 1
                    Pers(Me.Tag).Sex = List_Sex.ListIndex + 1: Paint_pers_item Me.Tag
                Else 'добавление
                    'Add_pers_item Max_UID("pers"), Pol_pers(0), Pol_pers(1), Pol_pers(2), List_p.ListIndex + 1, Pol_pers(3), _
                         Date_r, List_Oc.ListIndex + 1, List_BCp.ListIndex + 1, List_Sex.ListIndex + 1, "0"
                    Add_pers_item Max_UID("pers"), Pol_pers(0), Pol_pers(1), Pol_pers(2), List_p.ListIndex + 1, Pol_pers(3), _
                         Date_r, List_Oc.ListIndex + 1, Pol_pers(4), List_Sex.ListIndex + 1, "0"
                    For i = 0 To Form1.List1.ListCount - 1
                        Ar = Split(Form1.List1.List(i), "|")
                        If i = 0 Then
                            Form1.Pers_index(Val(Ar(1))).Move 0, 0
                        Else
                            Form1.Pers_index(Val(Ar(1))).Move 0, Form1.Pers_index(indexx).Top + Form1.Pers_index(indexx).Height + 6 * 15
                        End If
                        indexx = Ar(1)
                    Next
                    Form1.Frame_p.Height = (Form1.Pers_index(0).Height + 6 * 15) * (Form1.Pers_index.ubound + 1)
                    If Form1.Pers_win.Height - Form1.Frame_p.Height > 0 Then Form1.Sc_p.Enabled = False: Form1.Frame_p.Top = 0: Form1.Sc_p.Top = 0 Else Form1.Sc_p.Enabled = True
                End If
                'Form1.WinS.SendData IIf(Me.Tag <> "", "@Edit_Pers@", "@Add_Pers@") & Pol_pers(0) & "|" & Pol_pers(1) & "|" & Pol_pers(2) & "|" & _
                    List_p.ListIndex + 1 & "|" & Pol_pers(3) & "|" & Date_r & "|" & List_Oc.ListIndex + 1 & "|" & _
                        IIf(Me.Tag <> "", Pers(Val(Karta_p.Tag)).UID, Max_UID("pers")) & "|" & _
                            List_BCp.ListIndex + 1 & "|" & List_Sex.ListIndex + 1
                tyu = IIf(Me.Tag <> "", "@Edit_Pers@", "@Add_Pers@") & Pol_pers(0) & "|" & Pol_pers(1) & "|" & Pol_pers(2) & "|" & _
                    List_p.ListIndex + 1 & "|" & Pol_pers(3) & "|" & Date_r & "|" & List_Oc.ListIndex + 1 & "|" & _
                        IIf(Me.Tag <> "", Pers(Val(Karta_p.Tag)).UID, Max_UID("pers")) & "|" & _
                            Pol_pers(4) & "|" & List_Sex.ListIndex + 1
                'MsgBox tyu
                Form1.WinS.SendData tyu
                Buff_Priv tyu
                Karta_p.Visible = False: Form1.Enabled = True: Form1.Show
            End If
        ElseIf X >= 4500 And X <= 7170 And Y >= 7905 And Y <= 8520 And Me.Tag <> "" Then  'кнопка Удалить
            uiddd = Pers(Me.Tag).UID
            If Val(Me.Tag) < UBound(Pers) Then
                For i = Val(Karta_p.Tag) To UBound(Pers) - 1
                    Pers(i).Surname = Pers(i + 1).Surname: Pers(i).Name = Pers(i + 1).Name: Pers(i).Lastname = Pers(i + 1).Lastname
                    Pers(i).Position = Pers(i + 1).Position: Pers(i).RFID = Pers(i + 1).RFID: Pers(i).Date = Pers(i + 1).Date
                    Pers(i).Ocenka = Pers(i + 1).Ocenka: Pers(i).Prava = Pers(i + 1).Prava: Pers(i).Sex = Pers(i + 1).Sex
                    Paint_pers_item i
                Next
            End If
            ReDim Preserve Pers(UBound(Pers) - 1)
            Unload Form1.Pers_index(Form1.Pers_index.ubound)
            Form1.Frame_p.Height = (Form1.Pers_index(0).Height + 6 * 15) * (Form1.Pers_index.ubound + 1)
            If Form1.Pers_win.Height - Form1.Frame_p.Height > 0 Then Form1.Sc_p.Enabled = False: Form1.Frame_p.Top = 0: Form1.Sc_p.Top = 0 Else Form1.Sc_p.Enabled = True
            Form1.List1.Clear
            For i = 0 To UBound(Pers)
                Form1.List1.AddItem Pers(i).Surname & "|" & i
            Next
            For i = 0 To Form1.List1.ListCount - 1
                Ar = Split(Form1.List1.List(i), "|")
                If i = 0 Then
                    Form1.Pers_index(Val(Ar(1))).Move 0, 0
                Else
                    Form1.Pers_index(Val(Ar(1))).Move 0, Form1.Pers_index(indexx).Top + Form1.Pers_index(indexx).Height + 6 * 15
                End If
                indexx = Ar(1)
            Next
            tyu = "@Del_Pers@" & uiddd
            Form1.WinS.SendData tyu
            Buff_Priv tyu
            Karta_p.Visible = False: Form1.Enabled = True
        ElseIf X >= 7365 And X <= 9435 And Y >= 7905 And Y <= 8520 And Me.Tag <> "" Then 'кнопка Заметки
            Note_UID = Pers(Me.Tag).UID
            Note_Type = "1"
            Form1.WinS.SendData "NoteList:" & Pers(Me.Tag).UID & "|" & "1"
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
    For i = 0 To Item.ubound
        If i <> Index Then Item(i).BackColor = col2: Item(i).ForeColor = col1 Else Item(i).BackColor = col1: Item(i).ForeColor = col2
    Next
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

Private Sub List_BCp_Change()
    If List_BCp.ListIndex > -1 Then
        Me.Line (210 * 15, 372 * 15)-(5400, 5850), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 372 * 15
        Me.Print List_BCp.List(List_BCp.ListIndex)
        If Me.Visible And Me.Tag <> "" Then Pers(Me.Tag).Ism_Kard = True
    End If
End Sub

Private Sub List_Oc_Change()
    If List_Oc.ListIndex > -1 Then
        Me.Line (546 * 15, 311 * 15)-(10395, 4980), QBColor(15), BF
        Me.CurrentX = 546 * 15: Me.CurrentY = 311 * 15
        Me.Print List_Oc.List(List_Oc.ListIndex)
        If Me.Visible And Me.Tag <> "" Then Pers(Me.Tag).Ism_Kard = True
    End If
End Sub

Private Sub List_p_Change()
    If List_p.ListIndex > -1 Then
        Me.Line (210 * 15, 311 * 15)-(5400, 4980), QBColor(15), BF
        Me.CurrentX = 210 * 15: Me.CurrentY = 311 * 15
        Me.Print List_p.List(List_p.ListIndex)
        If Me.Visible And Me.Tag <> "" Then Pers(Me.Tag).Ism_Kard = True
    End If
End Sub

Private Sub List_Sex_Change()
    If List_Sex.ListIndex > -1 Then
        Me.Line (546 * 15, 148 * 15)-(10395, 2475), QBColor(15), BF
        Me.CurrentX = 546 * 15: Me.CurrentY = 148 * 15
        Me.Print List_Sex.List(List_Sex.ListIndex)
        If Me.Visible And Me.Tag <> "" Then Pers(Me.Tag).Ism_Kard = True
    End If
End Sub

Public Sub Calend_DateClick(ByVal DateClicked As Date)
    Me.Line (546 * 15, 87 * 15)-(10395, 1635), QBColor(15), BF
    Me.CurrentX = 546 * 15: Me.CurrentY = 87 * 15
    Calend.Visible = False
    Date_r = DateClicked
    Me.Print Date_r
    'If Me.Visible Then Pers(Me.Tag).Ism_Kard = True
End Sub

Private Sub Pol_pers_Change(Index As Integer)
    If Me.Visible And Me.Tag <> "" Then Pers(Me.Tag).Ism_Kard = True
End Sub
