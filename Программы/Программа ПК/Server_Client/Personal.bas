Attribute VB_Name = "Personal"
Public Sub List_pers(Index) 'загрузка списка персонала и подсчёт эффективности персонала
    With Form1
        '2. Выявление былали техника или сотрудник авторизованы сегодня
        '3. Подсчёт эффективности борта за месяц в процентах
        '4. Последовательная передача данных персонала клиенту Addpn:
        '5. Завершение передачи данных персонала клиенту Addpk:
        
'        Perss(i) = ((Perss(i) / 3600) * 100) / (Day(Date) * Smena)
'        If Perss(i) > 100 Then Perss(i) = 100
        Temp_pers = Index: Incr_pers = 0
        'Form1.Timer4.Enabled = True
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
