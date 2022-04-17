VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "UpDate"
   ClientHeight    =   3495
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3510
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "up.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   233
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   234
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command6 
      Caption         =   "Выход"
      Height          =   495
      Left            =   720
      TabIndex        =   5
      Top             =   2880
      Width           =   2655
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Обновить всё"
      Height          =   495
      Left            =   720
      TabIndex        =   4
      Top             =   2400
      Width           =   2655
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Обновить лаунчер"
      Height          =   495
      Left            =   720
      TabIndex        =   3
      Top             =   1920
      Width           =   2655
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Обновить сервер статистики"
      Height          =   495
      Left            =   720
      TabIndex        =   2
      Top             =   1440
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Обновить сервер устройств"
      Height          =   495
      Left            =   720
      TabIndex        =   1
      Top             =   960
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Обновить клиент"
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   2655
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Обновление компонентов"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   720
      TabIndex        =   6
      Top             =   120
      Width           =   2640
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   6
      Left            =   120
      Picture         =   "up.frx":0442
      Top             =   0
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   5
      Left            =   120
      Picture         =   "up.frx":0884
      Top             =   2880
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   4
      Left            =   120
      Picture         =   "up.frx":0CC6
      Top             =   2400
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   3
      Left            =   120
      Picture         =   "up.frx":1108
      Top             =   1920
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   2
      Left            =   120
      Picture         =   "up.frx":154A
      Top             =   1440
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   1
      Left            =   120
      Picture         =   "up.frx":198C
      Top             =   960
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Index           =   0
      Left            =   120
      Picture         =   "up.frx":1DCE
      Top             =   480
      Width           =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim p10 As String
Dim p20 As String
Dim p30 As String
Dim p40 As String

Dim p11 As String
Dim p21 As String
Dim p31 As String
Dim p41 As String


Private Sub Command1_Click()
    FileSystem.FileCopy p10, p11
    MsgBox "Клиент успешно обновлён", , "OK"
End Sub

Private Sub Command2_Click()
    FileSystem.FileCopy p20, p21
    MsgBox "Сервер устройств успешно обновлён", , "OK"
End Sub

Private Sub Command3_Click()
    FileSystem.FileCopy p40, p41
    MsgBox "Сервер статистики успешно обновлён", , "OK"
End Sub

Private Sub Command4_Click()
    FileSystem.FileCopy p30, p31
    MsgBox "Лаунчер успешно обновлён", , "OK"
End Sub

Private Sub Command5_Click()
    Command1_Click
    Command2_Click
    Command3_Click
    Command4_Click
End Sub

Private Sub Command6_Click()
    End
End Sub

Private Sub Form_Load()
    p10 = "\\tsclient\C\Users\Дмитрий\Google Диск\01. Проекты_w\07. UBD\Программы\Программа ПК\Client\Client_new.exe"
    p20 = "\\tsclient\C\Users\Дмитрий\Google Диск\01. Проекты_w\07. UBD\Программы\Программа ПК\Server_WEB\Server_new.exe"
    p30 = "\\tsclient\C\Users\Дмитрий\Google Диск\01. Проекты_w\07. UBD\Программы\Программа ПК\Server_WEB\Launcher.exe"
    p40 = "\\tsclient\C\Users\Дмитрий\Google Диск\01. Проекты_w\07. UBD\Программы\Программа ПК\Server_Client\Serv_client.exe"
    
    p11 = "C:\Program Files (x86)\KS_Client\Client_new.exe"
    p21 = "C:\Program Files (x86)\KS_Server\Server_new.exe"
    p31 = "C:\Program Files (x86)\KS_Server\Launcher.exe"
    p41 = "C:\Program Files (x86)\KS_Server\Serv_client.exe"
    
    
    'FileSystem.FileCopy "c:\wdt\wdt.ini", "c:\wdt\111.ini"
End Sub

