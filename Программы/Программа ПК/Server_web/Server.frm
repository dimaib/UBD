VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00808080&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "KS_Server"
   ClientHeight    =   9975
   ClientLeft      =   210
   ClientTop       =   1500
   ClientWidth     =   12030
   Icon            =   "Server.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9975
   ScaleWidth      =   12030
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'Нет
      ForeColor       =   &H0000FF00&
      Height          =   9135
      Left            =   1920
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   13
      Text            =   "Server.frx":0442
      Top             =   120
      Width           =   9975
   End
   Begin MSWinsockLib.Winsock Teh 
      Index           =   0
      Left            =   720
      Top             =   1320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Command6"
      Height          =   375
      Left            =   4560
      TabIndex        =   12
      Top             =   9480
      Width           =   1335
   End
   Begin VB.Timer Timer7 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   720
      Tag             =   "Обмен данными с клиентом"
      Top             =   840
   End
   Begin VB.Timer Timer6 
      Enabled         =   0   'False
      Interval        =   7000
      Left            =   1320
      Tag             =   "WDT"
      Top             =   2280
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Очистить разрешения на технику"
      Height          =   375
      Left            =   6000
      TabIndex        =   11
      Top             =   9480
      Width           =   2775
   End
   Begin VB.Frame Frame1 
      Caption         =   "Настройки"
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   3240
      Visible         =   0   'False
      Width           =   1575
      Begin VB.TextBox Opt 
         Alignment       =   2  'Центровка
         Appearance      =   0  'Плоска
         BorderStyle     =   0  'Нет
         Height          =   195
         Index           =   0
         Left            =   960
         TabIndex        =   1
         Text            =   "3333"
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Прозрачно
         Caption         =   "Порт для устройств:"
         Height          =   495
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.CheckBox Check2 
      BackColor       =   &H00808080&
      Caption         =   "Check2"
      Height          =   255
      Left            =   1440
      TabIndex        =   10
      ToolTipText     =   "Показать\спрятать подключённые устройства"
      Top             =   120
      Width           =   255
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Очистить"
      Height          =   360
      Left            =   3240
      TabIndex        =   8
      Top             =   9480
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Копировать"
      Height          =   360
      Left            =   1920
      TabIndex        =   7
      Top             =   9480
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00686868&
      Caption         =   "Check1"
      Height          =   255
      Left            =   11280
      TabIndex        =   9
      ToolTipText     =   "Показать\спрятать лог"
      Top             =   240
      Width           =   255
   End
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   960
      Tag             =   "Посылка списка техники"
      Top             =   4080
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   480
      Tag             =   "Посылка списка пресонала"
      Top             =   4080
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Центровка
      Appearance      =   0  'Плоска
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   1215
   End
   Begin VB.Timer Timer3 
      Interval        =   5000
      Left            =   1320
      Tag             =   "Посылка онлайн техники"
      Top             =   840
   End
   Begin VB.Timer List_conect 
      Interval        =   1000
      Left            =   120
      Tag             =   "Лист подключённых бортов"
      Top             =   2280
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Tag             =   "Задержка на отправку удара"
      Top             =   1800
   End
   Begin VB.Timer Wd_timer 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   120
      Top             =   840
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Выход"
      Height          =   375
      Left            =   10440
      TabIndex        =   4
      Top             =   9480
      Width           =   1455
   End
   Begin VB.Data KS 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   435
      Left            =   120
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   2760
      Visible         =   0   'False
      Width           =   1620
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   120
      Tag             =   "Задержка отправки списка карт"
      Top             =   1320
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Спрятать сервер"
      Height          =   375
      Left            =   8880
      TabIndex        =   3
      Top             =   9480
      Width           =   1455
   End
   Begin VB.Line Line1 
      X1              =   5400
      X2              =   6600
      Y1              =   4800
      Y2              =   5280
   End
   Begin VB.Label List_con 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Прозрачно
      Caption         =   "В сети:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   210
      Index           =   0
      Left            =   120
      TabIndex        =   5
      Top             =   480
      Width           =   510
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
 
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
 
Private Type NOTIFYICONDATA
    cbSize As Long
    hwnd As Long
    UID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type
   
Const NIM_ADD = 0
Const NIM_DELETE = 2
Const NIF_MESSAGE = 1
Const NIF_ICON = 2
Const NIF_TIP = 4

Const WM_MOUSEMOVE = &H200
Const WM_LBUTTONDOWN = &H201
Const WM_LBUTTONUP = &H202
Const WM_LBUTTONDBLCLK = &H203
Const WM_RBUTTONDOWN = &H204
Const WM_RBUTTONUP = &H205
Const WM_RBUTTONDBLCLK = &H206
Const WM_NCLBUTTONDOWN = &HA1
Const HTCAPTION = 2


Private Declare Function Shell_NotifyIconA Lib "SHELL32" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Integer

Private Function setNOTIFYICONDATA(hwnd As Long, ID As Long, Flags As Long, CallbackMessage As Long, Icon As Long, Tip As String) As NOTIFYICONDATA
    Dim nidTemp As NOTIFYICONDATA

    nidTemp.cbSize = Len(nidTemp)
    nidTemp.hwnd = hwnd
    nidTemp.UID = ID
    nidTemp.uFlags = Flags
    nidTemp.uCallbackMessage = CallbackMessage
    nidTemp.hIcon = Icon
    nidTemp.szTip = Tip & Chr$(0)

    setNOTIFYICONDATA = nidTemp
End Function


Private Function Puls() As String 'оптимизированый пульс'''''
    ReDim Teh_list(0)
    Dim day_w(1 To 7) As Long
    Puls = "Puls|"
    For d = 1 To 7
        Ar = Split(Date - Weekday(Date, vbMonday) + d, ".")
        d1 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
        Form1.KS.RecordSource = "Select * from Tele where [Date_n]=" & d1    'выбор таблицы и поиск пары в разрешениях
        Form1.KS.Refresh
        Dim tm_incr As Long
        For i = 0 To UBound(BD.Teh)
            tm_incr = 0
            Do While Form1.KS.Recordset.EOF = False
                tm_incr = tm_incr + 1
                If KS.Recordset("Status") <> "" And BD.Teh(i).UID = KS.Recordset("UID_T") Then tm_incr = tm_incr + Val(KS.Recordset("Status") & vbNullString)
                If tm_incr > 1800 Then 'если борт проработал более получаса
                    day_w(d) = day_w(d) + 1
                    Exit Do
                End If
                Form1.KS.Recordset.MoveNext
            Loop
            On Error Resume Next
            Form1.KS.Recordset.MoveFirst
        Next
        Puls = Puls & day_w(d) & "|"
    Next
End Function

Public Function NoteList(UID_, Typ_) As String
    Form1.KS.RecordSource = "Select * from Notepad where [UID]=" & UID_ & " AND [Type]=" & Typ_   'выбор таблицы
    Form1.KS.Refresh
    NoteList = "NoteList:"
    Do While Form1.KS.Recordset.EOF = False
        NoteList = NoteList & Form1.KS.Recordset(0) & "|" & Form1.KS.Recordset(1) & "|" & Form1.KS.Recordset(2) & "|" & Form1.KS.Recordset(3) & "|" & _
                Form1.KS.Recordset(4) & "|" & Form1.KS.Recordset(5) & "@#@"
        Form1.KS.Recordset.MoveNext
    Loop
    If NoteList <> "NoteList:" Then NoteList = Mid$(NoteList, 1, Len(NoteList) - 3)
End Function

Public Function Pro_List() As String
    Form1.KS.RecordSource = "Profile" 'выбор таблицы
    Form1.KS.Refresh
    Form1.KS.Recordset.MoveFirst
    Pro_List = "Profile:"
    Do While Form1.KS.Recordset.EOF = False
        If Form1.KS.Recordset.EOF = False Then
            Pro_List = Pro_List & Form1.KS.Recordset(0) & "|" & Form1.KS.Recordset(1) & "|" & Form1.KS.Recordset(2) & _
                    "|" & Form1.KS.Recordset(3) & "|" & Form1.KS.Recordset(4) & vbNewLine
        End If
        Form1.KS.Recordset.MoveNext
    Loop
    If Pro_List <> "Profile:" Then Pro_List = Mid$(Pro_List, 1, Len(Pro_List) - 2)
    Form1.KS.Recordset.MoveLast
End Function

Private Sub Command1_Click()
    Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "KS_Server!")
    If Me.WindowState <> vbMinimized Then Me.Visible = False ': Me.WindowState = vbMinimized
End Sub

Private Sub Command2_Click()
    If MsgBox("Остановить сервер?", 4 Or 48, "Подтвердите остановку сервера!") = 6 Then
        Shell_NotifyIconA NIM_DELETE, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, vbNull, Form1.Icon, "")
        End
    End If
End Sub

Private Sub Command3_Click()
    Clipboard.Clear
    Clipboard.SetText Text1.Text
End Sub

Private Sub Command4_Click()
    Terminal = ""
    Text1.Text = ""
End Sub

Private Sub Command5_Click()
    Dim Tehhh() As Long, Perss() As Long, Razr() As Pers_teh_load_
    ReDim Perss(0): ReDim Tehhh(0): ReDim Razr(0)
    KS.RecordSource = "Personal" 'выбор таблицы
    KS.Refresh: KS.Recordset.MoveFirst
    Do While KS.Recordset.EOF = False 'загрузка UIDов персонала
        If KS.Recordset.EOF = False Then If UBound(Perss) = 0 And Perss(0) = 0 Then Else ReDim Preserve Perss(UBound(Perss) + 1)
        Perss(UBound(Perss)) = KS.Recordset(8)
        KS.Recordset.MoveNext
    Loop
    KS.RecordSource = "Tehnika" 'выбор таблицы
    KS.Refresh: KS.Recordset.MoveFirst
    Do While KS.Recordset.EOF = False
        If KS.Recordset.EOF = False Then If UBound(Tehhh) = 0 And Tehhh(0) = 0 Then Else ReDim Preserve Tehhh(UBound(Tehhh) + 1)
        Tehhh(UBound(Tehhh)) = KS.Recordset("UID")
        KS.Recordset.MoveNext
    Loop
    KS.RecordSource = "Razreshenia" 'выбор таблицы
    KS.Refresh
    Do While KS.Recordset.EOF = False
        If KS.Recordset.EOF = False Then If UBound(Razr) = 0 And Razr(0).UID_P = 0 Then Else ReDim Preserve Razr(UBound(Razr) + 1)
        Razr(UBound(Razr)).UID_P = KS.Recordset("RFID")
        Razr(UBound(Razr)).UID_T = KS.Recordset("ID")
        For i = 0 To UBound(Tehhh)
            If Razr(UBound(Razr)).UID_T = Tehhh(i) Then Exit For
        Next
        If i > UBound(Tehhh) Then
            tmp_tmp = tmp_tmp + 1
            KS.Recordset.Delete
        Else
            For i = 0 To UBound(Perss)
                If Razr(UBound(Razr)).UID_P = Perss(i) Then Exit For
            Next
            If i > UBound(Perss) Then tmp_tmp = tmp_tmp + 1: KS.Recordset.Delete
        End If
        KS.Recordset.MoveNext
    Loop
    MsgBox "Всего людей: " & UBound(Perss) + 1 & vbNewLine & "Всего техники: " & UBound(Tehhh) + 1 & _
        vbNewLine & "Всего разрешений: " & UBound(Razr) + 1 & vbNewLine & "Удалено разрешений: " & Val(tmp_tmp)
End Sub

Public Sub Session(UID_P, UID_T, Index)
    tyu = "Select * from Tele where [UID_P]=" & UID_P & "  AND " & "[UID_T]=" & UID_T  'выбор таблицы и поиск пары в ней
    Form1.KS.RecordSource = tyu
    Form1.KS.Refresh
    'On Error Resume Next
    Raz(Index) = UID_P
    If Form1.KS.Recordset.EOF = False Then Form1.KS.Recordset.MoveLast
    If Form1.KS.Recordset.EOF = False Then 'если найдена данная сессия с присланным UID_P и UID_T
        tmp_d = Form1.KS.Recordset("Date_k")
        tmp_t = Form1.KS.Recordset("Time_k")
        tmp_dt = DateDiff("s", Date & " " & Time, tmp_d & " " & tmp_t)
        If tmp_dt < 0 Then tmp_dt = tmp_dt * -1
        If tmp_dt <= 180 Then 'если последняя запись обновлена в последние 3 минуты, то обновляем её
            Form1.KS.Recordset.Edit
            Form1.KS.Recordset("Date_k") = Date
            Form1.KS.Recordset("Time_k") = Time
            Form1.KS.Recordset("Status") = DateDiff("s", Form1.KS.Recordset("Date_n") & " " & Form1.KS.Recordset("Time_n"), Date & " " & Time)
            Form1.KS.Recordset.Update
        ElseIf tmp_dt > 180 Then 'если последняя запись обновлена более 3х минут назад
            If Form1.KS.Recordset("Status") > 0 Then Form1.KS.Recordset.AddNew Else Form1.KS.Recordset.Edit 'если запись нулевая,
            '                                                                                    то перезатираем её новой записью, если нет, то создаём новую
            Form1.KS.Recordset("Date_n") = Date
            Form1.KS.Recordset("Time_n") = Time
            Form1.KS.Recordset("Date_k") = Date
            Form1.KS.Recordset("Time_k") = Time
            Form1.KS.Recordset("Status") = 0
            Form1.KS.Recordset("UID_P") = UID_P
            Form1.KS.Recordset("UID_T") = UID_T
            Form1.KS.Recordset.Update
        End If
    Else 'если не найдена данная сессия с присланным UID_P и UID_T, то создаём её
        'Form1.KS.Recordset.MoveLast
        Form1.KS.Recordset.AddNew
        Form1.KS.Recordset("Date_n") = Date
        Form1.KS.Recordset("Time_n") = Time
        Form1.KS.Recordset("Date_k") = Date
        Form1.KS.Recordset("Time_k") = Time
        Form1.KS.Recordset("Status") = 0
        Form1.KS.Recordset("UID_P") = UID_P
        Form1.KS.Recordset("UID_T") = UID_T
        Form1.KS.Recordset.Update
    End If
End Sub

Private Sub Command6_Click()
    Session 183, 25, 1
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call ReleaseCapture
    Call SendMessage(Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'If Not Visible Then
        Select Case X \ Screen.TwipsPerPixelX
            Case WM_MOUSEMOVE
            Case WM_LBUTTONDOWN
            Case WM_LBUTTONUP
            Case WM_LBUTTONDBLCLK
                Me.Visible = True
                Me.WindowState = vbNormal
                Me.Show
            Case WM_RBUTTONDOWN
            Case WM_RBUTTONUP
            Case WM_RBUTTONDBLCLK
        End Select
    'End If
End Sub

Private Sub Form_Load()
    If App.PrevInstance Then MsgBox "Копия программы уже запущена!": End
    Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "KS_Server!")
    'Dir_Res = mid$(App.Path, 1, InStrRev(App.Path, "\") - 1)
    Dir_Res = App.Path
    List_con(0).FontSize = 100
    List_con(0).FontSize = 7
    'If Is_Comp Then KS.DatabaseName = Dir_Res & "\db1_test.mdb" Else KS.DatabaseName = Dir_Res & "\db1_new.mdb" 'определение на каком компе запущена программа
    If Is_Comp Then KS.DatabaseName = Dir_Res & "\db1_test.mdb" Else KS.DatabaseName = Dir_Res & "\db1_new.mdb" 'определение на каком компе запущена программа
    
    ReDim Wd_incr(0)
    ReDim WDT(0)
    'Me.Show
    Shell "cmd.exe /c echo KS_Server >c:\WDT\WDT.ini", vbHide
    Timer6.Enabled = True
    'настройка нулевого сокета
    Teh(0).Close 'закрываем на всякий случай нулевой сокет
    Text1.Font.Size = 10
    printf "Запуск сервера..."
    Me.Line (0, 0)-(Me.Width - 15, Me.Height - 15), , B
    Load_BD
    Timer7.Enabled = True
    Teh(0).LocalPort = Opt(0) 'выставляем нулевому сокету порт для прослушивания 3333
    Teh(0).Listen 'начинаем слушать указаный порт нулевым сокетом
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Shell_NotifyIconA NIM_DELETE, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, vbNull, Form1.Icon, "")
    End
End Sub

Private Sub List_con_Click(Index As Integer)
    s = ""
    For i = 1 To Teh.UBound
        s = s & i & " - " & Teh(i).Tag & vbNewLine
    Next
    Text1.Text = s
End Sub

Private Sub List_conect_Timer() 'таймер загрузки списка подключённых портов и клиентов
    If Check2.Value Then
        If List_con.UBound Then
            For i = 0 To List_con.UBound
                If i Then Unload List_con(i)
            Next
        End If
        For i = 0 To Teh.UBound
            If Is_Noth(i) And i Then
                Load List_con(List_con.UBound + 1)
                List_con(List_con.UBound).Top = List_con(List_con.UBound - 1).Top + List_con(0).Height
                If Teh(i).Tag <> "" And Mid$(Teh(i).Tag, 1, 1) <> "K" Then
                    List_con(List_con.UBound) = "#" & i & " Борт №" & Teh(i).Tag & vbNewLine
                    a1 = a1 + 1
                ElseIf Mid$(Teh(i).Tag, 1, 1) = "K" And Len(Teh(i).Tag) > 1 Then
                    List_con(List_con.UBound) = "#" & i & " " & Mid$(Teh(i).Tag, 2, Len(Teh(i).Tag)) & vbNewLine
                Else
                    List_con(List_con.UBound) = "#" & i & " ---" & vbNewLine
                End If
            End If
            List_con(0) = "В сети " & a1 & "\" & List_con.UBound + 1 & "\" & Teh.UBound + 1
            If InStr(4, List_con(List_con.UBound), Text2) And Text2 <> "" Then List_con(List_con.UBound).ForeColor = QBColor(12) Else List_con(List_con.UBound).ForeColor = QBColor(10)
            List_con(List_con.UBound).Visible = True
        Next
    End If
End Sub

Private Sub Teh_Close(Index As Integer)
    Teh(Index).Close
    printf "Соединение #" & Index & " разорвано!"
    Unload Teh(Index):  ReDim Preserve Wd_incr(Teh.UBound)
    wd_linc(ipp) = 0
    If Teh.UBound = 0 Then Wd_timer.Enabled = False
End Sub

Private Sub Teh_ConnectionRequest(Index As Integer, ByVal requestID As Long)
    Dim i As Integer
    i = 1
    If Teh.UBound > 0 Then
        For i = 1 To Teh.UBound 'проверка на пропуск элемента массива
            If Is_Noth(i) = False Then Exit For 'если объект не существует, то элемент массива пропущен, значит требуется вылетить из цикла на данной итерации и создать новый элемент с итым индексом
        Next
        If i = Teh.UBound Then i = i + 1 ' если i = максимальному элементу массива сокетов, значит в массиве нет пропуска элемента, следовательно требуется создавать новый элемент с максимальным индексом + 1
    End If
    Load Teh(i) 'создание нового сокета
    ReDim Preserve WDT(Teh.UBound)
    If i = Teh.UBound Then ReDim Preserve Wd_incr(i): Wd_incr(i) = 0
    Wd_timer.Enabled = True
    printf "Соединение #" & i & " установлено!"
    Teh(i).Close 'на всякий случай разрываем соединение итого сокета
    Teh(i).Accept requestID 'одобряем подключение итым сокетом
    Teh(0).Close 'закрываем на всякий случай нулевой сокет
    Teh(0).LocalPort = Opt(0) 'выставляем нулевому сокету порт для прослушивания 3333
    Teh(0).Listen 'начинаем слушать указаный порт нулевым сокетом
    ii = ii + 1
    If Teh.UBound > 70 Then
        For ipp = 1 To Teh.UBound
            On Error Resume Next
            If Is_Noth(ipp) Then
                If Teh(ipp).Tag = "" Then
                    Teh(ipp).Close
                    Unload Teh(ipp)
                    ReDim Preserve Wd_incr(Teh.UBound)
                    wd_linc(ipp) = 0
                    If Teh.UBound = 0 Then Wd_timer.Enabled = False
                End If
            End If
        Next
    End If
    'Me.Caption = I & "/" & Teh.UBound
End Sub

Private Sub Teh_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    Dim a As String, Ar
    a = ""
    Teh(Index).GetData a
    If a = "Ping" Then
        printf "Пинг от #" & Index
        Teh(Index).SendData "Ping"
    ElseIf Mid$(a, 1, 6) = "start:" And Mid$(a, Len(a) - 5, 6) = ":start" Then  'стартовая строка от УБД. Формат: start:id,rfid,udar_flag:start
        wd_linc(Index) = 0
        Ar = Split(a, ":")
        Ar = Split(Ar(1), ",") 'ar(0)=id борта, ar(1)=текущий rfid, ar(2)=флаг удара
        If Ar(0) <> 0 And Ar(0) <> "" Then Teh(Index).Tag = Ar(0)
        Raz(Index) = 0
        For i = 1 To Teh.UBound 'проверка на пропуск элемента массива
            If Is_Noth(i) = True Then  'если объект не существует, то элемент массива пропущен
                If Teh(i).Tag = Ar(0) And i <> Index Then
                    Unload Teh(i): ReDim Preserve Wd_incr(Teh.UBound)
                    wd_linc(i) = 0
                    printf "Элемент удалён: " & i
                    If Teh.UBound = 0 Then Wd_timer.Enabled = False
                End If
            End If
        Next
        tmp_ = 0: tmp_ = ID_UID(Val(Teh(Index).Tag)) ' перевод ID техники в UID
        'If tmp_ > 0 Then Timer1.Tag = Index: Timer1.Enabled = True 'если существует данный UID, то отсылаем список разрешенных карт
    ElseIf Mid$(a, 1, 9) = "Rfid_cur=" Then  'обработка строки с текущей RFID картой
        wd_linc(Index) = 0
        Ar = Split(a, "=")
        If UBound(Ar) > 0 Then ' Ar(0)="Rfid_cur", Ar(1)=n:u - где n это номер текущего RFIDA, u - флаг удара
            arr = Split(Ar(1), ":")
            If UBound(arr) > 0 Then
                If arr(0) > 1 Then
                    Ar(1) = arr(0)
                    If arr(1) = 1 Then 'если пришёл удар от борта
                        If Teh(Index).Tag <> "" And Mid$(Teh(Index).Tag, 1, 1) <> "K" Then
                            If Udar_flag(Teh(Index).Tag) = False Then 'если флаг удара ещё не взведён, то записываем данные удара в базу и возводим его
                                Udar_flag(Teh(Index).Tag) = True
                                For i = 0 To UBound(BD.Pers) 'перевод присланного RFID в UID сотрудника
                                    If BD.Pers(i).RFID = Val(arr(0)) Then arr(0) = BD.Pers(i).UID: Exit For
                                Next
                                If i > UBound(BD.Pers) Then arr(0) = 0 'если RFID не найден, то UID=0
                                For i = 0 To UBound(BD.Teh) 'перевод ID в UID борта
                                    If BD.Teh(i).ID = Teh(Index).Tag Then uid__ = BD.Teh(i).UID: Exit For
                                Next
                                If i > UBound(BD.Teh) Then uid__ = 0 'если ID не найден, то UID=0
                                
                                'If Teh.UBound > 0 Then Timer2.Enabled = True 'Отправка ударов
                                KS.RecordSource = "Udar" 'выбор таблицы
                                KS.Refresh
                                KS.Recordset.AddNew
                                KS.Recordset(0) = Date
                                KS.Recordset(1) = Time
                                KS.Recordset(2) = arr(0)
                                KS.Recordset(3) = uid__
                                KS.Recordset(4) = 1
                                KS.Recordset.Update
                                If Not (UBound(BD.Udar) = 0 And BD.Udar(0).Date = "") Then ReDim Preserve BD.Udar(UBound(BD.Udar) + 1)
                                BD.Udar(UBound(BD.Udar)).Date = Date: BD.Udar(UBound(BD.Udar)).Time = Time: BD.Udar(UBound(BD.Udar)).UIDP = arr(0)
                                BD.Udar(UBound(BD.Udar)).UIDT = uid__: BD.Udar(UBound(BD.Udar)).Sila = 1
                                Shell "cmd.exe /c echo 1 >c:\WDT\Udar.ini", vbHide
                            End If 'условие добавления удара в базу
                        End If
                    ElseIf arr(1) = 0 Then
                        If Val(Teh(Index).Tag) <> 0 And Teh(Index).Tag <> "" And Mid$(Teh(i).Tag, 1, 1) <> "K" Then Udar_flag(Teh(Index).Tag) = False  'опускаем флаг удара если его нет
                    End If
                    
                    For i = 0 To UBound(BD.Pers) 'перевод присланного RFID в UID сотрудника
                        If BD.Pers(i).RFID = Val(Ar(1)) Then Ar(1) = BD.Pers(i).UID: Exit For
                    Next
                    
                    If i > UBound(BD.Pers) Then Ar(1) = 0 'если RFID не найден, то UID=0
                    tmp = ID_UID(Val(Teh(Index).Tag))
                    If Val(Ar(1)) > 0 And Val(tmp) > 0 Then Session Val(Ar(1)), Val(tmp), Index Else Raz(Index) = 0
'                    For i = 0 To UBound(BD.Razreshenia)
'                        If BD.Razreshenia(i).ID = Val(tmp) And BD.Razreshenia(i).RFID = Val(Ar(1)) Then
'                            If Ignition_flag(Index) = False Then 'событие открытия сессии для подтверждённой пары
'                                KS.RecordSource = "Tele": KS.Refresh
'                                KS.Recordset.AddNew: KS.Recordset("Date_n") = Date: KS.Recordset("Time_n") = Time
'                                KS.Recordset("UID_P") = Ar(1): KS.Recordset("UID_T") = tmp: KS.Recordset.Update
'                            End If
'                            Ignition_flag(Index) = True
'                            Raz(Index) = Ar(1)
'                            Exit For
'                        End If
'                    Next
'                    If i > UBound(BD.Razreshenia) Then End_session Index: Raz(Index) = 0
                
                ElseIf arr(0) = 0 Then
                    Raz(Index) = 0
                    'End_session index
                End If
            End If
        End If
    ElseIf a = "Udar>>" Then
        KS.RecordSource = "Select * from Udar where [Sila]=1"
        KS.Refresh
        If KS.Recordset.EOF = False Then Teh(Index).SendData "Udar<<"
    ElseIf a = "Max_UID_P" Then
        For i = 0 To UBound(BD.Pers)
            If uid_max < BD.Pers(i).UID Then uid_max = BD.Pers(i).UID
        Next
        uid_max = uid_max + 1
        Teh(Index).SendData "Max_UID_P=" & uid_max
    End If
    printf "Приём от #" & Teh(Index).Tag & ": " & a
End Sub

Private Sub Text2_Change()
    If List_con.UBound > 0 Then
        For i = 1 To List_con.UBound
            If InStr(4, List_con(i), Text2) Then List_con(i).ForeColor = QBColor(12) Else List_con(i).ForeColor = QBColor(10)
        Next
    End If
End Sub

Private Sub Timer1_Timer() 'задержка перед посылкой списка разрешённых карт
    If tmp_ > 0 Then Priv_Id tmp_, Timer1.Tag
    Timer1.Tag = 0
    Timer1.Enabled = False
End Sub

Private Sub Timer2_Timer()
    On Error Resume Next
    For i = 1 To Teh.UBound
        If Is_Noth(i) Then
            If Mid$(Teh(i).Tag, 1, 1) = "K" Then
                Teh(i).SendData "Udar<<"
            End If
        End If
    Next
    Timer2.Enabled = False
End Sub

Private Sub Timer3_Timer() ' посылка списка онлайн техники каждые 10 секунд
    List_Online
End Sub

Private Sub Timer6_Timer()
    Me.Caption = Date & " " & Time
    Shell "cmd.exe /c echo " & Date & " " & Time & " >c:\WDT\WDT.ini", vbHide
End Sub

Private Sub Timer7_Timer()
    Open ("c:\WDT\Command.ini") For Input As #10
    flll = 0
    For i = 0 To 9
        Com_client(i) = 0
    Next
    Do Until EOF(10)
        Line Input #10, ar_s
        Com_client(flll) = Val(ar_s)
        flll = flll + 1
    Loop
    Close 10
    Shell "cmd.exe /c echo 0 >c:\WDT\Command.ini", vbHide
    With Form1
        For i = 0 To 9
            If Com_client(i) = 1 Then 'перезагрузка массива разрешений
                ReDim BD.Razreshenia(0)
                .KS.RecordSource = "Razreshenia": .KS.Refresh ': .KS.Recordset.MoveFirst 'загрузка разрешений
                Do While .KS.Recordset.EOF = False
                    If UBound(BD.Razreshenia) = 0 And BD.Razreshenia(0).ID = 0 Then Else ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) + 1)
                    BD.Razreshenia(UBound(BD.Razreshenia)).ID = .KS.Recordset("ID")
                    BD.Razreshenia(UBound(BD.Razreshenia)).RFID = .KS.Recordset("RFID")
                    .KS.Recordset.MoveNext
                Loop 'загрузка разрешений
                printf "перезагрузка массива разрешений"
            ElseIf Com_client(i) = 2 Then 'перезагрузка массива персонала
                ReDim BD.Pers(0)
                .KS.RecordSource = "Personal": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка персонала
                Do While .KS.Recordset.EOF = False 'загрузка UIDов персонала
                    If UBound(BD.Pers) = 0 And BD.Pers(0).UID = 0 Then Else ReDim Preserve BD.Pers(UBound(BD.Pers) + 1)
                    BD.Pers(UBound(BD.Pers)).Surname = .KS.Recordset("Surname") & vbNullString
                    BD.Pers(UBound(BD.Pers)).Name = .KS.Recordset("Name") & vbNullString
                    BD.Pers(UBound(BD.Pers)).Lastname = .KS.Recordset("Lastname") & vbNullString
                    BD.Pers(UBound(BD.Pers)).Prof = .KS.Recordset("Prof")
                    BD.Pers(UBound(BD.Pers)).RFID = .KS.Recordset("RFID")
                    BD.Pers(UBound(BD.Pers)).Data = .KS.Recordset("Data")
                    BD.Pers(UBound(BD.Pers)).Ocenks = .KS.Recordset("Ocenka")
                    BD.Pers(UBound(BD.Pers)).UID = .KS.Recordset("UID")
                    BD.Pers(UBound(BD.Pers)).Prava = .KS.Recordset("Prava")
                    BD.Pers(UBound(BD.Pers)).Sex = .KS.Recordset("Sex")
                    .KS.Recordset.MoveNext
                Loop 'загрузка персонала
                printf "перезагрузка массива персонала"
            ElseIf Com_client(i) = 3 Then 'перезагрузка массива техники
                ReDim BD.Teh(0)
                .KS.RecordSource = "Tehnika": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка техники
                Do While .KS.Recordset.EOF = False
                    If UBound(BD.Teh) = 0 And BD.Teh(0).UID = 0 Then Else ReDim Preserve BD.Teh(UBound(BD.Teh) + 1)
                    BD.Teh(UBound(BD.Teh)).Type = .KS.Recordset("Type")
                    BD.Teh(UBound(BD.Teh)).Brend = .KS.Recordset("Brend")
                    BD.Teh(UBound(BD.Teh)).Model = .KS.Recordset("Model")
                    BD.Teh(UBound(BD.Teh)).Gp = .KS.Recordset("Gp")
                    BD.Teh(UBound(BD.Teh)).Vp = .KS.Recordset("Vp")
                    BD.Teh(UBound(BD.Teh)).God = .KS.Recordset("God")
                    BD.Teh(UBound(BD.Teh)).Gnomer = .KS.Recordset("GNomer")
                    BD.Teh(UBound(BD.Teh)).Ocenka = .KS.Recordset("Ocenka")
                    BD.Teh(UBound(BD.Teh)).ID = .KS.Recordset("ID")
                    BD.Teh(UBound(BD.Teh)).UID = .KS.Recordset("UID")
                    BD.Teh(UBound(BD.Teh)).Prava = .KS.Recordset("Prava")
                    BD.Teh(UBound(BD.Teh)).Porog_X = .KS.Recordset("Porog_X")
                    BD.Teh(UBound(BD.Teh)).Porog_Z = .KS.Recordset("Porog_Z")
                    .KS.Recordset.MoveNext
                Loop 'загрузка техники
                .KS.Refresh
                .KS.UpdateRecord
                printf "перезагрузка массива техники"
            End If
        Next
    End With
End Sub

Private Sub Wd_timer_Timer()
    Dim incr_ As Integer
    For incr_ = 1 To UBound(Wd_incr)
        Wd_incr(incr_) = Wd_incr(incr_) + 1
        If Wd_incr(incr_) > 100 Then Wd_incr(incr_) = 0
        If Wd_incr(incr_) > 15 And Is_Noth(incr_) Then 'посылка стартовой строки устройству и ожидание ответа. Если ответа не было в течении
            If Teh(incr_).Tag <> "" And Mid$(Teh(incr_).Tag, 1, 1) <> "K" Then 'определённого времени, то посылкаем строку ещё раз. Если после 5 посылок не было ответа от устройства, то закрываем сессию для устройства
                Priv_Id ID_UID(Val(Teh(incr_).Tag)), incr_    'формирование и посылка разрешённых карт устройству
                Wd_incr(incr_) = 0
                wd_linc(incr_) = wd_linc(incr_) + 1
                'printf "Посылка стартовой строки в #" & Teh(incr_).Tag
                If wd_linc(incr_) > 5 Then
                    'End_session incr_
                    Unload Teh(incr_): ReDim Preserve Wd_incr(Teh.UBound)
                    printf "Удалено: " & incr_
                    'List_Online
                    wd_linc(incr_) = 0
                    If Teh.UBound = 0 Then Wd_timer.Enabled = False
                End If
            End If
        End If
    Next
End Sub
