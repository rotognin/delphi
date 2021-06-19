object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Separador de informa'#231#245'es'
  ClientHeight = 540
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 21
    Caption = 'Informa'#231#245'es:'
  end
  object Label2: TLabel
    Left = 12
    Top = 154
    Width = 85
    Height = 21
    Caption = 'Delimitador:'
  end
  object Label3: TLabel
    Left = 167
    Top = 154
    Width = 74
    Height = 21
    Caption = 'Sequ'#234'ncia:'
  end
  object Label4: TLabel
    Left = 15
    Top = 500
    Width = 82
    Height = 21
    Caption = 'Informa'#231#227'o:'
  end
  object memTexto: TMemo
    Left = 103
    Top = 8
    Width = 647
    Height = 137
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtDelimitador: TEdit
    Left = 103
    Top = 151
    Width = 42
    Height = 29
    MaxLength = 1
    TabOrder = 1
  end
  object edtSequencia: TEdit
    Left = 247
    Top = 151
    Width = 42
    Height = 29
    MaxLength = 1
    NumbersOnly = True
    TabOrder = 2
  end
  object btnSeparar: TButton
    Left = 319
    Top = 151
    Width = 98
    Height = 29
    Caption = 'Separar'
    TabOrder = 3
    OnClick = btnSepararClick
  end
  object gridInfo: TStringGrid
    Left = 12
    Top = 186
    Width = 738
    Height = 308
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedHorzLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
    OnClick = gridInfoClick
    OnDrawCell = gridInfoDrawCell
    ColWidths = (
      93
      99
      514)
  end
  object edtInfo: TEdit
    Left = 103
    Top = 497
    Width = 647
    Height = 29
    TabOrder = 5
  end
end
