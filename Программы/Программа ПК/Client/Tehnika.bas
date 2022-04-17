Attribute VB_Name = "Tehnika"
Public Type Tehnika_type 'Тип описания карточки техники
    UID As Integer
    ID As Byte
    Type As Byte
    Brend As Byte
    Model As Byte
    Gp As Single
    Vp As Single
    God As String
    Gnomer As String
    Ocenka As Byte
    Prava As String
    Effect As Integer
    Priv_tmp As Boolean
    Flag As Boolean
    Ism_Kard As Boolean 'было ли изменение в карте
    Porog_X As Long
    Porog_Z As Single
End Type

Public Type Brend_
    Jungheinrich() As String
    Linde() As String
    Still() As String
    BT() As String
End Type

Public Type Type_
    Electrotel As Brend_
    Shtab As Brend_
    Electropogruz As Brend_
    Rich As Brend_
    Komplect As Brend_
    Uzkoprohod As Brend_
End Type

Global Teh() As Tehnika_type 'массив для хранения информации о технике
Global t_t As Type_

Public Sub Teh_init() 'Инициализация брендов и типов техники
    ReDim t_t.Electropogruz.BT(0)
     ReDim t_t.Electropogruz.BT(3): ReDim t_t.Electropogruz.Jungheinrich(4): ReDim t_t.Electropogruz.Linde(2): ReDim t_t.Electropogruz.Still(7)
     ReDim t_t.Electrotel.BT(3): ReDim t_t.Electrotel.Jungheinrich(7): ReDim t_t.Electrotel.Linde(8): ReDim t_t.Electrotel.Still(5)
     ReDim t_t.Komplect.BT(3): ReDim t_t.Komplect.Jungheinrich(3): ReDim t_t.Komplect.Linde(1): ReDim t_t.Komplect.Still(6)
     ReDim t_t.Rich.BT(3): ReDim t_t.Rich.Jungheinrich(4): ReDim t_t.Rich.Linde(4): ReDim t_t.Rich.Still(3)
     ReDim t_t.Shtab.BT(4): ReDim t_t.Shtab.Jungheinrich(6): ReDim t_t.Shtab.Linde(8): ReDim t_t.Shtab.Still(6)
     ReDim t_t.Uzkoprohod.BT(2): ReDim t_t.Uzkoprohod.Jungheinrich(3): ReDim t_t.Uzkoprohod.Linde(0): ReDim t_t.Uzkoprohod.Still(5)
     'Jungheinrich:
     t_t.Electrotel.Jungheinrich(0) = "EJE-116-120"
     t_t.Electrotel.Jungheinrich(1) = "EJE-C20"
     t_t.Electrotel.Jungheinrich(2) = "EJE-220-230"
     t_t.Electrotel.Jungheinrich(3) = "EME-112-114"
     t_t.Electrotel.Jungheinrich(4) = "ELE-116-120"
     t_t.Electrotel.Jungheinrich(5) = "ERE-120"
     t_t.Electrotel.Jungheinrich(6) = "ERE-225"
     t_t.Electrotel.Jungheinrich(7) = "ESE-220-530"
     t_t.Shtab.Jungheinrich(0) = "HC-110"
     t_t.Shtab.Jungheinrich(1) = "EMC-110"
     t_t.Shtab.Jungheinrich(2) = "EJC-110-112"
     t_t.Shtab.Jungheinrich(3) = "EJC 212-220"
     t_t.Shtab.Jungheinrich(4) = "ERD-220"
     t_t.Shtab.Jungheinrich(5) = "ERC-212-216"
     t_t.Electropogruz.Jungheinrich(0) = "EFG-110-115"
     t_t.Electropogruz.Jungheinrich(1) = "EFG-213-220"
     t_t.Electropogruz.Jungheinrich(2) = "EFG-316-320"
     t_t.Electropogruz.Jungheinrich(3) = "EFG-425-430"
     t_t.Electropogruz.Jungheinrich(4) = "EFG-535-550"
     t_t.Rich.Jungheinrich(0) = "ETV 110/112/114/116"
     t_t.Rich.Jungheinrich(1) = "ETM/ETV 214/216"
     t_t.Rich.Jungheinrich(2) = "ETV 320/325"
     t_t.Rich.Jungheinrich(3) = "ETV C16/C20"
     t_t.Rich.Jungheinrich(4) = "ETV Q20/Q25"
     t_t.Komplect.Jungheinrich(0) = "ECE 118"
     t_t.Komplect.Jungheinrich(1) = "ECE 225"
     t_t.Komplect.Jungheinrich(2) = "EKS 110"
     t_t.Komplect.Jungheinrich(3) = "EKS 310-312"
     t_t.Uzkoprohod.Jungheinrich(0) = "EKX 410"
     t_t.Uzkoprohod.Jungheinrich(1) = "EKX 513-516(K)"
     t_t.Uzkoprohod.Jungheinrich(2) = "EFX 410-413"
     t_t.Uzkoprohod.Jungheinrich(3) = "ETX 513-515"
     'Linde
     t_t.Electrotel.Linde(0) = "Т16\20Х"
     t_t.Electrotel.Linde(1) = "Т20\30"
     t_t.Electrotel.Linde(2) = "Т16\18\20L"
     t_t.Electrotel.Linde(3) = "T20AP"
     t_t.Electrotel.Linde(4) = "T20SP"
     t_t.Electrotel.Linde(5) = "T30AP\SP"
     t_t.Electrotel.Linde(6) = "T20 S01\S0"
     t_t.Electrotel.Linde(7) = "T30R"
     t_t.Electrotel.Linde(8) = "T20R"
     t_t.Shtab.Linde(0) = "L10\12"
     t_t.Shtab.Linde(1) = "L12\16"
     t_t.Shtab.Linde(2) = "L10\12AS"
     t_t.Shtab.Linde(3) = "L10\12i"
     t_t.Shtab.Linde(4) = "L14\16"
     t_t.Shtab.Linde(5) = "L20"
     t_t.Shtab.Linde(6) = "L12\L20LS"
     t_t.Shtab.Linde(7) = "L10\12AC"
     t_t.Shtab.Linde(8) = "L6\8\10\12ZT"
     t_t.Electropogruz.Linde(0) = "E12\14\15\16"
     t_t.Electropogruz.Linde(1) = "E20"
     t_t.Electropogruz.Linde(2) = "E20\25\30\35"
     t_t.Rich.Linde(0) = "R16\20"
     t_t.Rich.Linde(1) = "R14\16\20N\20N"
     t_t.Rich.Linde(2) = "R10C\12C\14C"
     t_t.Rich.Linde(3) = "R14\16\18SP"
     t_t.Rich.Linde(4) = "A10Z"
     t_t.Komplect.Linde(0) = "N20N"
     t_t.Komplect.Linde(1) = "V08-01\V08-02"
     t_t.Uzkoprohod.Linde(0) = "K"
     'Still
     t_t.Electrotel.Still(0) = "ECU16-20"
     t_t.Electrotel.Still(1) = "ECU25-30"
     t_t.Electrotel.Still(2) = "EGU16-20"
     t_t.Electrotel.Still(3) = "EXU16-22"
     t_t.Electrotel.Still(4) = "ECU-SF20"
     t_t.Electrotel.Still(5) = "EXU-SF20"
     t_t.Shtab.Still(0) = "CL-10"
     t_t.Shtab.Still(1) = "CN\Cni\CNS"
     t_t.Shtab.Still(2) = "EGD-18"
     t_t.Shtab.Still(3) = "EXV10-12"
     t_t.Shtab.Still(4) = "CS10-20"
     t_t.Shtab.Still(5) = "CX-10-20"
     t_t.Shtab.Still(6) = "EGV10-18"
     t_t.Electropogruz.Still(0) = "R20"
     t_t.Electropogruz.Still(1) = "R50"
     t_t.Electropogruz.Still(2) = "RX50"
     t_t.Electropogruz.Still(3) = "R20"
     t_t.Electropogruz.Still(4) = "R50"
     t_t.Electropogruz.Still(5) = "R60"
     t_t.Electropogruz.Still(6) = "RX20"
     t_t.Electropogruz.Still(7) = "RX60"
     t_t.Rich.Still(0) = "FM-X"
     t_t.Rich.Still(1) = "FM-i"
     t_t.Rich.Still(2) = "FM-SE"
     t_t.Rich.Still(3) = "FV-X"
     t_t.Komplect.Still(0) = "COP"
     t_t.Komplect.Still(1) = "EFU"
     t_t.Komplect.Still(2) = "EK-X2101"
     t_t.Komplect.Still(3) = "FS"
     t_t.Komplect.Still(4) = "FU"
     t_t.Komplect.Still(5) = "EK=X2131"
     t_t.Komplect.Still(6) = "EK10-11"
     t_t.Uzkoprohod.Still(0) = "GX-X"
     t_t.Uzkoprohod.Still(1) = "GX-Q"
     t_t.Uzkoprohod.Still(2) = "MX-X"
     t_t.Uzkoprohod.Still(3) = "MX-Q"
     t_t.Uzkoprohod.Still(4) = "MX-13"
     t_t.Uzkoprohod.Still(5) = "MX-15"
     'BT
    t_t.Electrotel.BT(0) = "LWE"
    t_t.Electrotel.BT(1) = "LPE"
    t_t.Electrotel.BT(2) = "LSE"
    t_t.Electrotel.BT(3) = "LRE"
    t_t.Shtab.BT(0) = "SWE"
    t_t.Shtab.BT(1) = "HWE"
    t_t.Shtab.BT(2) = "SPE"
    t_t.Shtab.BT(3) = "SSE"
    t_t.Shtab.BT(4) = "SRE"
    t_t.Electropogruz.BT(0) = "C3E"
    t_t.Electropogruz.BT(1) = "CBE dc"
    t_t.Electropogruz.BT(2) = "C3/4E ac"
    t_t.Electropogruz.BT(3) = "C4E"
    t_t.Rich.BT(0) = "RRM"
    t_t.Rich.BT(1) = "RR/N/B/E"
    t_t.Rich.BT(2) = "FRE"
    t_t.Rich.BT(3) = "RWE"
    t_t.Komplect.BT(0) = "OSE"
    t_t.Komplect.BT(1) = "TSE"
    t_t.Komplect.BT(2) = "OME"
    t_t.Komplect.BT(3) = "OPE"
    t_t.Uzkoprohod.BT(0) = "VCE"
    t_t.Uzkoprohod.BT(1) = "C"
    t_t.Uzkoprohod.BT(2) = "VR"
    
    Karta_t.List_BCt.AddItem "B": Karta_t.List_BCt.AddItem "C": Karta_t.List_BCt.AddItem "n/a"
    
    Karta_t.List_t.AddItem "Электротележка": Karta_t.List_t.AddItem "Штабелёр": Karta_t.List_t.AddItem "Электропогрузчик": Karta_t.List_t.AddItem "Ричтрак"
    Karta_t.List_t.AddItem "Комплектовщик": Karta_t.List_t.AddItem "Узкопроходник"
    Karta_t.List_b.AddItem "Jungheinrich": Karta_t.List_b.AddItem "Linde": Karta_t.List_b.AddItem "Still": Karta_t.List_b.AddItem "BT"
    
    Karta_p.List_p.AddItem "Мастер"
    Karta_p.List_p.AddItem "Оператор"
    Karta_p.List_p.AddItem "Механик"
    Karta_p.List_p.AddItem "Аккумуляторщик"
    Karta_p.List_p.AddItem "Кладовщик"
    Karta_p.List_p.AddItem "Комплектовщик"
    
    Karta_p.List_Oc.AddItem "1":    Karta_t.List_Oc.AddItem "1"
    Karta_p.List_Oc.AddItem "2":    Karta_t.List_Oc.AddItem "2"
    Karta_p.List_Oc.AddItem "3":    Karta_t.List_Oc.AddItem "3"
    Karta_p.List_Oc.AddItem "4":    Karta_t.List_Oc.AddItem "4"
    Karta_p.List_Oc.AddItem "5":    Karta_t.List_Oc.AddItem "5"
    
    For i = 2010 To Year(Date)
        Karta_t.List_God.AddItem i
    Next
    
    'Karta_p.List_BCp.AddItem "B": Karta_p.List_BCp.AddItem "C": Karta_p.List_BCp.AddItem "n/a"
    Karta_p.List_Sex.AddItem "Муж": Karta_p.List_Sex.AddItem "Жен"
End Sub

Public Sub set_pos_scroll(index, ByVal val) 'установка значений ползунков удара
    With Karta_t
        If index = 0 Then kff = 10000: val = val * 100: kfff = 880: delim = 100 Else kff = 150: kfff = 13: delim = 1
        .Scroll(index).Move (.Scroll_bar(index).Width - .Scroll(index).Width) * val \ kff
        If .Scroll(index).Left <= .Scroll_bar(index).Width \ 2 Then
            Cur_x = .Scroll(index).Left + .Scroll(index).Width + 30
        Else
            Cur_x = .Scroll(index).Left - .Label_cur(index).Width - 30
        End If
        .Label_cur(index).Move Cur_x, .Scroll_bar(index).Height \ 2 - .Label_cur(index).Height \ 2
        .Label_cur(index).Caption = (((.Scroll(index).Left + .Scroll(index).Width) * kff) \ ((.Scroll_bar(index).Width) - .Scroll(index).Width) - kfff) / delim
    End With
End Sub

Public Sub Add_teh_item(ByVal ID As String, ByVal Type_ As String, ByVal Brend As String, ByVal Model As String, ByVal Gp As String, _
    ByVal Vp As String, ByVal God As String, ByVal Gnomer As String, ByVal Ocenka As String, ByVal UID As String, _
        ByVal Prava As String, ByVal Effect As String, Porog_X, Porog_Z)
    Dim I_tmp As Integer
    With Form1
        .Frame_t.Width = .Sc_t.Left - .Frame_t.Left * 2
        If UBound(Teh) = 0 And Teh(0).UID = 0 Then
            .Teh_index(0).Move .Teh_index(0).Left, .Teh_index(0).Top, .Frame_t.Width, 84 * 15
        Else
            I_tmp = UBound(Teh)
            ReDim Preserve Teh(I_tmp + 1)
            Load .Teh_index(I_tmp + 1)
            I_tmp = UBound(Teh)
            .Teh_index(I_tmp).Move .Teh_index(I_tmp - 1).Left, .Teh_index(I_tmp - 1).Top + .Teh_index(I_tmp - 1).Height + 6 * 15, .Frame_t.Width, 84 * 15
        End If
        Teh(I_tmp).ID = val(ID)
        Teh(I_tmp).Type = Type_
        Teh(I_tmp).Brend = Brend
        Teh(I_tmp).Model = Model
        Teh(I_tmp).Gp = val(Gp)
        Teh(I_tmp).Vp = val(Vp)
        Teh(I_tmp).God = val(God)
        Teh(I_tmp).Gnomer = Gnomer
        Teh(I_tmp).Ocenka = val(Ocenka)
        Teh(I_tmp).UID = IIf(UID = "", Max_UID("teh"), UID)
        Teh(I_tmp).Prava = Prava
        Teh(I_tmp).Effect = IIf(Effect > 100, 100, Effect)
        Teh(I_tmp).Porog_X = Porog_X
        Teh(I_tmp).Porog_Z = Porog_Z
        '.List2.AddItem Teh(I_tmp).Vp & "|" & I_tmp
        'MsgBox IIf(Len(Teh(I_tmp).Vp) = 1, "0", "") & Teh(I_tmp).Vp
        'MsgBox Len(Trim$(Teh(I_tmp).Vp)) & vbNewLine & Teh(I_tmp).Vp
        .List2.AddItem Teh(I_tmp).Type & IIf(Len(Trim$(Teh(I_tmp).Vp)) = 1, "0", "") & Teh(I_tmp).Vp & "|" & I_tmp
        Paint_teh_item I_tmp
        .Teh_index(I_tmp).Visible = True
        '.Label7 = .Teh_index.UBound + 1
    End With
End Sub

Public Sub Paint_teh_item(I_tmp)
    'прорисовка элемента
    With Form1
        .Teh_index(I_tmp).Width = .Frame_t.Width
        .Teh_index(I_tmp).Cls
        If Teh(I_tmp).Model <> 0 Then
            LoadImage Get_Icon(Teh(I_tmp).Brend, Teh(I_tmp).Type, Teh(I_tmp).Model), .Teh_index(I_tmp).hdc, 16, 16, 50, 50
            LoadImage App.Path & "\res\" & "circle.png", .Teh_index(I_tmp).hdc, 11, 11 'фон окна редактирования борта
        End If
        Ef_paint .Teh_index(I_tmp), 92 * 15, .Teh_index(I_tmp).Height - 555, Teh(I_tmp).Effect 'прорисовка эфективности
        LoadImage App.Path & "\res\" & "prava_note.png", .Teh_index(I_tmp).hdc, 295, (.Teh_index(I_tmp).Height - 555) / 15 'иконка прав и блокнота
        .Teh_index(I_tmp).FontSize = 20: .Teh_index(I_tmp).ForeColor = &H948882
        .Teh_index(I_tmp).CurrentX = 315 * 15: .Teh_index(I_tmp).CurrentY = .Teh_index(I_tmp).Height - 675
        '.Teh_index(I_tmp).Print Karta_t.List_BCt.List(Teh(I_tmp).Prava - 1) 'категория прав
        If Teh(I_tmp).Flag Then LoadImage App.Path & "\res\" & "flag.png", .Teh_index(I_tmp).hdc, 12, 12  'флаг
        .Teh_index(I_tmp).FontSize = 20: .Teh_index(I_tmp).ForeColor = &H948882
        .Teh_index(I_tmp).CurrentX = 345 * 15: .Teh_index(I_tmp).CurrentY = .Teh_index(I_tmp).Height - 675
        .Teh_index(I_tmp).Print Teh(I_tmp).Ocenka  'Оценка

        .Teh_index(i).Line (390 * 15, .Teh_index(i).Height - 675)-(410 * 15, .Teh_index(i).Height - 100), QBColor(15), BF
        .Teh_index(I_tmp).FontSize = 20: .Teh_index(I_tmp).ForeColor = &H948882
        .Teh_index(I_tmp).CurrentX = 390 * 15: .Teh_index(I_tmp).CurrentY = .Teh_index(I_tmp).Height - 675
        .Teh_index(I_tmp).Print Note_t(i) 'количество заметок
        .Teh_index(I_tmp).ForeColor = 0
        LoadImage App.Path & "\res\" & "frame_online.png", .Teh_index(I_tmp).hdc, .Teh_index(I_tmp).Width \ 15 - 211, .Teh_index(I_tmp).Height \ 15 \ 2 - 30 'фрейм онлайн техники
        Select Case Teh(I_tmp).Type
            Case 1
                pic_name = "type_elt.png": .Teh_index(I_tmp).CurrentX = 215 * 15
            Case 2
                pic_name = "type_sht.png": .Teh_index(I_tmp).CurrentX = 175 * 15
            Case 3
                pic_name = "type_elp.png": .Teh_index(I_tmp).CurrentX = 230 * 15
            Case 4
                pic_name = "type_rich.png": .Teh_index(I_tmp).CurrentX = 162 * 15
            Case 5
                pic_name = "type_kom.png": .Teh_index(I_tmp).CurrentX = 215 * 15
            Case 6
                pic_name = "type_usk.png": .Teh_index(I_tmp).CurrentX = 215 * 15
        End Select
        LoadImage App.Path & "\res\" & pic_name, .Teh_index(I_tmp).hdc, 92, 12 'тип техники
        .Teh_index(I_tmp).FontSize = 12
        .Teh_index(I_tmp).ForeColor = &H948882: .Teh_index(I_tmp).CurrentY = 13 * 15
        Karta_t.List_b.ListIndex = Teh(I_tmp).Brend - 1: Karta_t.List_t.ListIndex = Teh(I_tmp).Type - 1
        .Teh_index(I_tmp).Print Mid(Karta_t.List_b.List(Teh(I_tmp).Brend - 1), 1, 5) & " " & Karta_t.List_n.List(Teh(I_tmp).Model - 1) & ", №" & Teh(I_tmp).Vp 'вывод внутреннего номера борта
    End With
    'прорисовка элемента
End Sub

Public Sub Drug_Teh(index As Integer, X As Single, Y As Single)
    With Form1
        Seach_Priv_Teh index
        Priv_ind = -1
        .Timer2.Enabled = True
        Dim x_tm, y_tm
        x_tm = .Teh_index(index).Left: y_tm = .Teh_index(index).Top
        Set .Teh_index(index).Container = Form1
        Call ReleaseCapture
        .Teh_index(index).Move .Teh_index(index).Left + .Teh_win.Left + 15 + .Frame_t.Left, .Teh_index(index).Top + .Teh_win.Top + 15 + .Frame_t.Top
        Call SendMessage(.Teh_index(index).hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        Set .Teh_index(index).Container = .Frame_t '.Teh_win
        .Teh_index(index).Left = x_tm: .Teh_index(index).Top = y_tm
        .Timer2.Enabled = False
        If Priv_ind > -1 And .Online.BackColor = QBColor(10) Then
            If UBound(Priv) = 0 And Priv(0).UID_Teh = 0 Then Priv(0).UID_Teh = Teh(index).UID: Priv(0).UID_Pers = Pers(Priv_ind).UID _
                Else: ReDim Preserve Priv(UBound(Priv) + 1): Priv(UBound(Priv)).UID_Teh = Teh(index).UID: Priv(UBound(Priv)).UID_Pers = Pers(Priv_ind).UID
            tyu = "@Add_Priv@" & Priv(UBound(Priv)).UID_Teh & "|" & Priv(UBound(Priv)).UID_Pers
            .WinS.SendData tyu
            Buff_Priv tyu
            Flash_Priv = val(index) & "|" & val(Priv_ind)
            Flash_Bool = False: Flash_incr = 0: Form1.Timer8.Enabled = True
            Dopusk ' прорисовка количества допущеных карт и бортов
        End If
        For i = 0 To .Pers_index.UBound
            LoadImage App.Path & "\res\" & "priv_n.png", .Pers_index(i).hdc, .Pers_index(i).Width \ 15 - 28, .Pers_index(i).Height \ 15 \ 2 - 6 'фрейм онлайн техники
            .Pers_index(i).Refresh
        Next
        .Pers_win.Refresh
        .Teh_win.Refresh
    End With
End Sub

Public Sub Drug_Teh_Timer()
    GetCursorPos Cur
    Priv_ind = -1
    With Form1
        For i = 0 To .Pers_index.UBound
            For ii = 0 To UBound(Priv_tmp)
                If Pers(i).UID = Priv_tmp(ii) Then Exit For
            Next
            If .Pers_index(i).Visible And Cur.X * 15 > .Left + .Pers_win.Left + .Pers_index(i).Left And _
            Cur.X * 15 < .Left + .Pers_win.Left + .Pers_index(i).Left + .Pers_index(i).Width And _
            Cur.Y * 15 > .Top + .Pers_win.Top + .Pers_index(i).Top + .Frame_p.Top And _
            Cur.Y * 15 < .Top + .Pers_win.Top + .Pers_index(i).Top + .Pers_index(i).Height + .Frame_p.Top And ii = UBound(Priv_tmp) + 1 Then
                Priv_ind = i
                Form1.Pers_index(i).DrawWidth = 2
                Form1.Pers_index(i).Line (15, 15)-(Form1.Pers_index(i).Width - 15, Form1.Pers_index(i).Height - 15), , B
            Else
                LoadImage App.Path & "\res\" & IIf(ii = UBound(Priv_tmp) + 1, "priv_y.png", "priv_no.png"), .Pers_index(i).hdc, .Pers_index(i).Width \ 15 - 28, .Pers_index(i).Height \ 15 \ 2 - 6
                .Pers_index(i).Refresh
                Form1.Pers_index(i).Line (15, 15)-(Form1.Pers_index(i).Width - 15, Form1.Pers_index(i).Height - 15), QBColor(15), B
            End If
        Next
    End With
End Sub

Public Sub Seach_Priv_Teh(index As Integer)
    ReDim Priv_tmp(0)
    For i = 0 To UBound(Priv)
        If Priv(i).UID_Teh = Teh(index).UID Then
            If UBound(Priv_tmp) = 0 And Priv_tmp(0) = 0 Then Priv_tmp(0) = Priv(i).UID_Pers _
                Else ReDim Preserve Priv_tmp(UBound(Priv_tmp) + 1): Priv_tmp(UBound(Priv_tmp)) = Priv(i).UID_Pers
        End If
    Next
End Sub
