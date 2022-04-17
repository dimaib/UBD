Attribute VB_Name = "Personal"
Public Sub List_pers_Old(Index) 'загрузка списка персонала и подсчёт эффективности персонала
    Dim Perss() As Long
    With Form1
        ReDim Perss(0)
        .KS.RecordSource = "Personal" 'выбор таблицы
        .KS.Refresh
        .KS.Recordset.MoveFirst
        'List_pers = "!"
        Do While .KS.Recordset.EOF = False 'загрузка UIDов персонала
            If .KS.Recordset.EOF = False Then If UBound(Perss) = 0 And Perss(0) = 0 Then Else ReDim Preserve Perss(UBound(Perss) + 1)
            Perss(UBound(Perss)) = .KS.Recordset(8)
            .KS.Recordset.MoveNext
        Loop
        Sum_P = 0 'сумма авторизованных сотрудников за сегодня
        For i = 0 To UBound(Perss)
            If Vid("P", Perss(i)) Then Sum_P = Sum_P + 1 'выявление, была ли техника или сотрудник авторизован сегодня
            'Perss(i) = Effect("P", Perss(i)) 'Старый способ подсчёта эффективности
            'Оптимизированый способ подсчёта эффективности
            psss = Perss(i)
            Perss(i) = 0
            For ii = 0 To UBound(Pers_teh_load)
                If Pers_teh_load(ii).UID_P = psss Then Perss(i) = Perss(i) + Pers_teh_load(ii).Timee ': MsgBox ii & "/" & i & vbNewLine & Pers_teh_load(ii).UID_P & vbNewLine & psss
            Next
            Perss(i) = ((Perss(i) / 3600) * 100) / (Day(Date) * Smena)
            If Perss(i) > 100 Then Perss(i) = 100
            'Оптимизированый способ подсчёта эффективности
        Next
        i = 0
        ReDim List_perss(0)
        'MsgBox 333
        .KS.RecordSource = "Personal" 'выбор таблицы
        .KS.Refresh
        .KS.Recordset.MoveFirst
        '.Teh(Index).SendData "!"
        Do While .KS.Recordset.EOF = False
            If .KS.Recordset.EOF = False Then
                aaa = "Addpn:" & .KS.Recordset(1) & "|" & .KS.Recordset(2) & "|" & .KS.Recordset(3) & "|" & .KS.Recordset(4) & "|" & _
                .KS.Recordset(5) & "|" & .KS.Recordset(6) & "|" & .KS.Recordset(7) & "|" & .KS.Recordset(8) & "|" & .KS.Recordset(9) & _
                    "|" & .KS.Recordset(10) & "|" & Perss(i)
                '.Teh(Index).SendData aaa
                If UBound(List_perss) = 0 And List_perss(0) = "" Then
                    List_perss(0) = aaa
                Else
                    ReDim Preserve List_perss(UBound(List_perss) + 1)
                    List_perss(UBound(List_perss)) = aaa
                End If
            End If
            i = i + 1
            .KS.Recordset.MoveNext
        Loop
        If UBound(List_perss) = 0 And List_perss(0) = "" Then
            List_perss(0) = "Addpk"
        Else
            ReDim Preserve List_perss(UBound(List_perss) + 1)
            List_perss(UBound(List_perss)) = "Addpk"
        End If
        Temp_pers = Index
        Incr_pers = 0
        Form1.Timer4.Enabled = True
        .KS.Recordset.MoveLast
    End With
End Sub

Public Sub List_pers(Index) 'загрузка списка персонала и подсчёт эффективности персонала
    With Form1
        '2. Выявление былали техника или сотрудник авторизованы сегодня
        '3. Подсчёт эффективности борта за месяц в процентах
        '4. Последовательная передача данных персонала клиенту Addpn:
        '5. Завершение передачи данных персонала клиенту Addpk:
        
'        Perss(i) = ((Perss(i) / 3600) * 100) / (Day(Date) * Smena)
'        If Perss(i) > 100 Then Perss(i) = 100
        Temp_pers = Index: Incr_pers = 0
        Form1.Timer4.Enabled = True
'        .KS.Recordset.MoveLast
    End With
End Sub

Public Sub Add_Pers(F, i, O, Prof, RFID, Data_r, Oc, N, P, s)
    Form1.KS.RecordSource = "Personal" 'выбор таблицы
    Form1.KS.Refresh
    Form1.KS.Recordset.AddNew
    Form1.KS.Recordset(1) = F
    Form1.KS.Recordset(2) = i
    Form1.KS.Recordset(3) = O
    Form1.KS.Recordset(4) = Val(Prof)
    Form1.KS.Recordset(5) = Val(RFID)
    Form1.KS.Recordset(6) = Data_r
    Form1.KS.Recordset(7) = Val(Oc)
    Form1.KS.Recordset(8) = Val(N)
    Form1.KS.Recordset(9) = Val(P)
    Form1.KS.Recordset(10) = Val(s)
    Form1.KS.Recordset.Update
    ReDim Preserve BD.Pers(UBound(BD.Pers) + 1)
    BD.Pers(UBound(BD.Pers)).Name = i
    BD.Pers(UBound(BD.Pers)).Surname = F
    BD.Pers(UBound(BD.Pers)).Lastname = O
    BD.Pers(UBound(BD.Pers)).Prof = Val(Prof)
    BD.Pers(UBound(BD.Pers)).RFID = Val(RFID)
    BD.Pers(UBound(BD.Pers)).Data = Data_r
    BD.Pers(UBound(BD.Pers)).Ocenks = Val(Oc)
    BD.Pers(UBound(BD.Pers)).UID = Val(N)
    BD.Pers(UBound(BD.Pers)).Prava = P
    BD.Pers(UBound(BD.Pers)).Sex = Val(s)
End Sub
