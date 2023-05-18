unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons, MainUnit, Vcl.CheckLst, Vcl.ComCtrls;

type
  TAddForm = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    BitBtn1: TBitBtn;
    CheckListBox1: TCheckListBox;
    procedure StrKeyPress(Sender: TObject; var Key: Char);
    procedure LabeledEditChange(Sender: TObject);
    procedure NumberPress(Sender: TObject; var Key: Char);
    procedure CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckListBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
      FState: Boolean;
  public

  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

procedure TAddForm.NumberPress(Sender: TObject; var Key: Char);
Var
    CursorPosition, NewCursorPosition: Integer;
    TempAll, TempSelected, TempBeforeCursor, TempAfterCursor: String;
begin
    If Not(Key In ['0'..'9', #08]) Then
        Key := #0;
    NewCursorPosition := Length(TEdit(Sender).Text) - Length(TEdit(Sender).SelText);
    TempSelected := TEdit(Sender).SelText;
    TempAll := TEdit(Sender).Text;
    CursorPosition := TEdit(Sender).SelStart;
    If (TEdit(Sender).SelStart = 0) and (TEdit(Sender).SelLength < TEdit(Sender).GetTextLen) and (Key = '0') Then
        Key := #0;
    If (Key <> #0) and (TempSelected <> '') Then
        Begin
            Try
                Delete(TempAll, CursorPosition + 1, Length(TempSelected));
                Insert(Key, TempAll, CursorPosition + 1);
                If (StrToInt(TempAll) < 1) or (StrToInt(TempAll) > 9999) Then
                  Key := #0
                Else
                    Begin
                        TEdit(Sender).Text := TempAll;
                        TEdit(Sender).SelStart := NewCursorPosition + 1;
                        Key := #0;
                    End;
            Except
                Key := #0;
            End;
        End;
    TempBeforeCursor := Copy(TEdit(Sender).Text, 1, TEdit(Sender).SelStart);
    TempAfterCursor := Copy(TEdit(Sender).Text, TEdit(Sender).SelStart + 1, TEdit(Sender).GetTextLen);
    //SelStart ���� � 0
    If (Key <> #0) and (Key <> #08) and ((StrToInt(TempBeforeCursor + Key + TempAfterCursor) < 1) or (StrToInt(TempBeforeCursor + Key + TempAfterCursor) > 9999)) Then
        Key := #0;
end;

procedure TAddForm.CheckListBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    CheckListBox1.Checked[CheckListBox1.ItemIndex] := FState;
end;

procedure TAddForm.CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    FState := CheckListBox1.Checked[CheckListBox1.ItemIndex];
end;

procedure TAddForm.LabeledEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Shift = [ssCtrl]) and (Key = Ord('A')) then
        TLabeledEdit(Sender).SelectAll;
end;

procedure TAddForm.LabeledEditChange(Sender: TObject);
Var
    I: Integer;
begin
    BitBtn1.Enabled := (LabeledEdit1.GetTextLen > 0) and (LabeledEdit2.GetTextLen > 0) and
    (LabeledEdit3.GetTextLen > 0) and (LabeledEdit4.GetTextLen > 0);
    If (TLabeledEdit(Sender).GetTextLen > 0) and (TLabeledEdit(Sender).Text[1] = '0') then
    begin
        I := 1;
        While TLabeledEdit(Sender).Text[I] = '0' do
            Inc(I);
        TLabeledEdit(Sender).Text := Copy(TLabeledEdit(Sender).Text, I, TLabeledEdit(Sender).GetTextLen - I + 1);
    end;
end;

procedure TAddForm.StrKeyPress(Sender: TObject; var Key: Char);
begin
    If (TEdit(Sender).SelLength > 0) and Not((Key < #192) and (Key <> #08)) Then
        TEdit(Sender).SelText := #0;
    If (Key < #192) and (Key <> #08) Then
        Key := #0;
    If (Key = '�') Then
        Key := #0;
    If (Length(TEdit(Sender).Text) = 30) and (Key <> #08) Then
        Key := #0;
end;

end.
