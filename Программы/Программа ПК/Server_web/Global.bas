Attribute VB_Name = "Global"
Public Type WDT_
    Incr_time_post As Byte '����� ����� ��������� ����� �������� ����������
    Incr_post As Byte '���-�� ��������� �������� ����������
    ID As Integer 'ID ����������
End Type


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

Global Wd_incr() As Integer '���� ���������� ������������ ������ ���������, �� ������ � �������� �����, ������������ ��������, ���� �� ����� �������� ������,
                                                                                                                '�� ���������� ����������
'Global Session() As Session_
Global Teh_list() As Integer
Global wd_linc(200) As Integer '��������� ��� �������� ���������� �����. ���� �� ����� ������� ������, �� ��������� ����������, ���� �� ����� ������ �� ��������,
                                                                                                                '�� ���������� �������� ��������� ����������
Global incr As Integer
Global Ignition_flag(200) As Boolean  '���� ���� �������, �� � ������� ����� �������� ���������
Global Udar_flag(35000) As Boolean '���� ��� ������ �����

Public Type Pers_teh_load_ '��� ��� �������� ������ � ��������� � �������
    UID_T As Integer
    UID_P As Integer
    Timee As Long
End Type

Global WDT() As WDT_ '������ ����������� ��� ��������� ���������� ��������
Global Raz(200) As Integer
Global RFID_raz() As Long
Global tmp_ As Integer
Global Terminal As String '������ ��� ���������. ������������ ����� ������ 2^31
Global Sum_P As Integer, Sum_T As Integer '����� �������� ������ � �������������� ����������� �� ����
Global List_perss() As String '������ ��� �������� ������ ���������
Global List_tehh() As String '������ ��� �������� ������ �������
Global Incr_pers As Byte '��������� ��� �������� ������ ���������
Global Incr_teh As Byte '��������� ��� �������� ������ �������
Global Temp_pers As Byte '�������� ������� ��� �������� ������ ���������
Global Temp_teh As Byte '�������� ������� ��� �������� ������ �������
Global Pers_teh_load() As Pers_teh_load_ '������ ��� �������� ������ � ��������� � �������
Global Com_client(9) As Integer '����� ������ �� �������

Public Const Smena = 12
Public Const RFID_amount_user = 100 '������������ ���������� RFID-����, � ������� ������� user, ������� ����� ���������� � �����
Public Const RFID_amount_master = 10 '������������ ���������� RFID-����, � ������� ������� master, ������� ����� ���������� � �����

'Public Sub End_session(index_)  '�������� ������
'    With Form1
'        If Ignition_flag(index_) Then
'            .KS.RecordSource = "Select * from Tele where [Date_k]=null AND [Time_k]=null AND [UID_T]=" & ID_UID(Val(.Teh(index_).Tag))  '����� ������� � ����� ���� � �����������
'            .KS.Refresh
'            If .KS.Recordset.EOF = False Then '������ ����, ������� ��������� ������ � ������� ����� ���������� � ������� � ��������
'               .KS.Recordset.MoveLast
'                tmpp_ = DateDiff("s", Date & " " & Time, .KS.Recordset("Date_n") & " " & .KS.Recordset("Time_n"))
'                If tmpp_ < 0 Then tmpp_ = tmpp_ * -1
'
'                .KS.Recordset.Edit
'                .KS.Recordset("Date_k") = Date
'                .KS.Recordset("Time_k") = Time
'                .KS.Recordset("Status") = tmpp_
'                .KS.Recordset.Update
'            End If
'            Ignition_flag(index_) = False
'            printf "������ ��� #" & .Teh(index_).Tag & " �������"
'        End If
'    End With
'End Sub

Public Function List_Online() As String '��������� ������ ��������� ������� � ���������� ��������
    On Error Resume Next
    With Form1
        If .Teh.UBound > 0 Then
            List_Online = "List_Online="
            For incr = 1 To .Teh.UBound '����������� ������ ��������� �������
                If Is_Noth(incr) Then
                    'If .Teh(incr).Tag <> "" And Mid$(.Teh(incr).Tag, 1, 1) <> "K" Then
                    If .Teh(incr).Tag <> "" Then
                        List_Online = List_Online & .Teh(incr).Tag & "." & Raz(incr) & "|"
                    End If
                End If
            Next
            
            If List_Online <> "List_Online=" Then
                List_Online = Mid$(List_Online, 1, Len(List_Online) - 1) '����������� �� ������� ������ "|"
                'printf "---> " & List_Online
'                For incr = 1 To .Teh.UBound
'                    If Is_Noth(incr) Then
'                        If Mid$(.Teh(incr).Tag, 1, 1) = "K" Then
'                            .Teh(incr).SendData List_Online
'                            'printf "***************" & incr
'                        End If
'                    End If
'                Next
            Else
                List_Online = "0"
            End If
            Shell "cmd.exe /c echo """ & List_Online & """ >c:\WDT\Online.ini", vbHide
        End If
    End With
End Function

Public Function ID_UID(ID As Integer) As Integer
    ID_UID = 0
    For i = 0 To UBound(BD.Teh)
        If BD.Teh(i).ID = ID Then ID_UID = BD.Teh(i).UID: Exit For
    Next
'    Form1.KS.RecordSource = "Select * from Tehnika where [ID]=" & ID   '����� �������
'    Form1.KS.Refresh
'    If Form1.KS.Recordset.EOF = False Then ID_UID = Val(Form1.KS.Recordset("UID")) Else ID_UID = 0
End Function

Public Function Is_Noth(Index) As Boolean '���� ����� � ������� index ����������, �� ������� ���������� 1, ����� 0
    On Error Resume Next
    sd = Form1.Teh(Index).Index
    Is_Noth = True
    If Err Then Is_Noth = False
End Function

Public Sub Priv_Id(ID As Integer, Index As Integer)  '������������ � ������� ����������� ���� ����������
    On Error Resume Next
    With Form1
        Dim i_RFID As Integer, crc As Long, crc_tmp As Long
        i_RFID = 0: crc = 0
        ReDim RFID_raz(RFID_amount_user + RFID_amount_master - 1)

        For i = 0 To UBound(BD.Razreshenia)
            If BD.Razreshenia(i).ID = ID Then
                RFID_raz(i_RFID) = UID_RFID(BD.Razreshenia(i).RFID)
                fff = UID_RFID(BD.Razreshenia(i).RFID)
                i_RFID = i_RFID + 1
                If i_RFID > RFID_amount_user - 1 Then Exit For
            End If
        Next
        i_RFID = RFID_amount_user '34
        For i = 0 To UBound(BD.Pers) '�������� � ����� ������� ������-����
            If BD.Pers(i).Prof = 1 Then '����� ������-����
                RFID_raz(i_RFID) = BD.Pers(i).RFID
                i_RFID = i_RFID + 1
                If i_RFID > RFID_amount_user + RFID_amount_master - 1 Then Exit For
            End If
        Next


        For i = 0 To RFID_amount_user + RFID_amount_master - 1
            If i = 0 Then .Teh(Index).SendData "RFID_List_fixed_len_blabla:"
            .Teh(Index).SendData RFID_raz(i)
            crc_tmp = RFID_raz(i) And 15
            crc = crc + crc_tmp
        Next
        For i = 0 To UBound(BD.Teh)
            If BD.Teh(i).UID = ID Then Exit For '����� ������� ��������
        Next
        
'        .KS.RecordSource = "Select * from Tehnika where [ID]='" & ID & "'" '����� �������
'        .KS.Refresh ': .KS.Recordset.MoveFirst '�������� �������
'        BD.Teh(i).Porog_X = .KS.Recordset("Porog_X")
'        BD.Teh(i).Porog_Z = .KS.Recordset("Porog_Z") '/ 100
        
        .Teh(Index).SendData crc
        .Teh(Index).SendData BD.Teh(i).Porog_X
        .Teh(Index).SendData BD.Teh(i).Porog_Z
        .Teh(Index).SendData Chr(10)
        .Teh(Index).SendData Chr(13)
    End With
End Sub

Private Function UID_RFID(UID) As Long
    Dim i3
    UID_RFID = 0
    For i3 = 0 To UBound(BD.Pers)
        If BD.Pers(i3).UID = UID Then UID_RFID = BD.Pers(i3).RFID: Exit For
    Next
End Function

'Public Sub Priv_Id_(ID As Integer, Index As Integer)  '������������ � ������� ����������� ���� ����������
'    On Error Resume Next
'    With Form1
'        Dim i_RFID As Integer, crc As Long, crc_tmp As Long
'        i_RFID = 0: crc = 0
'        ReDim RFID_raz(39)
'    '    Dim Lon As Long
'    '    'Teh(Teh.UBound).SendData "SetAP:NEATGEAR:111222333444" & Chr(10)
'    '    'Teh(Teh.UBound).SendData "SetID:230" & Chr(10)
'    '    'Teh(Teh.UBound).SendData "SetIP:192.168.0.222" & Chr(10)
'        'KS.RecordSource = "Select * from Tehnika where [ID]='" & Id & "'" '����� �������
'        'KS.Refresh
'        'If KS.Recordset.EOF = False Then
'        .KS.RecordSource = "Select * from Razreshenia where [ID]=" & ID  '����� �������
'        .KS.Refresh
'        If .KS.Recordset.EOF = False Then '���������� ������� ����������� RFID-����
'            Do While .KS.Recordset.EOF = False
'                If .KS.Recordset.EOF = False Then
'                    RFID_raz(i_RFID) = Val(.KS.Recordset(1))
'                    i_RFID = i_RFID + 1
'                    If i_RFID > 39 Then i_RFID = 39
'
'                End If
'                .KS.Recordset.MoveNext
'            Loop
'        End If
'        i_RFID = 34
'        .KS.RecordSource = "Select * from Personal where [Prof]='" & "������" & "'"  '����� �������
'        .KS.Refresh
'        If .KS.Recordset.EOF = False Then '���������� ������� RFID-������
'            Do While .KS.Recordset.EOF = False
'                i_RFID = i_RFID + 1
'                If i_RFID > 39 Then Exit Do
'                RFID_raz(i_RFID) = .KS.Recordset("UID")
'                For hj = 0 To 34
'                    If RFID_raz(hj) = RFID_raz(i_RFID) Then RFID_raz(hj) = 0
'                Next
'                .KS.Recordset.MoveNext
'            Loop
'            'MsgBox RFID_raz(34) & RFID_raz(35)
'        End If
'
'        i_RFID = 0
'        For i = 0 To 39
'            If RFID_raz(i) > 0 Then
'                .KS.RecordSource = "Select * from Personal where [UID]='" & RFID_raz(i) & "'" '����� �������
'                .KS.Refresh
'                RFID_raz(i) = Val(.KS.Recordset("RFID"))
'            Else
'                RFID_raz(i) = 0
'            End If
'        Next
'
'        For i = 0 To 39
'            If i = 0 Then .Teh(Index).SendData "RFID_List_fixed_len_blabla:"
'            .Teh(Index).SendData RFID_raz(i)
'            crc_tmp = RFID_raz(i) And 15
'            crc = crc + crc_tmp
'        Next
'        .Teh(Index).SendData crc
'        .Teh(Index).SendData Chr(10)
'        .Teh(Index).SendData Chr(13)
'    End With
'End Sub

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
        For incr = 1 To Form1.Teh.UBound
            If Is_Noth(incr) Then
                If ID_UID(Val(Form1.Teh(incr).Tag)) = Ar__(0) Then Priv_Id ID_UID(Val(Ar__(0))), incr: Exit For
            End If
        Next
        If Not (UBound(BD.Razreshenia) = 0 And BD.Razreshenia(0).ID = 0) Then ReDim Preserve BD.Razreshenia(UBound(BD.Razreshenia) + 1)
        BD.Razreshenia(UBound(BD.Razreshenia)).ID = Val(Ar__(0))
        BD.Razreshenia(UBound(BD.Razreshenia)).RFID = Val(Ar__(1))
    End If
End Sub

Public Function List_Priv() As String
'    Form1.KS.RecordSource = "Razreshenia" '����� �������
'    Form1.KS.Refresh
'    Form1.KS.Recordset.MoveFirst
    List_Priv = "*"
    For i = 0 To UBound(BD.Razreshenia)
        List_Priv = List_Priv & BD.Razreshenia(i).ID & "|" & BD.Razreshenia(i).RFID & vbNewLine
    Next
'    Do While Form1.KS.Recordset.EOF = False
'        If Form1.KS.Recordset.EOF = False Then
'            List_Priv = List_Priv & Val(Form1.KS.Recordset(0)) & "|" & Val(Form1.KS.Recordset(1)) & vbNewLine
'        End If
'        Form1.KS.Recordset.MoveNext
'    Loop
'    Form1.KS.Recordset.MoveLast
End Function

Public Function List_Note() As String
    Form1.KS.RecordSource = "Notepad" '����� �������
    Form1.KS.Refresh
    'Form1.KS.Recordset.MoveFirst
    List_Note = "List_Note>>"
    Do While Form1.KS.Recordset.EOF = False
        If Form1.KS.Recordset.EOF = False Then
            List_Note = List_Note & Form1.KS.Recordset("Type") & Form1.KS.Recordset("UID") & "|"
        End If
        Form1.KS.Recordset.MoveNext
    Loop
    If List_Note <> "List_Note>>" Then List_Note = Mid$(List_Note, 1, Len(List_Note) - 1)
    'Form1.KS.Recordset.MoveLast
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
        'q = " AND [UID_T]='" & UID_T_ & "'"
        q = " AND [UID_T]=" & UID_T_
        q_ = "T" & UID_T_
    ElseIf UID_P_ <> 0 Then
        'q = " AND [UID_P]='" & UID_P_ & "'"
        q = " AND [UID_P]=" & UID_P_
        q_ = "P" & UID_P_
    End If
    'KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & q  '����� ������� � ����� ���� � �����������
    'MsgBox "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time_n] BETWEEN " & t1 & " AND " & t2 & q
    tyu = "Select * from Tele where [Date_n] BETWEEN " & d1 & " AND " & d2 & " AND " & "[Time_n] BETWEEN " & t1 & " AND " & t2 & q '����� ������� � ����� ���� � �����������
    Form1.KS.RecordSource = tyu
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
    If Form1.Check1.Value Then
        If Len(Terminal) > 10000000 Then Terminal = ""
        Terminal = Terminal & "[" & Date & "  " & Time & "] " & Text & vbNewLine
        With Form1
            .Text1.Text = Terminal
            .Text1.SelStart = Len(Terminal)
        End With
    End If
End Sub

'Public Function Effect(Typ As String, uID As Long) As Long '������ ������ �������� ������������� �� �����
'    Dim Sum As Long
'    Dim d1 As Integer
'    d1 = Val(mid$(Date, 1, 2))
'
'    d2 = Split(Date, ".")
'    d1 = Val(d2(0)) * Smena
'    If Typ = "T" Then
'        Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & "#" & d2(1) & "/01/" & d2(2) & "#" & " AND " & "#" & d2(1) & "/" & d2(0) & "/" & d2(2) & "#" & " AND [UID_T]='" & uID & "'"  '����� ������� � ����� ���� � �����������
'        Form1.KS.Refresh
'    ElseIf Typ = "P" Then
'        'MsgBox "#" & d2(1) & "/01/" & d2(2) & "#" & " AND " & "#" & d2(1) & "/" & d2(0) & "/" & d2(2) & "#" & " AND [UID_P]='" & uID & "'"
'        Form1.KS.RecordSource = "Select * from Tele where [Date_n] BETWEEN " & "#" & d2(1) & "/01/" & d2(2) & "#" & " AND " & "#" & d2(1) & "/" & d2(0) & "/" & d2(2) & "#" & " AND [UID_P]='" & uID & "'" '����� ������� � ����� ���� � �����������
'        Form1.KS.Refresh
'    End If
'    Do While Form1.KS.Recordset.EOF = False
'        Sum = Sum + Val(Form1.KS.Recordset(6) & vbNullString)
'        Form1.KS.Recordset.MoveNext
'    Loop
'    Sum = ((Sum / 3600) * 100) / d1
'    If Sum > 100 Then Sum = 100
'    Effect = Sum
'End Function

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

Public Function Is_Comp() As Boolean  '����������� ����� �� ������� �������� ���������
    On Error Resume Next
    Open "c:\WDT\KS.ini" For Input As #1
    Close 1
    If Err Then Is_Comp = False Else Is_Comp = True
End Function



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







