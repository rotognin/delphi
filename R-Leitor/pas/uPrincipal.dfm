object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Leitor de Informa'#231#245'es'
  ClientHeight = 544
  ClientWidth = 1139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 35
    Top = 11
    Width = 58
    Height = 21
    Caption = 'Arquivo:'
  end
  object Label2: TLabel
    Left = 8
    Top = 46
    Width = 85
    Height = 21
    Caption = 'Delimitador:'
  end
  object Label3: TLabel
    Left = 144
    Top = 46
    Width = 74
    Height = 21
    Caption = 'Sequ'#234'ncia:'
  end
  object Label4: TLabel
    Left = 8
    Top = 515
    Width = 82
    Height = 21
    Caption = 'Informa'#231#227'o:'
  end
  object edtArquivo: TEdit
    Left = 99
    Top = 8
    Width = 930
    Height = 29
    TabOrder = 0
  end
  object btnBuscar: TButton
    Left = 1035
    Top = 8
    Width = 96
    Height = 29
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object edtDelimitador: TEdit
    Left = 99
    Top = 43
    Width = 30
    Height = 29
    TabOrder = 2
  end
  object edtSequencia: TEdit
    Left = 224
    Top = 43
    Width = 30
    Height = 29
    TabOrder = 3
  end
  object gridArquivo: TStringGrid
    Left = 8
    Top = 78
    Width = 1123
    Height = 187
    ColCount = 4
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
    OnClick = gridArquivoClick
    ColWidths = (
      87
      93
      103
      502)
  end
  object gridInfo: TStringGrid
    Left = 8
    Top = 271
    Width = 1123
    Height = 235
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
    ColWidths = (
      87
      93
      600)
  end
  object edtInformacao: TEdit
    Left = 96
    Top = 512
    Width = 1035
    Height = 29
    TabOrder = 6
  end
  object btnSeparar: TButton
    Left = 295
    Top = 43
    Width = 96
    Height = 29
    Caption = 'Separar'
    TabOrder = 7
    OnClick = btnSepararClick
  end
end
