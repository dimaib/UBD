VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Load_Form 
   BorderStyle     =   0  'Нет
   Caption         =   "Form2"
   ClientHeight    =   1815
   ClientLeft      =   7395
   ClientTop       =   4560
   ClientWidth     =   3750
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1815
   ScaleWidth      =   3750
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   2520
      Top             =   720
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2040
      Top             =   720
   End
   Begin MSWinsockLib.Winsock Ping 
      Left            =   1560
      Top             =   720
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Load_Form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Const ULW_ALPHA = &H2
Private Const DIB_RGB_COLORS As Long = 0
Private Const AC_SRC_ALPHA As Long = &H1
Private Const AC_SRC_OVER = &H0
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE As Long = -20
Private Const HWND_TOPMOST As Long = -1
Private Const SWP_NOMOVE As Long = &H2
Private Const SWP_NOSIZE As Long = &H1
Private Type BLENDFUNCTION
    BlendOp As Byte
    BlendFlags As Byte
    SourceConstantAlpha As Byte
    AlphaFormat As Byte
End Type
Private Type Size
    cx As Long
    cy As Long
End Type
Private Type POINTAPI
    x As Long
    y As Long
End Type
Private Type RGBQUAD
    rgbBlue As Byte
    rgbGreen As Byte
    rgbRed As Byte
    rgbReserved As Byte
End Type
Private Type BITMAPINFOHEADER
    biSize As Long
    biWidth As Long
    biHeight As Long
    biPlanes As Integer
    biBitCount As Integer
    biCompression As Long
    biSizeImage As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed As Long
    biClrImportant As Long
End Type
Private Type BITMAPINFO
    bmiHeader As BITMAPINFOHEADER
    bmiColors As RGBQUAD
End Type
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function UpdateLayeredWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal hdcDst As Long, pptDst As Any, psize As Any, ByVal hdcSrc As Long, pptSrc As Any, ByVal crKey As Long, ByRef pblend As BLENDFUNCTION, ByVal dwFlags As Long) As Long
Private Declare Function CreateDIBSection Lib "gdi32.dll" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, ByRef lplpVoid As Any, ByVal handle As Long, ByVal dw As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32.dll" (ByVal hdc As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function SetWindowPos Lib "user32.dll" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private mDC As Long
Private mainBitmap As Long
Private blendFunc32bpp As BLENDFUNCTION
Private token As Long
Private oldBitmap As Long

Private Declare Sub ReleaseCapture Lib "user32" ()
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wparam As Integer, ByVal iparam As Long) As Long

Dim Con_i As Integer

Private Sub FormMove(lhWnd As Long)
    ReleaseCapture
    Call SendMessage(lhWnd, &HA1, 2, 0&)
End Sub


Private Sub Form_DblClick()
    Unload Me
End Sub

Private Sub Form_Load()
    Ping.Close
    Ping.Connect Form1.Opt(0), Form1.Opt(1)
    Timer1.Enabled = True
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 1 Then FormMove hwnd
End Sub

Private Sub Form_Initialize()
Dim GpInput As GdiplusStartupInput
    GpInput.GdiplusVersion = 1
    If GdiplusStartup(token, GpInput) <> 0 Then
        MsgBox "Ошибка GDI+!", vbCritical
        Unload Me
    End If
    Dir_Res = Mid(App.Path, 1, InStrRev(App.Path, "\") - 1)
    MakeTrans Dir_Res & "\Res\logo_.png" 'Обычный .PNG файл
End Sub
'
Private Function MakeTrans(pngPath As String) As Boolean
    Dim tempBI As BITMAPINFO
    Dim lngHeight As Long
    Dim lngWidth As Long
    Dim curWinLong As Long
    Dim img As Long
    Dim graphics As Long
    Dim winSize As Size
    Dim srcPoint As POINTAPI
        With tempBI.bmiHeader
            .biSize = Len(tempBI.bmiHeader)
            .biBitCount = 32
            .biHeight = ScaleHeight 'Не забываем ставить у формы ScaleMode = vbPixels,
            .biWidth = ScaleWidth   'иначе будет *жрать* память нещадно :)
            .biPlanes = 1
            .biSizeImage = .biWidth * .biHeight * (.biBitCount / 8)
        End With
            mDC = CreateCompatibleDC(hdc)
            mainBitmap = CreateDIBSection(mDC, tempBI, DIB_RGB_COLORS, ByVal 0, 0, 0)
            oldBitmap = SelectObject(mDC, mainBitmap)
            Call GdipCreateFromHDC(mDC, graphics)
            Call GdipLoadImageFromFile(StrConv(pngPath, vbUnicode), img)
            Call GdipGetImageHeight(img, lngHeight)
            Call GdipGetImageWidth(img, lngWidth)
            Call GdipDrawImageRect(graphics, img, 0, 0, lngWidth, lngHeight)
            curWinLong = GetWindowLong(hwnd, GWL_EXSTYLE)
            SetWindowLong hwnd, GWL_EXSTYLE, curWinLong Or WS_EX_LAYERED
            SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE
            srcPoint.x = 0
            srcPoint.y = 0
            winSize.cx = ScaleWidth
            winSize.cy = ScaleHeight
        With blendFunc32bpp
            .AlphaFormat = AC_SRC_ALPHA
            .BlendFlags = 0
            .BlendOp = AC_SRC_OVER
            .SourceConstantAlpha = 255
        End With
    Call GdipDisposeImage(img)
    Call GdipDeleteGraphics(graphics)
    Call UpdateLayeredWindow(hwnd, hdc, ByVal 0&, winSize, mDC, srcPoint, 0, blendFunc32bpp, ULW_ALPHA)
End Function

Private Sub Ping_Connect()
    Ping.SendData "Ping"
End Sub

Private Sub Ping_DataArrival(ByVal bytesTotal As Long)
    Dim a As String
    Ping.GetData a
    If a = "Ping" Then Timer1.Enabled = False: Ping.Close: Timer2.Enabled = True
End Sub

Private Sub Timer1_Timer()
    Con_i = Con_i + 1
    If Con_i > 10 Then MsgBox "Нет доступа к серверу!"
    End
End Sub

Private Sub Timer2_Timer()
    Me.Visible = False
    Form1.Show
    Timer2.Enabled = False
End Sub
