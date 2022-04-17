Attribute VB_Name = "Personal"
Public Type Personal_type 'Тип описания карточки персонала
    UID As Integer
    Name As String
    Surname As String
    Lastname As String
    Date As String
    Position As String 'профессия
    RFID As String
    Ocenka As Byte
    Prava As String
    Sex As String 'пол
    Effect As Integer 'эффективность
    Flag As Boolean 'флажок в списке
    Ism_Kard As Boolean 'было ли изменение в карте
End Type

Global Pers() As Personal_type 'массив для хранения информации о персонале

Public Sub Add_pers_item(ByVal UID As String, ByVal Surname As String, ByVal Name As String, ByVal Lastname As String, ByVal Position As String, ByVal RFID As String, ByVal Date_ As String, ByVal Ocenka As String, ByVal Prava As String, ByVal Sex As String, ByVal Effect As String)
    Dim I_tmp As Integer
    With Form1
        .Frame_p.Width = .Sc_p.Left - .Frame_p.Left * 2
        If UBound(Pers) = 0 And Pers(0).UID = 0 Then
            .Pers_index(0).Move .Pers_index(0).Left, .Pers_index(0).Top, .Frame_p.Width, 84 * 15
        Else
            I_tmp = UBound(Pers)
            ReDim Preserve Pers(I_tmp + 1)
            Load .Pers_index(I_tmp + 1)
            I_tmp = UBound(Pers)
            .Pers_index(I_tmp).Move .Pers_index(I_tmp - 1).Left, .Pers_index(I_tmp - 1).Top + .Pers_index(I_tmp - 1).Height + 6 * 15
        End If
        .Pers_index(I_tmp).Visible = True
        Pers(I_tmp).Surname = Surname
        Pers(I_tmp).Name = Name
        Pers(I_tmp).Lastname = Lastname
        Pers(I_tmp).Date = Date_
        Pers(I_tmp).Position = Position
        Pers(I_tmp).RFID = RFID
        Pers(I_tmp).Ocenka = Ocenka
        Pers(I_tmp).UID = IIf(UID = "", Max_UID("pers"), UID)
        Pers(I_tmp).Prava = Prava
        Pers(I_tmp).Sex = Sex
        Pers(I_tmp).Effect = IIf(Effect > 100, 100, Effect)
        .List1.AddItem Pers(I_tmp).Surname & "|" & I_tmp
        Paint_pers_item I_tmp
    End With
End Sub

Public Sub Paint_pers_item(I_tmp)
    With Form1
        'прорисовка элемента
        .Pers_index(I_tmp).Width = .Frame_p.Width
        .Pers_index(I_tmp).Cls
        LoadImage App.Path & "\res\" & "Logo_user.png", .Pers_index(I_tmp).hdc, 12, 12 'иконка борта
        If Pers(I_tmp).Flag Then LoadImage App.Path & "\res\" & "flag.png", .Pers_index(I_tmp).hdc, 12, 12  'флаг
        Ef_paint .Pers_index(I_tmp), 92 * 15, .Pers_index(I_tmp).Height - 555, Pers(I_tmp).Effect  'прорисовка эфективности
        LoadImage App.Path & "\res\" & "prava_note.png", .Pers_index(I_tmp).hdc, 295, (.Pers_index(I_tmp).Height - 555) / 15 'иконка прав и блокнота
        .Pers_index(I_tmp).FontSize = 20: .Pers_index(I_tmp).ForeColor = &H948882
        .Pers_index(I_tmp).CurrentX = 315 * 15: .Pers_index(I_tmp).CurrentY = .Pers_index(I_tmp).Height - 675
        '.Pers_index(I_tmp).Print Pers(I_tmp).Prava 'категория прав
        
        .Pers_index(I_tmp).FontSize = 20: .Pers_index(I_tmp).ForeColor = &H948882
        .Pers_index(I_tmp).CurrentX = 345 * 15: .Pers_index(I_tmp).CurrentY = .Pers_index(I_tmp).Height - 675
        .Pers_index(I_tmp).Print Pers(I_tmp).Ocenka  'Оценка
        
        .Pers_index(I_tmp).Line (390 * 15, .Pers_index(I_tmp).Height - 675)-(410 * 15, .Pers_index(I_tmp).Height - 100), QBColor(15), BF
        .Pers_index(I_tmp).FontSize = 20: .Pers_index(I_tmp).ForeColor = &H948882
        .Pers_index(I_tmp).CurrentX = 390 * 15: .Pers_index(I_tmp).CurrentY = .Pers_index(I_tmp).Height - 675
        .Pers_index(I_tmp).Print Note_p(I_tmp) 'количество заметок
        
        .Pers_index(I_tmp).ForeColor = 0
        LoadImage App.Path & "\res\" & "frame_online.png", .Pers_index(I_tmp).hdc, .Pers_index(I_tmp).Width \ 15 - 211, .Pers_index(I_tmp).Height \ 15 \ 2 - 30 'фрейм онлайн техники
        Select Case Pers(I_tmp).Position
            Case 1
                pic_name = "op_ms.png": .Pers_index(I_tmp).CurrentX = 160 * 15
            Case 2
                pic_name = "op_op.png": .Pers_index(I_tmp).CurrentX = 175 * 15
            Case 3
                pic_name = "op_meh.png": .Pers_index(I_tmp).CurrentX = 167 * 15
            Case 4
                pic_name = "op_ak.png": .Pers_index(I_tmp).CurrentX = 220 * 15
            'Case 5
            '    pic_name = "op_oth.png": .Pers_index(I_tmp).CurrentX = 155 * 15
            Case 5
                pic_name = "op_klad.png": .Pers_index(I_tmp).CurrentX = 186 * 15
            Case 6
                pic_name = "op_kom.png": .Pers_index(I_tmp).CurrentX = 220 * 15
        End Select
        LoadImage App.Path & "\res\" & pic_name, .Pers_index(I_tmp).hdc, 92, 12 'тип техники
        .Pers_index(I_tmp).FontSize = 12
        .Pers_index(I_tmp).ForeColor = &H948882: .Pers_index(I_tmp).CurrentY = 13 * 15
        .Pers_index(I_tmp).Print Pers(I_tmp).Surname & " " & Pers(I_tmp).Name & ", " & _
            DateDiff("yyyy", IIf(Pers(I_tmp).Date = "", Date, Pers(I_tmp).Date), Date) & " л. Карта: " & Pers(I_tmp).RFID & " " & I_tmp & "  " & Pers(I_tmp).UID  'вывод имени сотрудника
    End With
    'прорисовка элемента
End Sub

Public Sub Drug_Pers(Index As Integer, X As Single, Y As Single)
    With Form1
        Seach_Priv_Pers Index 'поиск привязки по индексу и заполнение, найдеными элементами, массива Priv_tmp
        Priv_ind = -1
        .Timer1.Enabled = True
        Dim x_tm, y_tm
        x_tm = .Pers_index(Index).Left: y_tm = .Pers_index(Index).Top
        Set .Pers_index(Index).Container = Form1
        Call ReleaseCapture
        .Pers_index(Index).Move .Pers_index(Index).Left + .Pers_win.Left + 15 + .Frame_p.Left, .Pers_index(Index).Top + .Pers_win.Top + 15 + .Frame_p.Top
        Call SendMessage(.Pers_index(Index).hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
        Set .Pers_index(Index).Container = .Frame_p
        .Pers_index(Index).Left = x_tm: .Pers_index(Index).Top = y_tm
        .Timer1.Enabled = False
        If Priv_ind > -1 And .Online.BackColor = QBColor(10) Then
            If UBound(Priv) = 0 And Priv(0).UID_Pers = 0 Then Priv(0).UID_Pers = Pers(Index).UID: Priv(0).UID_Teh = Teh(Priv_ind).UID _
                Else ReDim Preserve Priv(UBound(Priv) + 1): Priv(UBound(Priv)).UID_Pers = Pers(Index).UID: Priv(UBound(Priv)).UID_Teh = Teh(Priv_ind).UID
            tyu = "@Add_Priv@" & Priv(UBound(Priv)).UID_Teh & "|" & Priv(UBound(Priv)).UID_Pers
            .WinS.SendData tyu
            Buff_Priv tyu
            Flash_Priv = Val(Priv_ind) & "|" & Val(Index)
'            Form5.Label1 = "Ожидание ответа от сервера"
'            Form1.Enabled = False
'            Form5.Show
            Flash_Bool = False: Flash_incr = 0: Form1.Timer8.Enabled = True
            Dopusk ' прорисовка количества допущеных карт и бортов
        End If
        For i = 0 To .Teh_index.UBound
            LoadImage App.Path & "\res\" & "priv_n.png", .Teh_index(i).hdc, .Teh_index(i).Width \ 15 - 28, .Teh_index(i).Height \ 15 \ 2 - 6 'фрейм онлайн техники
            .Teh_index(i).Refresh
        Next
        .Pers_win.Refresh
        .Teh_win.Refresh
    End With
End Sub

Public Sub Drug_Pers_Timer()
    GetCursorPos Cur
    Priv_ind = -1
    With Form1
        For i = 0 To .Teh_index.UBound
            For ii = 0 To UBound(Priv_tmp)
                If Teh(i).UID = Priv_tmp(ii) Then Exit For
            Next
            If .Teh_index(i).Visible And Cur.X * 15 > .Left + .Teh_win.Left + .Teh_index(i).Left And _
                Cur.X * 15 < .Left + .Teh_win.Left + .Teh_index(i).Left + .Teh_index(i).Width And _
                    Cur.Y * 15 > .Top + .Teh_win.Top + .Teh_index(i).Top + .Frame_t.Top And _
                        Cur.Y * 15 < .Top + .Teh_win.Top + .Teh_index(i).Top + .Teh_index(i).Height + .Frame_t.Top And ii = UBound(Priv_tmp) + 1 Then
                Priv_ind = i
                Form1.Label7 = i
                Form1.Teh_index(i).DrawWidth = 2
                Form1.Teh_index(i).Line (15, 15)-(Form1.Teh_index(i).Width - 15, Form1.Teh_index(i).Height - 15), , B
            Else
                LoadImage App.Path & "\res\" & IIf(ii = UBound(Priv_tmp) + 1, "priv_y.png", "priv_no.png"), .Teh_index(i).hdc, .Teh_index(i).Width \ 15 - 28, .Teh_index(i).Height \ 15 \ 2 - 6
                .Teh_index(i).Refresh
                Form1.Teh_index(i).Line (15, 15)-(Form1.Teh_index(i).Width - 15, Form1.Teh_index(i).Height - 15), QBColor(15), B
            End If
        Next
    End With
End Sub

Public Sub Seach_Priv_Pers(Index As Integer)
    ReDim Priv_tmp(0)
    For i = 0 To UBound(Priv)
        If Priv(i).UID_Pers = Pers(Index).UID Then
            If UBound(Priv_tmp) = 0 And Priv_tmp(0) = 0 Then Priv_tmp(0) = Priv(i).UID_Teh _
                Else ReDim Preserve Priv_tmp(UBound(Priv_tmp) + 1): Priv_tmp(UBound(Priv_tmp)) = Priv(i).UID_Teh
        End If
    Next
End Sub
