Attribute VB_Name = "Tehnika"
Public Sub List_teh_old(Index)
    Dim Tehhh() As Long
    With Form1
        ReDim List_tehh(0)
     .KS.RecordSource = "Tehnika" 'выбор таблицы
     .KS.Refresh
     .KS.Recordset.MoveFirst
     'List_teh = "#"
     ReDim Tehhh(0)
    Do While .KS.Recordset.EOF = False
        If .KS.Recordset.EOF = False Then If UBound(Tehhh) = 0 And Tehhh(0) = 0 Then Else ReDim Preserve Tehhh(UBound(Tehhh) + 1)
        Tehhh(UBound(Tehhh)) = .KS.Recordset(9)
        .KS.Recordset.MoveNext
    Loop
    Sum_T = 0 'сумма авторизованных бортов за сегодня
    For i = 0 To UBound(Tehhh)
        If Vid("T", Tehhh(i)) Then Sum_T = Sum_T + 1
        'Tehhh(i) = Effect("T", Tehhh(i))'Старый способ подсчёта эффективности
        'Оптимизированный способ подсчёта эффективности
        thhh = Tehhh(i)
        Tehhh(i) = 0
        For ii = 0 To UBound(Pers_teh_load)
            If Pers_teh_load(ii).UID_T = thhh Then Tehhh(i) = Tehhh(i) + Pers_teh_load(ii).Timee ': MsgBox ii & "/" & i & vbNewLine & Pers_teh_load(ii).UID_P & vbNewLine & psss
        Next
        Tehhh(i) = ((Tehhh(i) / 3600) * 100) / (Day(Date) * Smena)
        If Tehhh(i) > 100 Then Tehhh(i) = 100
        'Оптимизированный способ подсчёта эффективности
    Next
    i = 0
    ReDim List_tehh(0)
    .KS.RecordSource = "Tehnika" 'выбор таблицы
    .KS.Refresh
    .KS.Recordset.MoveFirst
     Do While .KS.Recordset.EOF = False
         If .KS.Recordset.EOF = False Then
             aaa = "Addtn:" & .KS.Recordset(0) & "|" & .KS.Recordset(1) & "|" & .KS.Recordset(2) & "|" & .KS.Recordset(3) & "|" & _
                .KS.Recordset(4) & "|" & .KS.Recordset(5) & "|" & .KS.Recordset(6) & "|" & .KS.Recordset(7) & "|" & .KS.Recordset(8) & _
                    "|" & .KS.Recordset(9) & "|" & .KS.Recordset(10) & "|" & Tehhh(i)
                If UBound(List_tehh) = 0 And List_tehh(0) = "" Then
                    List_tehh(0) = aaa
                Else
                    ReDim Preserve List_tehh(UBound(List_tehh) + 1)
                    List_tehh(UBound(List_tehh)) = aaa
                End If
         End If
         i = i + 1
         .KS.Recordset.MoveNext
     Loop
    .KS.Recordset.MoveLast
   End With
    If UBound(List_tehh) = 0 And List_tehh(0) = "" Then
        List_tehh(0) = "Addtk"
    Else
        ReDim Preserve List_tehh(UBound(List_tehh) + 1)
        List_tehh(UBound(List_tehh)) = "Addtk"
    End If
    Temp_teh = Index
    Incr_teh = 0
   Form1.Timer5.Enabled = True
End Sub

Public Sub List_teh(Index)
    With Form1
        Temp_teh = Index: Incr_teh = 0
        Form1.Timer5.Enabled = True
    End With
End Sub

