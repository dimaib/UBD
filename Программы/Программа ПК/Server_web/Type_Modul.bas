Attribute VB_Name = "Type_Modul"
Global BD As BD_

Private Type Pers_
    Surname As String
    Name As String
    Lastname As String
    Prof As Byte
    RFID As Long
    Data As String
    Ocenks As Byte
    UID As Integer
    Prava As String
    Sex As Byte
    Effect As Long 'расчёт эффективности при старте серера и прибовление к эффективности текущих значений при закрытии сессии. И пересчёт значений в 00:00 каждого нового дня
    Online As Boolean 'Определение активности за сегодняшний день и обновление каждый раз когда приходят значения от данного устройства, но сбрасывать данное значение в 00:00. И пересчёт значений в 00:00 каждого нового дня
End Type
    
Private Type Teh_
    Type As Byte
    Brend As Byte
    Model As Byte
    Gp As Long
    Vp As Long
    God As String
    Gnomer As String
    Ocenka As Byte
    ID As Integer
    UID As Integer
    Prava As Byte
    Effect As Long 'расчёт эффективности при старте серера и прибовление к эффективности текущих значений при закрытии сессии. И пересчёт значений в 00:00 каждого нового дня
    Online As Boolean 'Определение активности за сегодняшний день и обновление каждый раз когда приходят значения от данного устройства. И пересчёт значений в 00:00 каждого нового дня
    Porog_X As Long
    Porog_Z As Long
End Type

Private Type Note_
    Date As String
    Type As Byte
    UID As Integer
    Text As String
    WhuIs As String
    ID As Long
End Type

Private Type Profile_
    Login As String
    Pass As String
    FIO As String
    Prava As Byte
    Prochee As String
End Type
        
Private Type Razreshenia_
    ID As Integer
    RFID As Integer
End Type

Private Type Tele_
    Date_n As String
    Time_n As String
    Date_k As String
    Time_k As String
    UID_P As Integer
    UID_T As Integer
    Status As Long
End Type
        
Private Type Udar_
    Date As String
    Time As String
    UIDP As Integer
    UIDT As Integer
    Sila As Byte
End Type

Public Type BD_
    Pers() As Pers_
    Teh() As Teh_
    Note() As Note_
    ProFile() As Profile_
    Razreshenia() As Razreshenia_
    Tele() As Tele_
    Udar() As Udar_
End Type

Public Const PROF_MASTER = 1
Public Const PROF_OPERATOR = 2
Public Const PROF_AKKUM = 3
Public Const PROF_MEHANIK = 4
Public Const PROF_OTHER = 4
Public Const PRAVA_B = 1
Public Const PRAVA_C = 2
Public Const PRAVA_NA = 3
Public Const SEX_M = 1
Public Const SEX_G = 1
Public Const TEH_TYPE_ELTEL = 1
Public Const TEH_TYPE_SHTAB = 2
Public Const TEH_TYPE_ELPOGR = 3
Public Const TEH_TYPE_RICH = 4
Public Const TEH_TYPE_KOMPL = 5
Public Const TEH_TYPE_UZKOP = 6
Public Const NOTE_TYPE_PERS = 1
Public Const NOTE_TYPE_TEH = 2
Public Const PROFILE_ADMIN = 1
Public Const PROFILE_MASTER = 2
Public Const PROFILE_USER = 3
Public Const BREND_JUNG = 1
Public Const BREND_LIND = 2
Public Const BREND_SHTILL = 3
Public Const BREND_BT = 4
Public Const UDAR_YES = 1
Public Const UDAR_NO = 0

Public Sub Load_BD()
    Dim Mes_God As String, ic As Boolean
    ReDim BD.Pers(0): ReDim BD.Teh(0): ReDim BD.Note(0): ReDim BD.ProFile(0): ReDim BD.Razreshenia(0): ReDim BD.Tele(0): ReDim BD.Udar(0)
    With Form1
        .Text1.Text = " ": .Text1.SelStart = 0: .Text1.SelLength = 1 ': .Text1.SelColor = QBColor(10)
        .Text1.Text = "Загрузка списка персонала: "
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
        .Text1.Text = .Text1.Text & UBound(BD.Pers) + 1 & vbNewLine & "Загрузка списка техники: "
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
            BD.Teh(UBound(BD.Teh)).Porog_Z = .KS.Recordset("Porog_Z") '/ 100
            .KS.Recordset.MoveNext
        Loop 'загрузка техники
        .Text1.Text = .Text1.Text & UBound(BD.Teh) + 1 & vbNewLine & "Загрузка списка заметок: "
        .KS.RecordSource = "Notepad": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка заметок
        Do While .KS.Recordset.EOF = False
            If UBound(BD.Note) = 0 And BD.Note(0).ID = 0 Then Else ReDim Preserve BD.Note(UBound(BD.Note) + 1)
            BD.Note(UBound(BD.Note)).Date = .KS.Recordset("Date")
            BD.Note(UBound(BD.Note)).Type = .KS.Recordset("Type")
            BD.Note(UBound(BD.Note)).UID = .KS.Recordset("UID")
            BD.Note(UBound(BD.Note)).Text = .KS.Recordset("Text")
            BD.Note(UBound(BD.Note)).WhuIs = .KS.Recordset("WhuIs")
            BD.Note(UBound(BD.Note)).ID = .KS.Recordset("ID")
            .KS.Recordset.MoveNext
        Loop 'загрузка заметок
        .Text1.Text = .Text1.Text & UBound(BD.Note) + 1 & vbNewLine & "Загрузка списка пользователей: "
        .KS.RecordSource = "Profile": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка профайла
        Do While .KS.Recordset.EOF = False
            If UBound(BD.ProFile) = 0 And BD.ProFile(0).Prava = 0 Then Else ReDim Preserve BD.ProFile(UBound(BD.ProFile) + 1)
            BD.ProFile(UBound(BD.ProFile)).Login = .KS.Recordset("Login")
            BD.ProFile(UBound(BD.ProFile)).Pass = .KS.Recordset("Pass")
            BD.ProFile(UBound(BD.ProFile)).FIO = .KS.Recordset("FIO")
            BD.ProFile(UBound(BD.ProFile)).Prava = .KS.Recordset("Prava")
            BD.ProFile(UBound(BD.ProFile)).Prochee = .KS.Recordset("Prochee")
            .KS.Recordset.MoveNext
        Loop 'загрузка профайла
        .Text1.Text = .Text1.Text & UBound(BD.ProFile) + 1 & vbNewLine & "Загрузка списка разрешений: "
        .KS.RecordSource = "Razreshenia": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка разрешений
        Do While .KS.Recordset.EOF = False
            If UBound(BD.Razreshenia) = 0 And BD.Razreshenia(0).ID = 0 Then Else ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) + 1)
            BD.Razreshenia(UBound(BD.Razreshenia)).ID = .KS.Recordset("ID")
            BD.Razreshenia(UBound(BD.Razreshenia)).RFID = .KS.Recordset("RFID")
            .KS.Recordset.MoveNext
        Loop 'загрузка разрешений
        
       Flag_tele = False
       'Flag_tele = True
       If Flag_tele Then
            '---------------------------------------------
            '-------------Загрузка телеметрии-------------
            '---------------------------------------------
            .KS.RecordSource = "Select * from Tele where [Date_k]=null"  'поиск открытых сессий
            .KS.Refresh
            a = 0
            Do While Form1.KS.Recordset.EOF = False
                If .KS.Recordset.EOF = False Then
                    .KS.Recordset.Delete
                    .KS.Recordset.MoveNext
                    a = a + 1
                End If
            Loop
            .Text1.Text = .Text1.Text & UBound(BD.Razreshenia) + 1 & vbNewLine & "Удалено открытых сессий: " & a & vbNewLine
             .Text1.Text = .Text1.Text & "Загрузка телеметрии" & vbNewLine
             .KS.RecordSource = "Tele": .KS.Refresh: .KS.Recordset.MoveFirst 'загрузка телеметрии
             DoEvents: On Error Resume Next
             Do While .KS.Recordset.EOF = False
                 If UBound(BD.Tele) = 0 And BD.Tele(0).UID_P = 0 Then Else ReDim Preserve BD.Tele(UBound(BD.Tele) + 1)
                 BD.Tele(UBound(BD.Tele)).Date_n = .KS.Recordset("Date_n") & vbNullString
                 BD.Tele(UBound(BD.Tele)).Time_n = .KS.Recordset("Time_n") & vbNullString
                 BD.Tele(UBound(BD.Tele)).Date_k = .KS.Recordset("Date_k") & vbNullString
                 BD.Tele(UBound(BD.Tele)).Time_k = .KS.Recordset("Time_k") & vbNullString
                 BD.Tele(UBound(BD.Tele)).UID_P = .KS.Recordset("UID_P")
                 BD.Tele(UBound(BD.Tele)).UID_T = .KS.Recordset("UID_T")
                 eee = 0 & .KS.Recordset("Status"): BD.Tele(UBound(BD.Tele)).Status = Val(eee)
                 .KS.Recordset.MoveNext
                 If (UBound(BD.Tele) / 10000 - UBound(BD.Tele) \ 10000) = 0 Then
                     .Text1.Text = .Text1.Text & Chr(149)
                     ic = Not (ic)
                     'Shell_NotifyIconA 1, setNOTIFYICONDATA(Form1.hWnd, vbNull, NIF_MESSAGE Or NIF_ICON Or NIF_TIP, WM_MOUSEMOVE, Form1.ico_tray(Val(ic)).Picture, "KS_Server!")
                     DoEvents
                 End If
             Loop 'загрузка телеметрии
            '---------------------------------------------
            '-------------Загрузка телеметрии-------------
            '---------------------------------------------
            
            '---------------------------------------------
            '-------Подсчёт и обработка статистики--------
            '---------------------------------------------
            Flag_stat = False 'разрешить или запретить подсчёт статистики при старте сервера
            'Flag_stat = True
            If Flag_stat Then
                 DoEvents: On Error GoTo 0
                  .Text1.Text = .Text1.Text & UBound(BD.Tele) + 1 & vbNewLine
                  .Text1.Text = .Text1.Text & "Расчёт эффективности за месяц и определение онлайн персонала за сегодня " & vbNewLine
                  Mes_God = Mid$(Date, 4, 10)
                  For i = 0 To UBound(BD.Pers)
                      For ii = UBound(BD.Tele) To 0 Step -1 'поиск онлайн техники за сегодня
                          If BD.Tele(ii).Date_n = Date And BD.Tele(ii).UID_P = BD.Pers(i).UID Then BD.Pers(i).Online = True: Exit For
                      Next 'поиск онлайн персонала
                      For ii = UBound(BD.Tele) To 0 Step -1 'расчёт эффективности борта
                          If Mid$(BD.Tele(ii).Date_n, 4, 10) = Mes_God And BD.Tele(ii).UID_P = BD.Pers(i).UID Then BD.Pers(i).Effect = BD.Pers(i).Effect + BD.Tele(ii).Status
                      Next
                      .Text1.Text = .Text1.Text & Chr(149)
                      DoEvents
                  Next
                  .Text1.Text = .Text1.Text & vbNewLine & "Расчёт эффективности за месяц и определение онлайн техники за сегодня " & vbNewLine
                  For i = 0 To UBound(BD.Teh)
                      For ii = UBound(BD.Tele) To 0 Step -1 'поиск онлайн техники за сегодня
                          If BD.Tele(ii).Date_n = Date And BD.Tele(ii).UID_T = BD.Teh(i).UID Then BD.Teh(i).Online = True:  Exit For
                      Next 'поиск онлайн техники
                      g = 0
                      For ii = UBound(BD.Tele) To 0 Step -1 'расчёт эффективности борта
                          If Mid$(BD.Tele(ii).Date_n, 4, 10) = Mes_God And BD.Tele(ii).UID_T = BD.Teh(i).UID Then BD.Teh(i).Effect = BD.Teh(i).Effect + BD.Tele(ii).Status
                      Next
                      .Text1.Text = .Text1.Text & Chr(149)
                      DoEvents
                  Next
             End If
            '---------------------------------------------
            '-------Подсчёт и обработка статистики--------
            '---------------------------------------------
       End If
    End With
    Form1.Text1.Text = Form1.Text1.Text & vbNewLine & "Загрузка завершена!"
End Sub
