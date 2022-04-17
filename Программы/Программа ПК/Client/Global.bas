Attribute VB_Name = "Global"
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function ReleaseCapture Lib "user32" () As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function InvalidateRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT, ByVal bErase As Long) As Long


'определение размера экрана за вычетом тескбара
Public Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Const SPI_GETWORKAREA = 48
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOZORDER = &H4
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2
Public Const HWND_BROADCAST = &HFFFF&
Public Const WM_PAINT = &HF

Public Const RFID_amount_user = 100 'максимальное количество RFID-карт, с правами доступа user, которое можно прикрепить к борту
Public Const RFID_amount_master = 10 'максимальное количество RFID-карт, с правами доступа master, которое можно прикрепить к борту

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Global rect_ As RECT
'определение размера экрана за вычетом тескбара

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public Type Privyzki_type 'тип описывающий привязки человека к технике
    UID_Pers As Integer
    UID_Teh As Integer
End Type

Public Type dd_ 'тип описывающий привязки человека к технике
    d As Date
    Counter As Long
End Type

Public Type Exc_
    ID_bort As Integer
    d1 As Date
    d2 As Date
    diff_d2_d1 As Long
    FIO As String
    RFID As String
    Udar As Boolean
    prof As String
    Type As String
    Brebd As String
    Model As String
End Type

Public Type Profile_
    Login As String
    Pass As String
    FIO As String
    Prava As String
    Prochee As String
End Type

Public Type Note_
    Date As Date
    UID As Integer
    Text As String
    WhoIs As String
    ID As Integer
End Type

Global WaitStr As String
Global Cur As POINTAPI, Priv() As Privyzki_type, Priv_tmp() As Integer, Priv_ind As Integer, cur_d As POINTAPI, Razd_time As String
Global Exc() As Exc_
Global Profile() As Profile_
Global Note() As Note_
Global eee As Byte
Global Reg_stat As String 'переменная определяющая режим окна статистики (статистика для персонала [P] или для техники [T])
Global xs, ys 'переменные для кнопки статистики техники
Global User As String, Pass As String, Us_Name As String, Dostup As String  'данные авторизации
Global Note_UID As Integer, Note_Type As Byte
Global Ef_porog(2) As Integer, Ef_color(5) As Long 'пороги для эфективности, плюс цвета вывода эфективности
Global Date_r As String
Global Day1 As Boolean
Global Ch_p(5) As Boolean 'переменные для фильтра
Global Ch_t(7) As Boolean 'переменные для фильтра
Global Note_p() As Integer
Global Note_t() As Integer
Global Udar As Boolean 'флаг удара
Global Path_File As String 'путь к файлу настроек
Global Temp_string As String 'строка для принятия списков персонала и техники
Global Temp_flag_p As Boolean 'флаг того, что начался приём списка персонала
Global Temp_flag_t As Boolean 'флаг того, что начался приём списка техники
Global Incr_Load As Long ' для вывода кол-ва персонала и техники при загрузке
Global Incr_priv As Byte
Global Load_Flag As Boolean 'флаг для начальной загрузки. Если флаг установлен, то первоначальная загрузка уже прошла
Global Priv_index As Integer, Priv_type As String
Global Flash_Priv As String 'переменная в которой хранится информация по добавленной привязки для мигания
Global Flash_Bool As Boolean 'переменная в которой хранится информация по добавленной привязки для мигания
Global Flash_incr As Integer 'переменная в которой хранится информация по добавленной привязки для мигания
Global Pers_Cout As Integer, Teh_Cout As Integer, Priv_Cout As Long 'кол-во сотрудников, бортов и разрешений, которое присылается от сервера с ответом на авторизацию
Global Flag_ListP As Boolean, Flag_ListT As Boolean, Flag_ListPr As Boolean 'флаги активности передачи списков персонала, техники и разрешений
Global Buffer_Priv() As String
Global i_stat As Integer 'кол-во общей статистики
Global i_stat_incr As Integer 'счётчик принятой общей статистики
Public Sub Win_start_pos()
    Dim rc As RECT
    SystemParametersInfo SPI_GETWORKAREA, 0, ByVal VarPtr(rc), 0
    Form1.Move 0, 0, rc.Right * 15, rc.Bottom * 15
End Sub

Public Function Is_Comp() As Boolean  'определение компа на котором запущена программа
    On Error Resume Next
    Open "c:\WDT\KS.ini" For Input As #1
    Close 1
    If Err Then Is_Comp = False Else Is_Comp = True
End Function

Public Sub Dopusk()
    With Form1
        For ii = 0 To .Teh_index.UBound 'вывод количества привязок техники
            Dopusk_teh ii
        Next
        For ii = 0 To .Pers_index.UBound 'вывод количества привязок персонала
            Dopusk_pers ii
        Next
    End With
End Sub

Public Sub Dopusk_pers(ii)
    With Form1
        .Pers_index(ii).FontSize = 8: .Pers_index(ii).ForeColor = &H948882
        .Pers_index(ii).Line (.Pers_index(ii).Width - 180 * 15, .Pers_index(ii).Height \ 2 + 9 * 15)-(.Pers_index(ii).Width - 50 * 15, .Pers_index(ii).Height \ 2 + 22 * 15), QBColor(15), BF
        .Pers_index(ii).CurrentX = .Pers_index(ii).Width - 180 * 15: .Pers_index(ii).CurrentY = .Pers_index(ii).Height \ 2 + 9 * 15
        .Pers_index(ii).Print "Допуск к  " & Cout_pers(ii) & " ед. техники"
    End With
End Sub

Public Sub Dopusk_teh(ii)
    With Form1
        .Teh_index(ii).FontSize = 8: .Teh_index(ii).ForeColor = &H948882
        .Teh_index(ii).Line (.Teh_index(ii).Width - 180 * 15, .Teh_index(ii).Height \ 2 + 9 * 15)-(.Teh_index(ii).Width - 50 * 15, .Teh_index(ii).Height \ 2 + 22 * 15), QBColor(15), BF
        .Teh_index(ii).CurrentX = .Teh_index(ii).Width - 180 * 15: .Teh_index(ii).CurrentY = .Teh_index(ii).Height \ 2 + 9 * 15
        .Teh_index(ii).ForeColor = IIf(Cout_teh(ii) > RFID_amount_user + RFID_amount_master - 1, QBColor(12), QBColor(8))
        '.Teh_index(ii).ForeColor = QBColor(8)
        .Teh_index(ii).Print "Допуск " & Cout_teh(ii) & " чел."
    End With
End Sub

Public Sub Tx_reserv(tx As Object)
    Dim reserv As String
    reserv = "*&|;#!@<>:"
    If Len(tx) > 0 Then
        For i = 1 To Len(tx)
            For ii = 1 To Len(reserv)
                If Mid$(reserv, ii, 1) = Mid$(tx, i, 1) Then
                    If Len(tx > 1) Then tx = Mid$(tx, 1, i - 1) & Mid$(tx, i + 1, Len(tx)) Else tx = ""
                    tx.SelStart = i - 1
                    Exit For
                End If
            Next
        Next
    End If
End Sub

Public Function Max_UID(Param As String) As Integer 'функция определения максимального UID. Param может принимать значения "teh" и "pers"
    Dim UID_Max As Integer
    If Param = "pers" Then
'        For i = 0 To UBound(Pers)
'            If UID_Max < Pers(i).UID Then UID_Max = Pers(i).UID
'        Next
        For ii = 1 To 10000
            For i = 0 To UBound(Pers)
                If ii = Pers(i).UID Then Exit For
            Next
            If i > UBound(Pers) Then Exit For
        Next
        If ii < 10000 Then Max_UID = ii
    ElseIf Param = "teh" Then
'        For i = 0 To UBound(Teh)
'            If UID_Max < Teh(i).UID Then UID_Max = Teh(i).UID
'        Next
        For ii = 1 To 10000
            For i = 0 To UBound(Teh)
                If ii = Teh(i).UID Then Exit For
            Next
            If i > UBound(Teh) Then Exit For
        Next
        If ii < 10000 Then Max_UID = ii
    End If
    'Max_UID = UID_Max + 1
End Function

Public Function tim_int(Index As Integer) As String 'обработки списка интервала времени
    If Index = 0 Then
        tim_int = IIf(Jurnal.time_0.ListIndex < 10, "0", "") & Jurnal.time_0.ListIndex & ":00:00"
    ElseIf Index = 1 Then
        tim_int = IIf(Jurnal.time_1.ListIndex < 10, "0", "") & Jurnal.time_1.ListIndex & ":00:00"
    End If
End Function

Public Function Cout_teh(Index) As Integer 'определение кол-ва привязок к борту
    Cout_teh = 0
    For i = 0 To UBound(Priv)
        If Teh(Index).UID = Priv(i).UID_Teh Then
            For ii = 0 To UBound(Pers)
                If Priv(i).UID_Pers = Pers(ii).UID Then Cout_teh = Cout_teh + 1: Exit For
            Next
        End If
    Next
End Function

Public Function Cout_pers(Index) As Integer 'определение кол-ва привязок к сотруднику
    Cout_pers = 0
    For i = 0 To UBound(Priv)
        If Pers(Index).UID = Priv(i).UID_Pers Then
            For ii = 0 To UBound(Teh)
                If Priv(i).UID_Teh = Teh(ii).UID Then Cout_pers = Cout_pers + 1: Exit For
            Next
        End If
    Next
End Function

Public Sub Ef_paint(Obj As Object, X, Y, Ps)
    wid = 2835: hei = 570
    If Ps >= Ef_porog(2) Then
        col1 = Ef_color(4)
        col2 = Ef_color(5)
    ElseIf Ps < Ef_porog(2) And Ps >= Ef_porog(1) Then
        col1 = Ef_color(2)
        col2 = Ef_color(3)
    ElseIf Ps < Ef_porog(1) Then
        col1 = Ef_color(0)
        col2 = Ef_color(1)
    End If
    '
    Obj.Line (X, Y)-(X + wid - 15, Y + hei), col1, BF  ' прорисовка светлого прямоугольника &HCAC2BD
    Obj.Line (X, Y)-(X + wid * Ps \ 100, Y + hei), col2, BF    ' прорисовка тёмного прямоугольника &H948882
    Obj.Line (X, Y + hei - 30)-(X + wid * Ps \ 100, Y + hei), &HFEE461, BF       ' прорисовка синего прямоугольника
    LoadImage App.Path & "\res\" & "xls.png", Obj.hdc, X \ 15 + 7, Y \ 15 + 7 'xls на эфективности техники
    LoadImage App.Path & "\res\" & "ef_scale.png", Obj.hdc, X \ 15, Y \ 15 'углы на эфективности техники

    Obj.FontSize = 16: Obj.ForeColor = QBColor(15)
    Obj.CurrentX = X + 36 * 15: Obj.CurrentY = Y + 3 * 15: Obj.Print Ps & "%"
    Obj.FontSize = 10: Obj.ForeColor = QBColor(15)
    Obj.CurrentX = X + 80 * 15: Obj.CurrentY = Y + 13 * 15: Obj.Print "Эффективность"
End Sub


Public Function Get_Icon(Brend As Byte, Typ As Byte, Model As Byte) As String
    If Model = 1 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t16-20.jpg"
    If Model = 2 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t20-30.jpg"
    If Model = 3 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t16-18-20l.jpg"
    If Model = 4 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t20ap.jpg"
    If Model = 5 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t20sp.jpg"
    If Model = 6 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t30ap-sp.jpg"
    If Model = 7 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t20-s01-s02.jpg"
    If Model = 8 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t30r.jpg"
    If Model = 9 And Typ = 1 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_t20r.jpg"
    If Model = 1 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l10-12.jpg"
    If Model = 2 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l12-l16.jpg"
    If Model = 3 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l10-12as.jpg"
    If Model = 4 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l10-12-i.jpg"
    If Model = 5 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l14-16.jpg"
    If Model = 6 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l20.jpg"
    If Model = 7 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l12-l20ls.jpg"
    If Model = 8 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l10-12ac.jpg"
    If Model = 9 And Typ = 2 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_l6-8-10-12-zt.jpg"
    If Model = 1 And Typ = 3 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_e12-14-15-16.jpg"
    If Model = 2 And Typ = 3 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_e20.jpg"
    If Model = 3 And Typ = 3 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_e20-25-30-35.jpg"
    If Model = 1 And Typ = 4 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_r16-20.jpg"
    If Model = 2 And Typ = 4 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_r14-16-20n-20n.jpg"
    If Model = 3 And Typ = 4 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_r10c-12c-14c.jpg"
    If Model = 4 And Typ = 4 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_r14-16-18sp.jpg"
    If Model = 5 And Typ = 4 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_a10z.jpg"
    If Model = 1 And Typ = 5 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_n20n.jpg"
    If Model = 2 And Typ = 5 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_v08-01-v08-02.jpg"
    If Model = 1 And Typ = 6 And Brend = 2 Then Get_Icon = App.Path & "\f\l\" & "l_k.jpg"
    
    If Model = 1 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eje-116-120.jpg"
    If Model = 2 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eje-c20.jpg"
    If Model = 3 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eje-220-230.jpg"
    If Model = 4 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eme-112-114.jpg"
    If Model = 5 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ele-116-120.jpg"
    If Model = 6 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ere-120.jpg"
    If Model = 7 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ere-225.jpg"
    If Model = 8 And Typ = 1 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ese-220-530.jpg"
    If Model = 1 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_hc-110.jpg"
    If Model = 2 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_emc-110.jpg"
    If Model = 3 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ejc-110-112.jpg"
    If Model = 4 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ejc-212-220.jpg"
    If Model = 5 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_erd-220.jpg"
    If Model = 6 And Typ = 2 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_erc-210-216.jpg"
    If Model = 1 And Typ = 3 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efg-110-115.jpg"
    If Model = 2 And Typ = 3 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efg-213-220.jpg"
    If Model = 3 And Typ = 3 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efg-316-320.jpg"
    If Model = 4 And Typ = 3 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efg-425-430.jpg"
    If Model = 5 And Typ = 3 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efg-535-550.jpg"
    If Model = 1 And Typ = 4 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_etv-110-116.jpg"
    If Model = 2 And Typ = 4 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_etv-214-216.jpg"
    If Model = 3 And Typ = 4 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_etv-320-325.jpg"
    If Model = 4 And Typ = 4 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_etv-c16-c20.jpg"
    If Model = 5 And Typ = 4 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_etv-q20-q25.jpg"
    If Model = 1 And Typ = 5 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ece-118.jpg"
    If Model = 2 And Typ = 5 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ece-225.jpg"
    If Model = 3 And Typ = 5 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eks-110.jpg"
    If Model = 4 And Typ = 5 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_eks-310-312.jpg"
    If Model = 1 And Typ = 6 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ekx-410.jpg"
    If Model = 2 And Typ = 6 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_ekx-513-516(K).jpg"
    If Model = 3 And Typ = 6 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efx-410-413.jpg"
    If Model = 4 And Typ = 6 And Brend = 1 Then Get_Icon = App.Path & "\f\j\" & "j_efx-513-515.jpg"
    
    If Model = 1 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ecu-16-20.jpg"
    If Model = 2 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ecu-25-30.jpg"
    If Model = 3 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_egu-16-20.jpg"
    If Model = 4 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_exu-16-20.jpg"
    If Model = 5 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ecu-sf-20.jpg"
    If Model = 6 And 1 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_exu-sf-20.jpg"
    If Model = 1 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_cl-10.jpg"
    If Model = 2 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_cn-cni-cns.jpg"
    If Model = 3 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_egd-18.jpg"
    If Model = 4 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_exv10-12.jpg"
    If Model = 5 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_exv10-12.jpg"
    If Model = 6 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_cx-10-20.jpg"
    If Model = 7 And 2 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_egv-10-18.jpg"
    If Model = 1 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_r-20.jpg"
    If Model = 2 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_r-50.jpg"
    If Model = 3 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_rx-50.jpg"
    If Model = 4 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_r-20.jpg"
    If Model = 5 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_r-50.jpg"
    If Model = 6 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_r-60.jpg"
    If Model = 7 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_rx-20.jpg"
    If Model = 8 And 3 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_rx-60.jpg"
    If Model = 1 And 4 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_fm-x.jpg"
    If Model = 2 And 4 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_fm-i.jpg"
    If Model = 3 And 4 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_fm-se.jpg"
    If Model = 4 And 4 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_fv-x.jpg"
    If Model = 1 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_cop.jpg"
    If Model = 2 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_efu.jpg"
    If Model = 3 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ek-x-2101.jpg"
    If Model = 4 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ek-x-2101.jpg"
    If Model = 5 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_fu.jpg"
    If Model = 6 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ek-x-2131.jpg"
    If Model = 7 And 5 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_ek-10-11.jpg"
    If Model = 1 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_gx-x.jpg"
    If Model = 2 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_gx-q.jpg"
    If Model = 3 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_mx-x.jpg"
    If Model = 4 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_mx-q.jpg"
    If Model = 5 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_mx-13.jpg"
    If Model = 6 And 6 And Brend = 3 Then Get_Icon = App.Path & "\f\s\" & "s_mx-15.jpg"
    
    If Model = 1 And 1 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_lwe.jpg"
    If Model = 2 And 1 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_lpe.jpg"
    If Model = 3 And 1 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_lse.jpg"
    If Model = 4 And 1 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_lre.jpg"
    If Model = 1 And 2 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_swe.jpg"
    If Model = 2 And 2 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_hwe.jpg"
    If Model = 3 And 2 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_spe.jpg"
    If Model = 4 And 2 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_sse.jpg"
    If Model = 5 And 2 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_sre.jpg"
    If Model = 1 And 3 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_c3e.jpg"
    If Model = 2 And 3 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_cbe-dc.jpg"
    If Model = 3 And 3 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_c3e.jpg"
    If Model = 4 And 3 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_c4e.jpg"
    If Model = 1 And 4 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_rrm.jpg"
    If Model = 2 And 4 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_rr-n-b-e.jpg"
    If Model = 3 And 4 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_fre.jpg"
    If Model = 4 And 4 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_rwe.jpg"
    If Model = 1 And 5 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_ose.jpg"
    If Model = 2 And 5 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_tse.jpg"
    If Model = 3 And 5 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_ome.jpg"
    If Model = 4 And 5 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_ope.jpg"
    If Model = 1 And 6 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_vce.jpg"
    If Model = 2 And 6 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_c.jpg"
    If Model = 3 And 6 And Brend = 4 Then Get_Icon = App.Path & "\f\b\" & "b_vr.jpg"
End Function

Public Function Addr_Server() As String 'достаём из файла адрес сервера, если файла не существует, то создаётся новый со строкой "Server=localhost"
    Dim Ar_s As String
    On Error Resume Next
    Open (Path_File) For Input As #10
    Line Input #10, Ar_s
    If Err Then 'если файл пустой или не существует, то создаём новый со стандартной строкой
        Close #10
        Open (Path_File) For Output As #10
        Print #10, "Server=localhost"
        MsgBox "Файл конфигурации не найден и создан новый!"
        Ar_s = "Server=localhost"
        Close #10
    Else
        Close #10
    End If
    Addr_Server = "localhost"
    If Len(Ar_s) Then
        If Mid(Ar_s, 1, 7) = "Server=" Then
            Addr_Server = Trim(Mid(Ar_s, 8, Len(Ar_s)))
        End If
    End If
End Function

Public Sub Buff_Priv(Send)
    Form1.Timer11.Enabled = True
    For i = 0 To UBound(Buffer_Priv)
        If Buffer_Priv(i) = Send Then Exit For
    Next
    
    If i > UBound(Buffer_Priv) Then 'если в списке нет привязки, то добавляем её
        If Not (UBound(Buffer_Priv) = 0 And Buffer_Priv(0) = "") Then ReDim Preserve Buffer_Priv(UBound(Buffer_Priv) + 1)
        Buffer_Priv(UBound(Buffer_Priv)) = Send
        Form5.Label1 = "Ожидание ответа от сервера"
        Form1.Enabled = False
        Form5.Show
    Else 'если привязка найдена в списке, то удаляем её
        If i < UBound(Buffer_Priv) Then
            For ii = i To UBound(Buffer_Priv) - 1
                Buffer_Priv(ii) = Buffer_Priv(ii + 1)
            Next
        End If
        If UBound(Buffer_Priv) > 0 Then ReDim Preserve Buffer_Priv(UBound(Buffer_Priv) - 1) Else Buffer_Priv(0) = "": Form1.Timer11.Enabled = False
        Form5.Visible = False
        Form1.Enabled = True
        Form1.Show
    End If
End Sub

