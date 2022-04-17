Attribute VB_Name = "Statistica"


'ElseIf Mid(Get_st, 1, 5) = "Stat>" Then
'        Ar = Split(Mid(Get_st, 6, Len(Get_st)), "|")
'        If Mid(Ar(0), 1, 1) = "P" Then
'            For i = 0 To UBound(Pers)
'                If Val(Mid(Ar(0), 2, 10)) = Pers(i).UID Then Exit For
'            Next
'            iii = i 'index массива персонала в котором хранится информация о присланном сотруднике
'        End If
'        If UBound(Ar) > 0 Then
'            List.Clear
'            Dim dd1 As Date, Counter As Long
'            ReDim Exc(0)
'            For i = 1 To UBound(Ar)
'               arr = Split(Ar(i), "<") 'arr(0)=дата начала(открытие сессии); arr(1)=длительность сессии в секундах;arr(2)=борт
'               For i_ = 0 To UBound(Teh)
'                    If arr(2) = Teh(i_).UID Then arr(2) = Teh(i_).ID: Exit For
'               Next
'                If UBound(arr) > 0 Then
'                    If Det = False And Filter(1).Value Then
'                        If dd1 <> Mid(arr(0), 1, 10) Then
'                            ReDim Preserve Exc(UBound(Exc) + 1)
'                            If List.ListCount = 1 Then
'                                List.List(List.ListCount - 1) = "[" & dd1 & "] " & Pers(iii).Surname & " " & Pers(iii).Name & " проработал " & Format(Counter / 60, "0.0") & " мин."
'                                Exc(UBound(Exc) - 1).d1 = Exc(UBound(Exc) - 1).d1
'                                Exc(UBound(Exc) - 1).d2 = DateAdd("s", Counter, Exc(UBound(Exc) - 1).d1)
'                                Exc(UBound(Exc) - 1).diff_d2_d1 = Counter
'                                Exc(UBound(Exc) - 1).ID_bort = arr(2)
'                                Exc(UBound(Exc) - 1).FIO = Pers(iii).Surname & " " & Pers(iii).Name & " " & Pers(iii).Lastname
'                                Exc(UBound(Exc) - 1).RFID = Pers(iii).RFID
'                            End If
'                            dd1 = Mid(arr(0), 1, 10)
'                            Exc(UBound(Exc)).d1 = arr(0)
'                            Exc(UBound(Exc)).d2 = DateAdd("s", Counter, Exc(UBound(Exc)).d1)
'                            Exc(UBound(Exc)).diff_d2_d1 = Counter
'                            Exc(UBound(Exc)).ID_bort = arr(2)
'                            Exc(UBound(Exc)).FIO = Pers(iii).Surname & " " & Pers(iii).Name & " " & Pers(iii).Lastname
'                            Exc(UBound(Exc)).RFID = Pers(iii).RFID
'                            'MsgBox UBound(Exc)
'                            List.AddItem "[" & dd1 & "] " & Pers(iii).Surname & " " & Pers(iii).Name & " проработал " & _
'                                Format(Counter / 60, "0.0") & " мин."
'                            Counter = 0
'                        End If
'                        Counter = Counter + Val(arr(1))
'                    Else
'                        ReDim Preserve Exc(UBound(Exc) + 1)
'                        Exc(UBound(Exc)).d1 = arr(0)
'                        Exc(UBound(Exc)).d2 = DateAdd("s", arr(1), arr(0))
'                        Exc(UBound(Exc)).diff_d2_d1 = arr(1)
'                        Exc(UBound(Exc)).ID_bort = arr(2)
'                        Exc(UBound(Exc)).FIO = Pers(iii).Surname & " " & Pers(iii).Name & " " & Pers(iii).Lastname
'                        Exc(UBound(Exc)).RFID = Pers(iii).RFID
'                        List.AddItem i & ". Борт #" & arr(2) & " авторизовал карту в: [" & arr(0) & "] на " & Format(arr(1) / 60, "0.0") & " мин. " & _
'                        Pers(iii).Surname & " " & Pers(iii).Name
'                    End If
'                End If
'            Next
'            If Det = False And List.ListCount = 1 And Filter(1) Then
'                List.List(List.ListCount - 1) = "[" & dd1 & "] " & Pers(iii).Surname & " " & Pers(iii).Name & " проработал " & _
'                    Format(Counter / 60, "0.0") & " мин."
'                dd1 = Mid(arr(0), 1, 10)
'                ReDim Preserve Exc(UBound(Exc))
'                'Exc(UBound(Exc)).d1 = dd1
'                Exc(UBound(Exc)).d2 = DateAdd("s", Counter, Exc(UBound(Exc)).d1)
'                Exc(UBound(Exc)).diff_d2_d1 = Counter
'                Exc(UBound(Exc)).ID_bort = arr(2)
'                Exc(UBound(Exc)).FIO = Pers(iii).Surname & " " & Pers(iii).Name & " " & Pers(iii).Lastname
'                Exc(UBound(Exc)).RFID = Pers(iii).RFID
''            ElseIf Filter(0) And List.ListCount = 1 Then
''                List.List(List.ListCount - 1) = "[" & dd1 & "] " & Pers(iii).Surname & " " & Pers(iii).Name & " проработал " & _
''                    Format(Counter / 60, "0.0") & " мин."
'            ElseIf Det = False Then
'                Exc(UBound(Exc)).d2 = DateAdd("s", Counter, Exc(UBound(Exc)).d1)
'                Exc(UBound(Exc)).diff_d2_d1 = Counter
'                Exc(UBound(Exc)).ID_bort = arr(2)
'                Exc(UBound(Exc)).FIO = Pers(iii).Surname & " " & Pers(iii).Name & " " & Pers(iii).Lastname
'                Exc(UBound(Exc)).RFID = Pers(iii).RFID
'            End If
'            List.Clear
'            For i = 1 To UBound(Exc)
'                List.AddItem Exc(i).d1 & " " & Exc(i).d2 & " " & Exc(i).diff_d2_d1
'            Next
'        End If
'        'MsgBox Get_st
'        'MsgBox UBound(Ar)
'
