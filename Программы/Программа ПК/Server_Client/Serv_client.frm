VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "Richtx32.ocx"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Server_Client"
   ClientHeight    =   7815
   ClientLeft      =   120
   ClientTop       =   390
   ClientWidth     =   11775
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Serv_client.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7815
   ScaleWidth      =   11775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Проверка"
      Height          =   375
      Left            =   7440
      TabIndex        =   3
      Top             =   7320
      Width           =   1335
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2400
      Tag             =   "WDT"
      Top             =   7320
   End
   Begin VB.CommandButton but 
      Caption         =   "Спрятать"
      Height          =   375
      Index           =   1
      Left            =   8880
      TabIndex        =   2
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton but 
      Caption         =   "Выход"
      Height          =   375
      Index           =   0
      Left            =   10320
      TabIndex        =   1
      Top             =   7320
      Width           =   1335
   End
   Begin VB.Timer Timer1 
      Interval        =   10000
      Left            =   1920
      Tag             =   "Посылка онлайн техники"
      Top             =   7320
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
      Top             =   7320
      Visible         =   0   'False
      Width           =   1260
   End
   Begin MSWinsockLib.Winsock Teh 
      Index           =   0
      Left            =   1440
      Top             =   7320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin RichTextLib.RichTextBox Text1 
      Height          =   7095
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   11535
      _ExtentX        =   20346
      _ExtentY        =   12515
      _Version        =   393217
      BackColor       =   8421504
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      DisableNoScroll =   -1  'True
      Appearance      =   0
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"Serv_client.frx":0442
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 
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


Private Sub Read_Comm(Com As String)
    Open ("c:\WDT\Command.ini") For Input As #10
    flll = 0
    Do Until EOF(10)
        Line Input #10, ar_s
        If Com = Val(ar_s) Then flll = 1: Exit Do
        a = a & ar_s & vbNewLine
    Loop
    Close 10
    If flll = 0 Then Shell "cmd.exe /c echo " & Com & " >>c:\WDT\Command.ini", vbHide
End Sub

Private Sub but_Click(Index As Integer)
    Select Case Index
        Case 0
        If MsgBox("Остановить сервер статистики?", 4 Or 48, "Подтвердите остановку сервера!") = 6 Then
        Shell_NotifyIconA NIM_DELETE, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, vbNull, Form1.Icon, "")
        End
    End If
        Case 1
            Me.WindowState = 1
            Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "KS_Server!")
            If Me.WindowState <> vbMinimized Then Me.Visible = False ': Me.WindowState = vbMinimized
            Me.Visible = False
    End Select
End Sub

Private Sub Load_Eff() 'загрузка эффективности
    Reload_Ar 1: Reload_Ar 2: Reload_Ar 3
'    Dim Max_P As Integer: Max_P = 83
'    Dim Max_T As Integer: Max_T = 47
'    Dim Max_BD As Integer: Max_BD = 16384
    Dim UID_P As Integer: UID_P = 0
    Dim UID_T As Integer: UID_T = 0
    Dim Day_a As String
    'Dim Pr() As Long: ReDim Pr(UBound(BD.Pers))  ' подсчёт эффективности
    Dim Pr_v() As Long: ReDim Pr_v(UBound(BD.Pers)) 'подсчёт выведеных сотрудников в день
    'Dim Th() As Long: ReDim Th(UBound(BD.Teh)) ' подсчёт эффективности
    Dim Th_v() As Long: ReDim Th_v(UBound(BD.Teh))  'подсчёт выведеных сотрудников в день
    Dim d1 As String, d2 As String, t1 As String, t2 As String, tm_ar
    
    data_ot = "01." & IIf(Month(Date) < 10, "0" & Month(Date), Month(Date)) & "." & Year(Date) & " 00:00:00" 'дата. первое число месяца
    data_do = Date & " 23:59:59"
    tm_ar = Split(data_ot, " ") ' tm_ar(0)=дата1; tm_ar(1)=время1
    Ar = Split(tm_ar(0), "."): t1 = "#" & tm_ar(1) & "#": d1 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
    tm_ar = Split(data_do, " ") ' tm_ar(0)=дата2; tm_ar(1)=время2
    Ar = Split(tm_ar(0), "."): t2 = "#" & tm_ar(1) & "#": d2 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#" ' Формат даты #mm/dd/yyyy#

    k = 8 * 60 * Day(Date) '100%
    
    Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time_n] BETWEEN " & t1 & " AND " & t2 'выбор таблицы и поиск пары в разрешениях
    Form1.KS.Refresh
    Do While Form1.KS.Recordset.EOF = False
        UID_P = Form1.KS.Recordset("UID_P")
        UID_T = Form1.KS.Recordset("UID_T")
        Day_a = Form1.KS.Recordset("Date_n")
        For i = 0 To UBound(BD.Pers)
            If UID_P = BD.Pers(i).UID Then
                'Pr(i) = Pr(i) + Form1.KS.Recordset("Status")
                BD.Pers(i).Effect = BD.Pers(i).Effect + Val(Form1.KS.Recordset("Status"))
                If Day(Day_a) = Day(Date) Then Pr_v(i) = Pr_v(i) + 1 'подсчёт выведеных сотрудников в день
            End If
        Next
        For i = 0 To UBound(BD.Teh)
            If UID_T = BD.Teh(i).UID Then
                'Th(i) = Th(i) + Form1.KS.Recordset("Status")
                BD.Teh(i).Effect = BD.Teh(i).Effect + Val(Form1.KS.Recordset("Status"))
                If Day(Day_a) = Day(Date) Then Th_v(i) = Th_v(i) + 1 'подсчёт выведеной техники в день
            End If
        Next
        Form1.KS.Recordset.MoveNext
    Loop
    PPP = 0: TTT = 0
    For i = 0 To UBound(BD.Pers)
        BD.Pers(i).Effect = ((BD.Pers(i).Effect / 60) * 100) \ k

        If Pr_v(i) > 0 Then PPP = PPP + 1
    Next
    For i = 0 To UBound(BD.Teh)
        BD.Teh(i).Effect = ((BD.Teh(i).Effect / 60) * 100) \ k
        If Th_v(i) > 0 Then TTT = TTT + 1
    Next
End Sub

Private Sub Load_Obsh_stat(data_ot, data_do, Index) 'загрузка общей статистики
    'Reload_Ar 1: Reload_Ar 2: Reload_Ar 3
    Dim St_Send() As String
    Dim Inc As Integer 'счётчик пакетов
    Dim Inc1 As Integer 'счётчик строк
    Dim UID_P As Integer: UID_P = 0
    Dim UID_T As Integer: UID_T = 0
    Dim Day_a As String
    Dim Pr() As Long: ReDim Pr(UBound(BD.Pers))  ' подсчёт эффективности
    Dim Pr_v() As Long: ReDim Pr_v(UBound(BD.Pers)) 'подсчёт выведеных сотрудников в день
    Dim Th() As Long: ReDim Th(UBound(BD.Teh)) ' подсчёт эффективности
    Dim Th_v() As Long: ReDim Th_v(UBound(BD.Teh))  'подсчёт выведеных сотрудников в день
    Dim d1 As String, d2 As String, t1 As String, t2 As String, tm_ar
    Dim Sstt As String
    Ar = Split(data_ot, "."): d1 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
    Ar = Split(data_do, "."): d2 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#" ' Формат даты #mm/dd/yyyy#
    ReDim St_Send(0): Inc = 0: Inc1 = 0 ': Sstt = "Obsh="
    Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2: Form1.KS.Refresh
    Do While Form1.KS.Recordset.EOF = False
        iop = Form1.KS.Recordset("Date_n") & "|" & Form1.KS.Recordset("UID_P") & "|" & Form1.KS.Recordset("UID_T") & "|" & Form1.KS.Recordset("Status") & vbNewLine
        St_Send(Inc) = St_Send(Inc) & iop
        Sstt = Sstt & iop
        Inc1 = Inc1 + 1
        If Inc1 > 44 Then
            Inc1 = 0: Inc = Inc + 1
            ReDim Preserve St_Send(Inc)
        End If
        Form1.KS.Recordset.MoveNext
    Loop
    If UBound(St_Send) > 0 Then Teh(Index).SendData "Obsh=" & UBound(St_Send)
End Sub

Private Sub Command1_Click()
    Load_Obsh_stat "15.02.2019", Date, 0
End Sub

Private Sub Form_Load()
    If App.PrevInstance Then MsgBox "Копия программы уже запущена!": End
    Shell_NotifyIconA NIM_ADD, setNOTIFYICONDATA(Form1.hwnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.Icon, "KS_Server!")
    Dir_Res = App.Path
    If Is_Comp Then 'определение на каком компе запущена программа
        af = Split(Dir_Res, "\")
        Dir_Res = ""
        For i = 0 To UBound(af) - 1
            Dir_Res = Dir_Res & af(i) & "\"
        Next
        Dir_Res = Dir_Res & "Server_web"
        KS.DatabaseName = Dir_Res & "\db1_test.mdb"
    Else
        KS.DatabaseName = Dir_Res & "\db1_new.mdb"
    End If
'настройка нулевого сокета
    Shell "cmd.exe /c echo Serv_client >c:\WDT\WDT_k.ini", vbHide
    Teh(0).Close 'закрываем на всякий случай нулевой сокет
    printf "Запуск сервера..."
    Me.Show
    Load_BD
    Timer2.Enabled = True
    Teh(0).LocalPort = 3334 'выставляем нулевому сокету порт для прослушивания 3333
    Teh(0).Listen 'начинаем слушать указаный порт нулевым сокетом
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'If Not Visible Then
        Select Case X \ Screen.TwipsPerPixelX
            Case WM_MOUSEMOVE
            Case WM_LBUTTONDOWN
            Case WM_LBUTTONUP
            Case WM_LBUTTONDBLCLK
                Me.Visible = True: Me.WindowState = vbNormal: Me.Show
            Case WM_RBUTTONDOWN
            Case WM_RBUTTONUP
            Case WM_RBUTTONDBLCLK
        End Select
    'End If
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    Text1.Width = Me.Width - Text1.Left - 20 * 15
    Text1.Height = Me.Height - Text1.Top - 70 * 15
    For i = 0 To but.UBound
        but(i).Move Me.Width - but(i).Width * (i + 1) - 20 * 15, Me.Height - but(i).Height - 40 * 15
    Next
End Sub

Private Sub Teh_Close(Index As Integer)
    Teh(Index).Close
    'printf "Соединение #" & Index & " разорвано!"
    Unload Teh(Index)
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
    printf "Соединение #" & i & " установлено!"
    Teh(i).Close 'на всякий случай разрываем соединение итого сокета
    Teh(i).Accept requestID 'одобряем подключение итым сокетом
    Teh(0).Close 'закрываем на всякий случай нулевой сокет
    Teh(0).LocalPort = 3334 'выставляем нулевому сокету порт для прослушивания 3333
    Teh(0).Listen 'начинаем слушать указаный порт нулевым сокетом
    ii = ii + 1
    If Teh.UBound > 70 Then
        For ipp = 1 To Teh.UBound
            On Error Resume Next
            If Is_Noth(ipp) Then
                If Teh(ipp).Tag = "" Then
                    Teh(ipp).Close
                    Unload Teh(ipp)
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
    If Mid$(a, 1, 8) = "Spisok_P" Then
        Flag_klient = True
        'If Mid$(a, 10, 10) = "1" Then MsgBox 555
        If Flag_nach = False Then Load_Eff 'загрузка эффективности
        
        
        Flag_nach = True
        Incr_pers = Val(Mid$(a, 10, Len(a)))
        If Incr_pers > -1 Then
            Teh(Index).SendData "Addpn:" & BD.Pers(Incr_pers - 1).Surname & "|" & BD.Pers(Incr_pers - 1).Name & "|" & BD.Pers(Incr_pers - 1).Lastname & "|" & BD.Pers(Incr_pers - 1).Prof & _
                "|" & BD.Pers(Incr_pers - 1).RFID & "|" & BD.Pers(Incr_pers - 1).Data & "|" & BD.Pers(Incr_pers - 1).Ocenks & "|" & BD.Pers(Incr_pers - 1).UID & "|" _
                    & BD.Pers(Incr_pers - 1).Prava & "|" & BD.Pers(Incr_pers - 1).Sex & "|" & BD.Pers(Incr_pers - 1).Effect & "|" & Incr_pers
        
        End If
        Incr_pers = 0
    ElseIf Mid$(a, 1, 8) = "Spisok_T" Then
        'printf "Запрос списка техники от #" & Index
        Flag_klient = True
        Flag_nach = False
        Incr_teh = Val(Mid$(a, 10, Len(a)))
        If Incr_teh > -1 Then
            Teh(Index).SendData "Addtn:" & BD.Teh(Incr_teh - 1).Type & "|" & BD.Teh(Incr_teh - 1).Brend & "|" & BD.Teh(Incr_teh - 1).Model & "|" & _
            BD.Teh(Incr_teh - 1).Gp & "|" & BD.Teh(Incr_teh - 1).Vp & "|" & BD.Teh(Incr_teh - 1).God & "|" & BD.Teh(Incr_teh - 1).Gnomer & "|" & _
            BD.Teh(Incr_teh - 1).Ocenka & "|" & BD.Teh(Incr_teh - 1).ID & "|" & BD.Teh(Incr_teh - 1).UID & "|" & BD.Teh(Incr_teh - 1).Prava & "|" & _
            BD.Teh(Incr_teh - 1).Effect & "|" & Incr_teh & "|" & BD.Teh(Incr_teh - 1).Porog_X & "|" & BD.Teh(Incr_teh - 1).Porog_Z
        
        End If
        'List_teh (Index)
        Incr_teh = 0
    ElseIf Mid$(a, 1, 10) = "Spisok_Raz" Then
        'printf "Запрос списка разрешений от #" & Index
        Flag_klient = True
        Flag_nach = False
        Incr_priv = Val(Mid$(a, 12, Len(a)))
        If Incr_priv > -1 Then
            Incr_priv = Incr_priv - 1
            'Teh(Index).SendData "Addprn:" & BD.Razreshenia(Incr_priv - 1).ID & "|" & BD.Razreshenia(Incr_priv - 1).RFID & "|" & Incr_priv
            trr = "Addprn:"
            For i = IIf(Incr_priv = 0, 0, Incr_priv + 1) To IIf(Incr_priv + 40 < UBound(BD.Razreshenia), Incr_priv + 40, UBound(BD.Razreshenia))
                trr = trr & BD.Razreshenia(i).ID & "|" & BD.Razreshenia(i).RFID & "$"
            Next
            If trr <> "Addprn:" Then trr = Mid$(trr, 1, Len(trr) - 1) 'избавляемся от лишнего $
            Teh(Index).SendData trr
        End If
        'List_teh (Index)
        Incr_priv = 0
    ElseIf a = "Ping" Then
        printf "Пинг от #" & Index
        Teh(Index).SendData "Ping"
    ElseIf a = "Zapros_Priv" Then
        Flag_klient = True
        printf "Запрос списка привязок от #" & Index
        Teh(Index).SendData List_Priv()
    ElseIf Mid$(a, 1, 10) = "@Add_Priv@" Then 'добавление новой привязки
        On Error Resume Next
        printf "Добавление привязки #" & Index
        Add_Priv Mid$(a, 11, Len(a))
        Teh(Index).SendData a
        Read_Comm 1
    ElseIf Mid$(a, 1, 10) = "@Del_Priv@" Then 'Удаление привязки
        On Error Resume Next
        printf "Удаление привязки #" & Index
        Ar = Split(Mid$(a, 11, Len(a)), "|") 'ar(0)=ID; ar(1)=RFID
        If UBound(Ar) > 0 Then
            KS.RecordSource = "Select * from Razreshenia where [RFID]=" & Val(Ar(1)) & " AND [ID]=" & Val(Ar(0))  'выбор таблицы и поиск пары в разрешениях
            KS.Refresh
            Do While Form1.KS.Recordset.EOF = False
                If KS.Recordset.EOF = False Then
                    KS.Recordset.Delete
                    KS.Recordset.MoveNext
                End If
            Loop
            For i = 0 To UBound(BD.Razreshenia)
                If BD.Razreshenia(i).ID = Val(Ar(0)) And BD.Razreshenia(i).RFID = Val(Ar(1)) Then
                    If i < UBound(BD.Razreshenia) Then
                        For ii = i To UBound(BD.Razreshenia) - 1
                            BD.Razreshenia(ii) = BD.Razreshenia(ii + 1)
                        Next
                    End If
                    ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) - 1)
                    Exit For
                End If
            Next
            If i <= UBound(BD.Razreshenia) Then
                
            End If
        End If
        Read_Comm 1
        Teh(Index).SendData a
    ElseIf Mid$(a, 1, 10) = "@Add_Pers@" Then 'добавление нового сотрудника
        printf "Добавление нового сотрудника от #" & Index
        Ar = Split(Mid$(a, 11, Len(a)), "|")
        Add_Pers Ar(0), Ar(1), Ar(2), Ar(3), Ar(4), Ar(5), Ar(6), Ar(7), Ar(8), Ar(9)
        Teh(Index).SendData a
        Read_Comm 2
    ElseIf Mid$(a, 1, 11) = "@Edit_Pers@" Then 'редактирование имеющийся записи
        printf "Запрос редактирования сотрудника от #" & Index
        Ar = Split(Mid$(a, 12, Len(a)), "|")
        
        If UBound(Ar) = 9 Then
            'KS.RecordSource = "Personal" 'выбор таблицы
            'KS.Refresh
            'KS.Recordset.MoveFirst
            'KS.Recordset.FindFirst "UID=" & Val(Ar(7))
            KS.RecordSource = "Select * from Personal where [UID]=" & Val(Ar(7))  'выбор таблицы и поиск присланного rfida
            KS.Refresh
            If KS.Recordset.EOF = False Then
                KS.Recordset.Edit
                For i = 1 To 10
                    tyui = KS.Recordset(i)
                    KS.Recordset(i) = Ar(i - 1)
                Next
                KS.Recordset.Update
                For i = 0 To UBound(BD.Pers) 'поиск карты сотрудника в массиве
                    If BD.Pers(i).UID = Val(Ar(7)) Then Exit For
                Next
                If i <= UBound(BD.Pers) Then
                    BD.Pers(i).Surname = Ar(0)
                    BD.Pers(i).Name = Ar(1)
                    BD.Pers(i).Lastname = Ar(2)
                    BD.Pers(i).Prof = Val(Ar(3))
                    BD.Pers(i).RFID = Val(Ar(4))
                    BD.Pers(i).Data = Ar(5)
                    BD.Pers(i).Ocenks = Val(Ar(6))
                    BD.Pers(i).Prava = Ar(8)
                    BD.Pers(i).Sex = Val(Ar(9))
                End If
            End If
        End If
        Teh(Index).SendData a
        Read_Comm 2
    ElseIf Mid$(a, 1, 10) = "@Del_Pers@" Then 'удаление записи
        printf "Удаление сотрудника #" & Index
        If Len(a) > 10 Then
            KS.RecordSource = "Personal" 'выбор таблицы
            KS.Refresh
            KS.Recordset.MoveFirst
            KS.Recordset.FindFirst "UID=" & Val(Trim$(Mid$(a, 11, Len(a))))
            If KS.Recordset.NoMatch = False Then
                KS.Recordset.Delete 'удаление сотрудника из списка
            End If
            For i = 0 To UBound(BD.Pers) 'поиск в массиве персонала удаляемого сотрудника
                If BD.Pers(i).UID = Val(Mid$(a, 11, Len(a))) Then Exit For 'поиск в массиве персонала удаляемого сотрудника
            Next 'поиск в массиве персонала удаляемого сотрудника
            If i < UBound(BD.Pers) Then
                For ii = i To UBound(BD.Pers) - 1 'смещение массива сотрудника
                    BD.Pers(ii) = BD.Pers(ii + 1)  'смещение массива сотрудника
                Next 'смещение массива сотрiiудника
                ReDim Preserve BD.Pers(UBound(BD.Pers) - 1) 'удаление последней записи из массива персонала
            ElseIf i = UBound(BD.Pers) Then
                ReDim Preserve BD.Pers(UBound(BD.Pers) - 1)
            End If
            KS.RecordSource = "Razreshenia" 'выбор таблицы
            KS.Refresh
            KS.Recordset.MoveFirst
            For yy = 0 To 10000 'цикл удаления привязок после удаления сотрудника
                KS.Recordset.MoveFirst
                KS.Recordset.FindFirst "RFID=" & Val(Mid$(a, 11, Len(a)))
                If KS.Recordset.NoMatch = False Then KS.Recordset.Delete Else Exit For
            Next
            Do 'листаем массив привязок до тех пор, пока данный UID присутствует в списке
                For i = 0 To UBound(BD.Razreshenia)
                    If BD.Razreshenia(i).RFID = Mid$(a, 11, Len(a)) Then 'искуственно заданные UIDы
                        If i < UBound(BD.Razreshenia) Then
                            For ii = i To UBound(BD.Razreshenia) - 1
                                BD.Razreshenia(ii) = BD.Razreshenia(ii + 1) 'смещение массива привязки
                            Next
                        End If
                        ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) - 1) 'удаление последнего элемента массива
                        Exit For
                    End If
                Next
            Loop Until i > UBound(BD.Razreshenia) 'листаем массив привязок до тех пор, пока данный UID присутствует в списке
        End If
        Teh(Index).SendData a
        Read_Comm 2
    ElseIf Mid$(a, 1, 10) = "@Edit_Teh@" Then 'редактирование имеющегося борта
        printf "Изменение данных борта от #" & Index
        Ar = Split(Mid$(a, 11, Len(a)), "|")
        If UBound(Ar) = 12 Then
'            KS.RecordSource = "Tehnika" 'выбор таблицы
'            KS.Refresh
'            KS.Recordset.MoveFirst
'            KS.Recordset.FindFirst "UID=" & Val(Ar(9))
'            If KS.Recordset.NoMatch = False Then
            KS.RecordSource = "Select * from Tehnika where [UID]=" & Val(Ar(9))  'выбор таблицы и поиск присланного rfida
            KS.Refresh
            If KS.Recordset.EOF = False Then
                KS.Recordset.Edit
                For i = 0 To UBound(Ar)
                    If i = 12 Then
                        df = Split(Ar(12), ",")
                        If UBound(df) = 1 Then dff = df(0) & "." & df(1) Else dff = df(0)
                        BD.Teh(i).Porog_Z = Val(dff)
                        KS.Recordset(i) = Val(dff) * 100
                    Else
                        KS.Recordset(i) = Ar(i)
                    End If
                Next
                KS.Recordset.Update
            End If
            KS.UpdateRecord
            For i = 0 To UBound(BD.Teh)
                If BD.Teh(i).UID = Val(Ar(9)) Then Exit For
            Next
            If i <= UBound(BD.Teh) Then
                BD.Teh(i).Type = Ar(0)
                BD.Teh(i).Brend = Ar(1)
                BD.Teh(i).Model = Ar(2)
                BD.Teh(i).Gp = Ar(3)
                BD.Teh(i).Vp = Ar(4)
                BD.Teh(i).God = Ar(5)
                BD.Teh(i).Gnomer = Ar(6)
                BD.Teh(i).Ocenka = Ar(7)
                BD.Teh(i).ID = Ar(8)
                'BD.Teh(i).UID  = Ar(9)
                BD.Teh(i).Prava = Ar(10)
                BD.Teh(i).Porog_X = Ar(11)
                df = Split(Ar(12), ",")
                If UBound(df) = 1 Then dff = df(0) & "." & df(1) Else dff = df(0)
                BD.Teh(i).Porog_Z = Val(dff)
            End If
        End If
        'Teh(Index).SendData a
        KS.Refresh: KS.UpdateRecord
        Read_Comm 3
    ElseIf Mid$(a, 1, 9) = "@Add_Teh@" Then 'добавление нового борта
        printf "Запрос добавления нового борта от #" & Index
        Ar = Split(Mid$(a, 10, Len(a)), "|")
        KS.RecordSource = "Tehnika" 'выбор таблицы
        KS.Refresh
        ReDim Preserve BD.Teh(UBound(BD.Teh) + 1)
        KS.Recordset.AddNew
        KS.Recordset(0) = Val(Ar(0)): BD.Teh(UBound(BD.Teh)).Type = Val(Ar(0))
        KS.Recordset(1) = Val(Ar(1)): BD.Teh(UBound(BD.Teh)).Brend = Val(Ar(1))
        KS.Recordset(2) = Val(Ar(2)): BD.Teh(UBound(BD.Teh)).Model = Val(Ar(2))
        KS.Recordset(3) = Ar(3): BD.Teh(UBound(BD.Teh)).Gp = Ar(3)
        KS.Recordset(4) = Ar(4): BD.Teh(UBound(BD.Teh)).Vp = Ar(4)
        KS.Recordset(5) = Val(Ar(5)): BD.Teh(UBound(BD.Teh)).God = Val(Ar(5))
        KS.Recordset(6) = Ar(6): BD.Teh(UBound(BD.Teh)).Gnomer = Ar(6)
        KS.Recordset(7) = Val(Ar(7)): BD.Teh(UBound(BD.Teh)).Ocenka = Val(Ar(7))
        KS.Recordset(8) = Val(Ar(8)): BD.Teh(UBound(BD.Teh)).ID = Val(Ar(8))
        KS.Recordset(9) = Val(Ar(9)): BD.Teh(UBound(BD.Teh)).UID = Val(Ar(9))
        KS.Recordset(10) = Val(Ar(10)): BD.Teh(UBound(BD.Teh)).UID = Val(Ar(10))
        KS.Recordset(11) = Val(Ar(11)): BD.Teh(UBound(BD.Teh)).Porog_X = Val(Ar(11))
        df = Split(Ar(12), ",")
        If UBound(df) = 1 Then dff = df(0) & "." & df(1) Else dff = df(0)
        KS.Recordset(12) = Val(dff) * 100: BD.Teh(UBound(BD.Teh)).Porog_Z = Val(Ar(12))
        KS.Recordset.Update
        Read_Comm 3
    ElseIf Mid$(a, 1, 9) = "@Del_Teh@" Then 'удаление борта
        printf "Запрос удаления борта от #" & Index
        If Len(a) > 9 Then
            KS.RecordSource = "Tehnika" 'выбор таблицы
            KS.Refresh
            KS.Recordset.MoveFirst
            KS.Recordset.FindFirst "UID=" & Val(Mid$(a, 10, Len(a)))
            If KS.Recordset.NoMatch = False Then
                KS.Recordset.Delete
            End If
            For i = 0 To UBound(BD.Teh) 'поиск в массиве персонала удаляемого сотрудника
                If BD.Teh(i).UID = Val(Mid$(a, 10, Len(a))) Then
                    Exit For 'поиск в массиве персонала удаляемого сотрудника
                End If
            Next 'поиск в массиве персонала удаляемого сотрудника
            
            If i < UBound(BD.Teh) Then
                For ii = i To UBound(BD.Teh) - 1 'смещение массива сотрудника
                    BD.Teh(ii) = BD.Teh(ii + 1)  'смещение массива сотрудника
                Next 'смещение массива сотрiiудника
            End If
            ReDim Preserve BD.Teh(UBound(BD.Teh) - 1)
            KS.RecordSource = "Razreshenia" 'выбор таблицы
            KS.Refresh
            KS.Recordset.MoveFirst
            For yy = 0 To 10000
                KS.Recordset.MoveFirst
                KS.Recordset.FindFirst "ID=" & Val(Mid$(a, 10, Len(a)))
                If KS.Recordset.NoMatch = False Then
                    KS.Recordset.Delete
                Else
                    Exit For
                End If
            Next
            KS.Recordset.MoveLast
            Do 'листаем массив привязок до тех пор, пока данный UID присутствует в списке
                For i = 0 To UBound(BD.Razreshenia)
                    If BD.Razreshenia(i).ID = Val(Mid$(a, 11, Len(a))) Then 'искуственно заданные UIDы
                        If i < UBound(BD.Razreshenia) Then
                            For ii = i To UBound(BD.Razreshenia) - 1
                                BD.Razreshenia(ii) = BD.Razreshenia(ii + 1) 'смещение массива привязки
                            Next
                        End If
                        ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) - 1) 'удаление последнего элемента массива
                        Exit For
                    End If
                Next
            Loop Until i > UBound(BD.Razreshenia) 'листаем массив привязок до тех пор, пока данный UID присутствует в списке
        End If
        Read_Comm 3
    ElseIf Mid$(a, 1, 6) = "!Stat>" Then 'запрос статистики на персонал или технику
        Ar = Split(a, ">")
        If UBound(Ar) > 0 Then
            Ar = Split(Ar(1), "#") 'ar(0)= P, T или U - метка персонала, техники или удара; ar(1)=UID персонала или техники;ar(2)=дата1; ar(3)=дата2
            If UBound(Ar) = 3 Then
                'MsgBox Ar(0) & vbNewLine & Ar(1) & vbNewLine & Ar(2) & vbNewLine & Ar(3)
                If Ar(0) = "U" Then
                    Dim d1 As String, d2 As String, t1 As String, t2 As String, tm_ar
                    If Ar(2) > 0 Then
                        data_ot = Ar(2)
                        data_do = Ar(3)
                        tm_ar = Split(data_ot, " ") ' tm_ar(0)=дата1; tm_ar(1)=время1
                        Ar = Split(tm_ar(0), ".")
                        t1 = "#" & tm_ar(1) & "#"
                        d1 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
                        tm_ar = Split(data_do, " ") ' tm_ar(0)=дата2; tm_ar(1)=время2
                        Ar = Split(tm_ar(0), ".")
                        t2 = "#" & tm_ar(1) & "#"
                        d2 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#" ' Формат даты #mm/dd/yyyy#
                        Form1.KS.RecordSource = "Select * from Udar where [Data] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time] BETWEEN " & t1 & " AND " & t2 'выбор таблицы и поиск пары в разрешениях
                        Form1.KS.Refresh
                    Else
                        Form1.KS.RecordSource = "Select * from Udar where [Sila]=1"  'выбор таблицы и поиск пары в разрешениях
                        Form1.KS.Refresh
                    End If
                    uio = "Stat>U|"
                    Do While Form1.KS.Recordset.EOF = False
                        If Form1.KS.Recordset.EOF = False Then
                            Form1.KS.Recordset.Edit
                            Form1.KS.Recordset("Sila") = "0"
                            uio = uio & Form1.KS.Recordset("Data") & " " & Form1.KS.Recordset("Time") & "<" & Form1.KS.Recordset("UIDP") & _
                                "<" & Form1.KS.Recordset("UIDT") & "|"
                            Form1.KS.Recordset.Update
                        End If
                        Form1.KS.Recordset.MoveNext
                    Loop
                    uio = Mid$(uio, 1, Len(uio) - 1)
                    Teh(Index).SendData uio
                ElseIf Ar(0) = "P" Or Ar(0) = "T" Then
                    Teh(Index).SendData Stat_(Ar(2), Ar(3), IIf(Ar(0) = "T", Ar(1), 0), IIf(Ar(0) = "P", Ar(1), 0))
                End If
            End If
        End If
    ElseIf Mid$(a, 1, 6) = "Login:" Then
        Ar = Split(Mid$(a, 7, Len(a)), "|")
        If UBound(Ar) = 1 Then
            For i = 0 To UBound(BD.ProFile)
                If BD.ProFile(i).Login = Ar(0) And BD.ProFile(i).Pass = Ar(1) Then Exit For 'поиск логина и пароля в базе
            Next
            If i <= UBound(BD.ProFile) Then Teh(Index).SendData "Login:" & BD.ProFile(i).FIO & "|" & BD.ProFile(i).Prava & "|" & _
                UBound(BD.Pers) + 1 & "|" & UBound(BD.Teh) + 1 & "|" & UBound(BD.Razreshenia) + 1 Else Teh(Index).SendData "NoLogin"
            Teh(Index).Tag = "K" & Ar(0)
        End If
    ElseIf a = "UserList" Then
        Teh(Index).SendData Pro_List
    ElseIf Mid$(a, 1, 9) = "EditUser:" Then
        Ar = Split(Mid$(a, 10, Len(a)), "|")
        KS.RecordSource = "Select * from Profile where [Login]='" & Ar(0) & "'"
        KS.Refresh
        If KS.Recordset.EOF = False Then
            KS.Recordset.Edit
            KS.Recordset(0) = Ar(1)
            KS.Recordset(1) = Ar(2)
            KS.Recordset(2) = Ar(3)
            KS.Recordset(3) = Ar(4)
            KS.Recordset(4) = Ar(5)
        End If
        KS.Recordset.Update
        Teh(Index).SendData Pro_List
    ElseIf Mid$(a, 1, 8) = "AddUser:" Then
        Ar = Split(Mid$(a, 9, Len(a)), "|")
        '''''''''''''''''''добавить запись нового пользователя
        KS.RecordSource = "Profile" 'выбор таблицы
        KS.Refresh
        KS.Recordset.AddNew
        KS.Recordset(0) = Ar(0)
        KS.Recordset(1) = Ar(1)
        KS.Recordset(2) = Ar(2)
        KS.Recordset(3) = Ar(3)
        KS.Recordset(4) = Ar(4)
        KS.Recordset.Update
        Teh(Index).SendData Pro_List
    ElseIf Mid$(a, 1, 8) = "RemUser:" Then
        KS.RecordSource = "Select * from Profile where [Login]='" & Mid$(a, 9, Len(a)) & "'"
        KS.Refresh
        If KS.Recordset.EOF = False Then KS.Recordset.Delete
        Teh(Index).SendData Pro_List
    ElseIf Mid$(a, 1, 9) = "NoteList:" Then
        Ar = Split(Mid$(a, 10, Len(a)), "|")
        If UBound(Ar) > 0 Then Teh(Index).SendData NoteList(Ar(0), Ar(1))
    ElseIf Mid$(a, 1, 9) = "EditNote:" Then
        Ar = Split(Mid$(a, 10, Len(a)), "|")
        KS.RecordSource = "Select * from Notepad where [ID]=" & Ar(0)
        KS.Refresh
        If KS.Recordset.EOF = False Then
            KS.Recordset.Edit
            KS.Recordset(0) = Ar(1)
            KS.Recordset(3) = Ar(3)
            KS.Recordset(4) = Ar(2)
            KS.Recordset.Update
            Teh(Index).SendData NoteList(KS.Recordset(2), KS.Recordset(1))
        End If
    ElseIf Mid$(a, 1, 8) = "AddNote:" Then
        Ar = Split(Mid$(a, 9, Len(a)), "|")
        For i = 1 To 10000 'цикл определения пропущеного или наибольшего ID для пометок
            KS.RecordSource = "Select * from Notepad where [ID]=" & i   'выбор таблицы
            Form1.KS.Refresh
            If Form1.KS.Recordset.EOF Then Exit For
        Next
        Form1.KS.RecordSource = "Notepad" 'выбор таблицы
        Form1.KS.Refresh
        Form1.KS.Recordset.AddNew
        Form1.KS.Recordset(0) = Ar(0)
        Form1.KS.Recordset(1) = Ar(1)
        Form1.KS.Recordset(2) = Ar(2)
        Form1.KS.Recordset(3) = Ar(3)
        Form1.KS.Recordset(4) = Ar(4)
        Form1.KS.Recordset(5) = i
        Form1.KS.Recordset.Update
        Teh(Index).SendData NoteList(Ar(2), Ar(1))
    ElseIf Mid$(a, 1, 8) = "RemNote:" Then
        Ar = Split(Mid$(a, 9, Len(a)), "|")
        KS.RecordSource = "Select * from Notepad where [ID]=" & Ar(0)   'выбор таблицы
        Form1.KS.Refresh
        If KS.Recordset.EOF = False Then
            KS.Recordset.Delete
            Teh(Index).SendData NoteList(Ar(2), Ar(1))
        End If
    ElseIf a = "List_Note" Then
        Teh(Index).SendData List_Note
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
    ElseIf a = "Refresh" Then ' перезагрузка разрешений
        Read_Comm 1
        Read_Comm 2
        Read_Comm 3
    ElseIf a = "Effect" Then 'запрос эффективности
    
    ElseIf Mid$(a, 1, 5) = "Obsh:" Then
        'Obsh:15.02.2019|24.03.2019
        Load_Obsh_stat Mid$(a, 6, 10), Mid$(a, 17, 10), Index
    End If
    
    'printf "Приём от #" & Teh(Index).Tag & ": " & a
End Sub

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

Private Sub Timer1_Timer()
    On Error Resume Next
    File = FreeFile
    Open ("c:\WDT\Online.ini") For Input As #File
    flll = 0
    Line Input #File, ar_s
    Close
    If Len(ar_s) > 5 Then
        ar_s = Trim$(ar_s)
        If Mid$(ar_s, 1, 1) = """" Then
            For incr = 1 To Teh.UBound
                If Is_Noth(incr) Then Teh(incr).SendData Mid$(ar_s, 2, Len(ar_s) - 1)
            Next
        End If
    End If
End Sub

Private Sub Timer2_Timer()
    Me.Caption = Date & " " & Time
    Shell "cmd.exe /c echo " & Date & " " & Time & " >c:\WDT\WDT_k.ini", vbHide
    Open ("c:\WDT\Udar.ini") For Input As #10
    Line Input #10, ar_s
    Close 10
    If Val(ar_s) = 1 Then
        Shell "cmd.exe /c echo 0 >c:\WDT\Udar.ini", vbHide
        For i = 1 To Teh.UBound
            If Is_Noth(i) Then Teh(i).SendData "Udar<<"
        Next
    End If
    
End Sub
