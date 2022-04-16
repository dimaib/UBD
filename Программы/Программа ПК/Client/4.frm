VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Jurnal 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'Нет
   Caption         =   "Журнал"
   ClientHeight    =   3975
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7980
   BeginProperty Font 
      Name            =   "Segoe UI Light"
      Size            =   8.25
      Charset         =   204
      Weight          =   300
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "4.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3975
   ScaleWidth      =   7980
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox List 
      Height          =   315
      Left            =   360
      TabIndex        =   9
      Text            =   "Combo1"
      Top             =   360
      Width           =   1215
   End
   Begin VB.PictureBox List_m 
      Appearance      =   0  'Плоска
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2535
      Left            =   3750
      ScaleHeight     =   2505
      ScaleWidth      =   1890
      TabIndex        =   5
      Top             =   1080
      Visible         =   0   'False
      Width           =   1920
      Begin VB.Label Item 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "Segoe UI"
            Size            =   9.75
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C0C0&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   6
         Top             =   0
         Width           =   1935
      End
   End
   Begin VB.OptionButton Filter 
      Appearance      =   0  'Плоска
      BackColor       =   &H00FFFFFF&
      Caption         =   "День"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   1680
      TabIndex        =   4
      Top             =   600
      Value           =   -1  'True
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.OptionButton Filter 
      Appearance      =   0  'Плоска
      BackColor       =   &H00FFFFFF&
      Caption         =   "Выбрать"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   5280
      TabIndex        =   3
      Top             =   240
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.ComboBox time_0 
      Appearance      =   0  'Плоска
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "4.frx":0442
      Left            =   3000
      List            =   "4.frx":048E
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   120
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CheckBox Det 
      Appearance      =   0  'Плоска
      BackColor       =   &H00FFFFFF&
      Caption         =   "Детально"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      Top             =   720
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.ComboBox time_1 
      Appearance      =   0  'Плоска
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "4.frx":053A
      Left            =   3000
      List            =   "4.frx":0586
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   480
      Visible         =   0   'False
      Width           =   855
   End
   Begin MSComCtl2.MonthView Calend 
      Height          =   2310
      Left            =   120
      TabIndex        =   8
      Top             =   1560
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   4075
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   0
      StartOfWeek     =   55050242
      CurrentDate     =   43383
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Прозрачно
      Caption         =   "Label1"
      Height          =   195
      Left            =   4200
      TabIndex        =   7
      Top             =   120
      Visible         =   0   'False
      Width           =   450
   End
End
Attribute VB_Name = "Jurnal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Obj_m As Object
Dim d0 As String, d1 As String, d2 As String

Private Sub Form_Load()
    Me.Cls
    Me.Width = 1052 * 15
    Me.Height = 448 * 15
    List.Move 25 * 15, 105 * 15, 1010 * 15, 323 * 15
    LoadImage App.Path & "\res\" & "jurnal.png", Me.hdc, 0, 0
    Me.Refresh
    LoadImage App.Path & "\res\" & "opt.png", Me.hdc, 17, 50
    
    Me.FontSize = 10: Me.ForeColor = &H828894
    Me.CurrentX = 30 * 15: Me.CurrentY = 7 * 15
    Me.Print "Журнал по оператору"
    Day1 = True
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 And Y <= 495 Then
        Call ReleaseCapture
        Call SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
    If X >= 15315 And Y <= 390 Then Me.Visible = False: Form1.Enabled = True: Form1.Show 'Кнопка закрыть крест
    If List_m.Visible Then List_m.Visible = False
    If Calend.Visible Then Calend.Visible = False
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1 = X & "x" & Y & vbNewLine & X \ 15 & "x" & Y \ 15
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If X >= 1455 And X <= 3375 And Y >= 570 And Y <= 1155 And Day1 Then 'День 0
            Calend.Visible = True
            Calend.Tag = "0"
            Calend.Move 1455, 1125
        ElseIf X >= 3765 And X <= 5670 And Y >= 570 And Y <= 1155 And Day1 Then  'Время 1
            Add_item time_0
            List_m.Move 3750, Me.Height - List_m.Height - 30
            List_m.Visible = True
        ElseIf X >= 6045 And X <= 7965 And Y >= 570 And Y <= 1155 And Day1 Then  'Время 2
            Add_item time_1
            List_m.Move 6045, Me.Height - List_m.Height - 30
            List_m.Visible = True
        ElseIf X >= 9840 And X <= 11760 And Y >= 570 And Y <= 1155 And Day1 = False Then 'Дата 1
            Calend.Visible = True
            Calend.Tag = "1"
            Calend.Move 9840, 1125
        ElseIf X >= 12135 And X <= 14055 And Y >= 570 And Y <= 1155 And Day1 = False Then   'Дата 2
            Calend.Visible = True
            Calend.Tag = "2"
            Calend.Move 12135, 1125
        ElseIf X >= 195 And X <= 1200 And Y >= 570 And Y <= 1155 Then 'День опт
            LoadImage App.Path & "\res\" & "opt.png", Me.hdc, 17, 50
            LoadImage App.Path & "\res\" & "opt_.png", Me.hdc, 576, 50
            Me.Line (660 * 15, 675)-(660 * 15 + 80 * 15, 975), QBColor(15), BF
            Me.Line (813 * 15, 675)-(813 * 15 + 80 * 16, 975), QBColor(15), BF
            d1 = "": d2 = ""
            Calend.Tag = 0: Calend_DateClick Date
            Me.Refresh
            Day1 = True
        ElseIf X >= 8610 And X <= 9765 And Y >= 570 And Y <= 1155 Then 'Переод опт
            LoadImage App.Path & "\res\" & "opt_.png", Me.hdc, 17, 50
            LoadImage App.Path & "\res\" & "opt.png", Me.hdc, 576, 50
            Me.Line (100 * 15, 675)-(100 * 15 + 80 * 16, 975), QBColor(15), BF
            d0 = ""
            Calend.Tag = 1: Calend_DateClick Date: Calend.Tag = 2: Calend_DateClick Date
            Me.Refresh
            Day1 = False
        ElseIf X >= 14820 And X <= 15345 And Y >= 570 And Y <= 1155 Then 'Кнопка XLS
            If UBound(Exc) > 0 And (Mid(Reg_stat, 1, 1) = "P" Or Mid(Reg_stat, 1, 1) = "T" Or Mid(Reg_stat, 1, 1) = "U") Then
                Dim arr_res() As Byte, file_name As String
                arr_res = LoadResData(101, "CUSTOM")
                fh = FreeFile
                file_name = "C:\BSD\" & Date & "_" & Format(Time, "hh.mm.ss") & ".xls"
                If Dir$("C:\BSD", vbDirectory) = "" Then MkDir ("C:\BSD")
                Open file_name For Binary As #fh
                    Put #fh, 1, arr_res()
                Close fh
                Dim Excel As Object
                Set Excel = CreateObject("Excel.Application")
                Excel.Workbooks.Open file_name
                
                Excel.range("A1") = "ООО ""Погрузчик"", " & Year(Date) & "г."
                Excel.range("F1") = "Склад:________________________"
                'Excel.range("G1") = "Отчёт от: " & Date & " " & Time
                Excel.range("G1") = Date & " " & Time
                Me.Enabled = False
                For i = 1 To UBound(Exc)
                    DoEvents
                    Jurnal.Line (8910, 120)-(14025, 390), QBColor(15), BF
                    Jurnal.CurrentX = 8910: Jurnal.CurrentY = 120
                    Jurnal.Print "Формирование файла отчёта: " & i * 100 \ UBound(Exc) & "%"
                    Excel.range("B" & i + 3) = Mid$(Exc(i).Brebd, 1, 6) & " " & Exc(i).Type & " " & Exc(i).Model & " №" & Exc(i).ID_bort
                    Excel.range("C" & i + 3) = Exc(i).d1
                    If Mid(Reg_stat, 1, 1) <> "U" Then Excel.range("D" & i + 3) = Exc(i).d2
                    If Mid(Reg_stat, 1, 1) <> "U" Then Excel.range("E" & i + 3) = Exc(i).diff_d2_d1 \ 60 \ 60 & ":" & (Exc(i).diff_d2_d1 \ 60) - (Exc(i).diff_d2_d1 \ 60 \ 60) * 60
                    Excel.range("F" & i + 3) = Exc(i).FIO
                    Excel.range("G" & i + 3) = Exc(i).RFID
                    If Mid(Reg_stat, 1, 1) = "U" Then Excel.range("H" & i + 3) = "Да"
                Next
                Excel.Visible = True
                Me.Visible = False: Form1.Visible = False
                Set Excel = Nothing
                Form1.Visible = True: Me.Visible = True: Me.Enabled = True
            Else
                MsgBox "Перед сохранением в файл требуется сделать выгрузку"
            End If
        ElseIf X >= 15405 And X <= 15735 And Y >= 570 And Y <= 915 Then 'Кнопка выгрузить
            qq = ""
            If Day1 And d0 <> "" And time_0.ListIndex > -1 And time_1.ListIndex > -1 Then
                qq = d0 & " " & tim_int(0) & "#" & d0 & " " & tim_int(1)
            ElseIf Day1 = False And d1 <> "" And d2 <> "" Then
                qq = d1 & " 00:00:00#" & d2 & " 23:59:59"
            Else
                MsgBox "Заполните все поля!"
            End If
            If Len(Reg_stat) > 1 And qq <> "" Then List.Clear: List.AddItem "Загрузка статистики...": _
                    Form1.WinS.SendData "!Stat>" & Mid(Reg_stat, 1, 1) & "#" & Mid(Reg_stat, 2, 10) & "#" & qq
        ElseIf X >= 15315 And Y <= 390 Then 'Кнопка закрыть
            End
        End If
    End If
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

Private Sub time_0_Click()
    If time_0.ListIndex > -1 Then
        Me.Line (3825, 675)-(5205, 975), QBColor(15), BF
        Me.CurrentX = 255 * 15: Me.CurrentY = 47 * 15
        Me.Print time_0.List(time_0.ListIndex)
    End If
End Sub

Private Sub time_1_Click()
    If time_1.ListIndex > -1 Then
        Me.Line (407 * 15, 675)-(480 * 15, 975), QBColor(15), BF
        Me.CurrentX = 407 * 15: Me.CurrentY = 47 * 15
        Me.Print time_1.List(time_1.ListIndex)
    End If
End Sub

Public Sub Calend_DateClick(ByVal DateClicked As Date)
    On Error Resume Next
    Calend.Year = Year(Date) 'Format(Date, "yyyy")
    Calend.Month = val(Format(Date, "mm"))
    Calend.day = day(Date) 'Format(Date, "dd")
    Select Case Calend.Tag
        Case "0"
            xl = 100 * 15: d0 = DateClicked
        Case "1"
            xl = 660 * 15: d1 = DateClicked
        Case "2"
            xl = 813 * 15: d2 = DateClicked
    End Select
    Me.Line (xl, 675)-(xl + 80 * 16, 975), QBColor(15), BF
    Me.CurrentX = xl: Me.CurrentY = 47 * 15
    Calend.Visible = False
    Me.Print DateClicked
End Sub
