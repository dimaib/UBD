Attribute VB_Name = "PNG"
Public Declare Function GdipDrawImageRect Lib "gdiplus" (ByVal graphics As Long, ByVal image As Long, ByVal X As Single, ByVal Y As Single, ByVal Width As Single, ByVal Height As Single) As GpStatus
Public Declare Function GdipLoadImageFromFile Lib "gdiplus" (ByVal FileName As String, image As Long) As GpStatus
Public Declare Function GdipGetImageWidth Lib "gdiplus" (ByVal image As Long, Width As Long) As GpStatus
Public Declare Function GdipGetImageHeight Lib "gdiplus" (ByVal image As Long, Height As Long) As GpStatus
Public Declare Function GdipDisposeImage Lib "gdiplus" (ByVal image As Long) As GpStatus
Public Declare Function GdiplusStartup Lib "gdiplus" (token As Long, inputbuf As GdiplusStartupInput, Optional ByVal outputbuf As Long = 0) As GpStatus
Public Declare Function GdipCreateFromHDC Lib "gdiplus" (ByVal hdc As Long, graphics As Long) As GpStatus
Public Declare Function GdipDeleteGraphics Lib "gdiplus" (ByVal graphics As Long) As GpStatus
Public Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long

Public Enum GpStatus
    Ok = 0
    GenericError = 1
    InvalidParameter = 2
    OutOfMemory = 3
    ObjectBusy = 4
    InsufficientBuffer = 5
    NotImplemented = 6
    Win32Error = 7
    WrongState = 8
    Aborted = 9
    FileNotFound = 10
    ValueOverflow = 11
    AccessDenied = 12
    UnknownImageFormat = 13
    FontFamilyNotFound = 14
    FontStyleNotFound = 15
    NotTrueTypeFont = 16
    UnsupportedGdiplusVersion = 17
    GdiplusNotInitialized = 18
    PropertyNotFound = 19
    PropertyNotSupported = 20
End Enum
 
Public Type GdiplusStartupInput
    GdiplusVersion As Long
    DebugEventCallback As Long
    SuppressBackgroundThread As Long
    SuppressExternalCodecs As Long
End Type

Public token As Long

Public Function LoadImage(ByVal FileName As String, ByVal hDestDC As Long, X, Y, Optional ByVal W = 0, Optional ByVal H = 0) As GpStatus
    Dim lngWidth As Long, lngHeight As Long
    Dim graphics As Long, img As Long
    Dim GpInput As GdiplusStartupInput
    Dim tmp_status As GpStatus
    GpInput.GdiplusVersion = 1
    tmp_status = GdiplusStartup(token, GpInput)
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipCreateFromHDC(hDestDC, graphics)
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipLoadImageFromFile(StrConv(FileName, vbUnicode), img)
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipGetImageHeight(img, lngHeight)
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipGetImageWidth(img, lngWidth)
        If tmp_status <> Ok Then GoTo The_End:
    'tmp_status = GdipDrawImageRect(graphics, img, X, Y, lngWidth, lngHeight)
    tmp_status = GdipDrawImageRect(graphics, img, X, Y, IIf(W <> 0, W, lngWidth), IIf(H <> 0, H, lngHeight))
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipDisposeImage(img)
        If tmp_status <> Ok Then GoTo The_End:
    tmp_status = GdipDeleteGraphics(graphics)
The_End:
    LoadImage = tmp_status
End Function
