Attribute VB_Name = "Global"
Public Type Session_ '��� ��� �������� ������
    Date_n As String '���� �������� ������
    Time_n As String '����� �������� �����
    UID_T As Integer 'UID �����
    UID_P As Integer 'UID ����������
    Date_Lost As String '����� ���������� ��������� ���������� � ����
    Incr_Zero As Integer '��������� ������� �����
    Incr_Other As Integer '���� �������� ����� ������������ �� UID_P, �� ���������� �������
End Type


Public Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

Global Dir_Res As String, ii As Long

Global Teh_list() As Integer

Global incr As Integer
Global Ignition_flag(200) As Boolean  '���� ���� �������, �� � ������� ����� �������� ���������
Global Udar_flag(35000) As Boolean '���� ��� ������ �����

Public Type Pers_teh_load_ '��� ��� �������� ������ � ��������� � �������
    UID_T As Integer
    UID_P As Integer
    Timee As Long
End Type

Global Raz(200) As Integer
Global RFID_raz() As Long
Global tmp_ As Integer
Global Terminal As String '������ ��� ���������. ������������ ����� ������ 2^31
Global Sum_P As Integer, Sum_T As Integer '����� �������� ������ � �������������� ����������� �� ����
Global List_perss() As String '������ ��� �������� ������ ���������
Global List_tehh() As String '������ ��� �������� ������ �������
Global Incr_pers As Byte '��������� ��� �������� ������ ���������
Global Incr_teh As Byte '��������� ��� �������� ������ �������
Global Incr_priv As Long '��������� ��� �������� ������ ����������
Global Temp_pers As Byte '�������� ������� ��� �������� ������ ���������
Global Temp_teh As Byte '�������� ������� ��� �������� ������ �������
Global Pers_teh_load() As Pers_teh_load_ '������ ��� �������� ������ � ��������� � �������
Global PPP As Integer, TTT As Integer

Global Flag_nach As Boolean ' ���� ������ �������� �������

Public Const Smena = 12


Public Function Is_Comp() As Boolean  '����������� ����� �� ������� �������� ���������
    On Error Resume Next
    Open "c:\WDT\KS.ini" For Input As #1
    Close 1
    If Err Then Is_Comp = False Else Is_Comp = True
End Function

Public Function List_Online() As String '��������� ������ ��������� ������� � ���������� ��������
    On Error Resume Next
    With Form1
        If .Teh.UBound > 0 Then
            List_Online = "List_Online="
            For incr = 1 To .Teh.UBound '����������� ������ ��������� �������
                If Is_Noth(incr) Then
                    If .Teh(incr).Tag <> "" And Mid$(.Teh(incr).Tag, 1, 1) <> "K" Then
                        List_Online = List_Online & .Teh(incr).Tag & "." & Raz(incr) & "|"
                    End If
                End If
            Next
            
            If List_Online <> "List_Online=" Then
                List_Online = Mid$(List_Online, 1, Len(List_Online) - 1) '����������� �� ������� ������ "|"
                'printf "---> " & List_Online
                For incr = 1 To .Teh.UBound
                    If Is_Noth(incr) Then
                        If Mid$(.Teh(incr).Tag, 1, 1) = "K" Then
                            .Teh(incr).SendData List_Online
                            'printf "***************" & incr
                        End If
                    End If
                Next
            Else
                List_Online = ""
            End If
        End If
    End With
End Function

Public Function ID_UID(ID As Integer) As Integer
    ID_UID = 0
    For i = 0 To UBound(BD.Teh)
        If BD.Teh(i).ID = ID Then ID_UID = BD.Teh(i).UID: Exit For
    Next
End Function

Public Function Is_Noth(Index) As Boolean '���� ����� � ������� index ����������, �� ������� ���������� 1, ����� 0
    On Error Resume Next
    sd = Form1.Teh(Index).Index
    Is_Noth = True
    If Err Then Is_Noth = False
End Function

Private Function UID_RFID(UID) As Long
    UID_RFID = 0
    For i = 0 To UBound(BD.Pers)
        If BD.Pers(i).UID = UID Then UID_RFID = BD.Pers(i).RFID: Exit For
    Next
End Function

Public Sub Add_Priv(Rz)
    Dim Ar__
    Ar__ = Split(Rz, "|")
    For i = 0 To UBound(BD.Razreshenia)
        If BD.Razreshenia(i).ID = Val(Ar__(0)) And BD.Razreshenia(i).RFID = Val(Ar__(1)) Then Exit For
    Next
    If i > UBound(BD.Razreshenia) Then
        Form1.KS.RecordSource = "Razreshenia" '����� �������
        Form1.KS.Refresh
        Form1.KS.Recordset.AddNew
        Form1.KS.Recordset(0) = Val(Ar__(0))
        Form1.KS.Recordset(1) = Val(Ar__(1))
        Form1.KS.Recordset.Update
        If Not (UBound(BD.Razreshenia) = 0 And BD.Razreshenia(0).ID = 0) Then ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) + 1)
        BD.Razreshenia(UBound(BD.Razreshenia)).ID = Val(Ar__(0))
        BD.Razreshenia(UBound(BD.Razreshenia)).RFID = Val(Ar__(1))
    End If
End Sub

Public Function List_Priv() As String
    List_Priv = "*"
    For i = 0 To UBound(BD.Razreshenia)
        List_Priv = List_Priv & BD.Razreshenia(i).ID & "|" & BD.Razreshenia(i).RFID & vbNewLine
    Next
End Function

Public Function List_Note() As String
    Form1.KS.RecordSource = "Notepad" '����� �������
    Form1.KS.Refresh
    List_Note = "List_Note>>" & PPP & ":" & TTT & "|"
    Do While Form1.KS.Recordset.EOF = False
        If Form1.KS.Recordset.EOF = False Then
            List_Note = List_Note & Form1.KS.Recordset("Type") & Form1.KS.Recordset("UID") & "|"
        End If
        Form1.KS.Recordset.MoveNext
    Loop
    If List_Note <> "List_Note>>" & PPP & ":" & TTT & "|" Then List_Note = Mid$(List_Note, 1, Len(List_Note) - 1)
End Function

Public Function Stat_(data_ot, data_do, UID_T_, UID_P_) As String '������������ ���������� �� ������� ��� ��������
    Dim d1 As String, d2 As String, t1 As String, t2 As String, q As String, tm_ar
    tm_ar = Split(data_ot, " ") ' tm_ar(0)=����1; tm_ar(1)=�����1
    Ar = Split(tm_ar(0), ".")
    t1 = "#" & tm_ar(1) & "#"
    d1 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
    tm_ar = Split(data_do, " ") ' tm_ar(0)=����2; tm_ar(1)=�����2
    Ar = Split(tm_ar(0), ".")
    t2 = "#" & tm_ar(1) & "#"
    d2 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#"
    'Stat_ = d1 & vbNewLine & d2
    If UID_T_ <> 0 Then
        q = " AND [UID_T]=" & UID_T_
        q_ = "T" & UID_T_
    ElseIf UID_P_ <> 0 Then
        q = " AND [UID_P]=" & UID_P_
        q_ = "P" & UID_P_
    End If
    'KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & q  '����� ������� � ����� ���� � �����������
    'MsgBox "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time_n] BETWEEN " & t1 & " AND " & t2 & q
    Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time_n] BETWEEN " & t1 & " AND " & t2 & q  '����� ������� � ����� ���� � �����������
    Form1.KS.Refresh
    Stat_ = "Stat>" & q_ & "|"
    Do While Form1.KS.Recordset.EOF = False
        If Form1.KS.Recordset.EOF = False Then
            If Form1.KS.Recordset("Status") <> "" Then _
                Stat_ = Stat_ & Form1.KS.Recordset("Date_n") & " " & Form1.KS.Recordset("Time_n") & "<" & Form1.KS.Recordset("Status") & "<" & _
                Form1.KS.Recordset(IIf(UID_T_ <> 0, "UID_P", "UID_T")) & "|"
        End If
        Form1.KS.Recordset.MoveNext
    Loop
    'If Stat_ <> "Stat>" Then Stat_ = mid$(Stat_, 1, Len(Stat_) - 1)
    Stat_ = Mid$(Stat_, 1, Len(Stat_) - 1)
End Function

Public Sub printf(Text) '����� ������ � ��������� ����
    'If Form1.Check1.Value Then
        If Len(Terminal) > 10000000 Then Terminal = ""
        Terminal = Terminal & "[" & Date & "  " & Time & "] " & Text & vbNewLine
        With Form1
            .Text1.Text = Terminal
            .Text1.SelStart = Len(Terminal)
        End With
    'End If
End Sub

Public Sub Load_Pers_Teh()  '������� ������������� �� �����
    Dim Sum As Long: Sum = 0
    ReDim Pers_teh_load(0)
    d2 = Split(Date, ".")
    Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & "#" & d2(1) & "/01/" & d2(2) & "#" & " AND " & "#" & d2(1) & "/" & d2(0) & "/" & d2(2) & "#"   '����� ������� � ����� ���� � �����������
    Form1.KS.Refresh
    Do While Form1.KS.Recordset.EOF = False
        ReDim Preserve Pers_teh_load(Sum)
        Pers_teh_load(Sum).UID_P = Val(Form1.KS.Recordset(4) & vbNullString)
        Pers_teh_load(Sum).UID_T = Val(Form1.KS.Recordset(5) & vbNullString)
        Pers_teh_load(Sum).Timee = Val(Form1.KS.Recordset(6) & vbNullString)
        Sum = Sum + 1: Form1.KS.Recordset.MoveNext
    Loop
End Sub


Public Function Vid(Typ As String, UID As Long) As Boolean '���������, ���� �� ������� ��� ��������� ����������� �������
    Ar = Split(Date, ".")
    d2 = "#" & Ar(1) & "/" & Ar(0) & "/" & Ar(2) & "#" ' ������ ���� #mm/dd/yyyy#
    If Typ = "P" Then
        Form1.KS.RecordSource = "Select * from Tele where ([Date_n]=" & d2 & " OR [Date_k]=" & d2 & ") AND [UID_P]=" & UID
    Else
        Form1.KS.RecordSource = "Select * from Tele where ([Date_n]=" & d2 & " OR [Date_k]=" & d2 & ") AND [UID_T]=" & UID
    End If
    Form1.KS.Refresh
    If Form1.KS.Recordset.EOF = False Then Vid = True Else Vid = False
End Function

Public Sub Reload_Ar(N)
    With Form1
        If N = 1 Then '������������ ������� ����������
            ReDim BD.Razreshenia(0)
            .KS.RecordSource = "Razreshenia": .KS.Refresh ': .KS.Recordset.MoveFirst '�������� ����������
            Do While .KS.Recordset.EOF = False
                If UBound(BD.Razreshenia) = 0 And BD.Razreshenia(0).ID = 0 Then Else ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) + 1)
                BD.Razreshenia(UBound(BD.Razreshenia)).ID = .KS.Recordset("ID")
                BD.Razreshenia(UBound(BD.Razreshenia)).RFID = .KS.Recordset("RFID")
                .KS.Recordset.MoveNext
            Loop '�������� ����������
            printf "������������ ������� ����������"
        ElseIf N = 2 Then '������������ ������� ���������
            ReDim BD.Pers(0)
            .KS.RecordSource = "Personal": .KS.Refresh: .KS.Recordset.MoveFirst '�������� ���������
            Do While .KS.Recordset.EOF = False '�������� UID�� ���������
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
            Loop '�������� ���������
            printf "������������ ������� ���������"
        ElseIf N = 3 Then '������������ ������� �������
            ReDim BD.Teh(0)
            .KS.RecordSource = "Tehnika": .KS.Refresh: .KS.Recordset.MoveFirst '�������� �������
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
                BD.Teh(UBound(BD.Teh)).Porog_Z = BD.Teh(UBound(BD.Teh)).Porog_Z / 100
                .KS.Recordset.MoveNext
            Loop '�������� �������
            .KS.Refresh: .KS.UpdateRecord
            printf "������������ ������� �������"
        End If
    End With
End Sub



