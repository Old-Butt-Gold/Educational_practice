unit PlayerAddUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MainUnit, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, PngImage, Jpeg;

type
  TAddPlayerForm = class(TForm)
    PlayerNameEdit: TLabeledEdit;
    PlayerCodeEdit: TLabeledEdit;
    PlayerPenaltyEdit: TLabeledEdit;
    PlayerScoreEdit: TLabeledEdit;
    ComboBoxPosition: TComboBox;
    Label1: TLabel;
    AddBtn: TBitBtn;
    ChangeBtn: TBitBtn;
    Image1: TImage;
    Function NormalizeString(const AStr: String): String;
    procedure PlayerStrKeyPress(Sender: TObject; var Key: Char);
    procedure PlayerCodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlayerNameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PlayerPenaltyEditKeyPress(Sender: TObject; var Key: Char);
    Procedure ClearEdits;
    procedure AddBtnClick(Sender: TObject);
    Procedure SetPlayerFields(Temp: PPlayer);
    procedure PlayerNameEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure SetPlayerEdits;
    procedure ComboBoxPositionKeyPress(Sender: TObject; var Key: Char);
    procedure ChangeBtnClick(Sender: TObject);
    procedure PlayerPenaltyEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
      FCurrentNode: PTeam;
      FCurrentIndex: Integer; //��� ������� ������� ����� �����
    { Public declarations }
  end;

var
  AddPlayerForm: TAddPlayerForm;

implementation

Procedure TAddPlayerForm.SetPlayerEdits;
Var
    Temp: String[6];
Begin

    PlayerNameEdit.Text := FCurrentNode^.Info.TeamPlayers[FCurrentIndex].FullName;
    Temp := FCurrentNode^.Info.TeamPlayers[FCurrentIndex].Code;
    Delete(Temp, 1, 1);
    PlayerCodeEdit.Text := Temp;
    PlayerPenaltyEdit.Text := IntToStr(FCurrentNode^.Info.TeamPlayers[FCurrentIndex].PenaltyPoints);
    PlayerScoreEdit.Text := IntToStr(FCurrentNode^.Info.TeamPlayers[FCurrentIndex].GoalsScored);
    ComboBoxPosition.ItemIndex := ComboBoxPosition.Items.IndexOf(FCurrentNode^.Info.TeamPlayers[FCurrentIndex].Position);
End;

Function TAddPlayerForm.NormalizeString(const AStr: String): String;
Var
    LowerStr, RestOfString: String;
    FirstLetter: String[1];
Begin
    LowerStr := AnsiLowerCase(AStr);
    FirstLetter := AnsiUpperCase(Copy(LowerStr, 1, 1));
    RestOfString := Copy(LowerStr, 2, Length(LowerStr) - 1);
    NormalizeString := FirstLetter + RestOfString;
End;

{$R *.dfm}

procedure TAddPlayerForm.PlayerCodeEditKeyPress(Sender: TObject; var Key: Char);
begin
    If Not(Key In ['A'..'Z','a'..'z', '0'..'9', #08]) Then
        Key := #0;
end;

procedure TAddPlayerForm.PlayerNameEditChange(Sender: TObject);
Var
    I: Integer;
begin
    AddBtn.Enabled := (PlayerNameEdit.GetTextLen > 0) and (PlayerCodeEdit.GetTextLen > 0) and
    (PlayerPenaltyEdit.GetTextLen > 0) and (PlayerScoreEdit.GetTextLen > 0) and (ComboBoxPosition.GetTextLen > 0);
    ChangeBtn.Enabled := (PlayerNameEdit.GetTextLen > 0) and (PlayerCodeEdit.GetTextLen > 0) and
    (PlayerPenaltyEdit.GetTextLen > 0) and (PlayerScoreEdit.GetTextLen > 0) and (ComboBoxPosition.GetTextLen > 0);
    If (TLabeledEdit(Sender).GetTextLen > 0) and (TLabeledEdit(Sender).Text[1] = '0') then
    begin
        I := 1;
        While TLabeledEdit(Sender).Text[I] = '0' do
            Inc(I);
        TLabeledEdit(Sender).Text := Copy(TLabeledEdit(Sender).Text, I, TLabeledEdit(Sender).GetTextLen - I + 1);
    end;
end;

procedure TAddPlayerForm.PlayerNameEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Shift = [ssCtrl]) and (Key = Ord('A')) then
        TLabeledEdit(Sender).SelectAll;
end;

procedure TAddPlayerForm.PlayerPenaltyEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If (Shift = [ssCtrl]) and (Key = Ord('A')) then
        TLabeledEdit(Sender).SelectAll;
    TEdit(Sender).ReadOnly := (((Shift=[ssShift]) and (Key = VK_INSERT)) or (Shift=[ssCtrl]) or (Shift=[ssAlt]))
end;

procedure TAddPlayerForm.PlayerPenaltyEditKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TAddPlayerForm.PlayerStrKeyPress(Sender: TObject; var Key: Char);
begin
    If (TEdit(Sender).SelLength > 0) and Not((Key < #192) and (Key <> #08)) Then
        TEdit(Sender).SelText := #0;
    If (Key < #192) and (Key <> #08) Then
        Key := #0;
    If (Key = '�') Then
        Key := #0;
    If (Length(TEdit(Sender).Text) = 50) and (Key <> #08) Then
        Key := #0;
end;

Procedure TAddPlayerForm.SetPlayerFields(Temp: PPlayer);
Begin
    Temp^.FullName := NormalizeString(PlayerNameEdit.Text);
    Temp^.PenaltyPoints := StrToInt(PlayerPenaltyEdit.Text);
    Temp^.GoalsScored := StrToInt(PlayerScoreEdit.Text);
    Temp^.Code := '#' + PlayerCodeEdit.Text;
    Temp^.Position := ComboBoxPosition.Text;
End;

procedure TAddPlayerForm.AddBtnClick(Sender: TObject);
Var
    Temp: PPlayer;
begin
    New(Temp);
    //�������� �� ����������
    SetPlayerFields(Temp);
    FCurrentNode^.Info.TeamPlayers[FCurrentIndex] := Temp^;
    Self.Close;
    ModalResult := MrYes;
    Dispose(Temp);
end;

procedure TAddPlayerForm.ChangeBtnClick(Sender: TObject);
Var
    Temp: PPlayer;
begin
    //�������� �� ��������� � �� ���������� ���
    Temp := @FCurrentNode^.Info.TeamPlayers[FCurrentIndex];
    SetPlayerFields(Temp);
    Self.Close;
    ModalResult := MrYes;
end;

Procedure TAddPlayerForm.ClearEdits;
Begin
    PlayerNameEdit.Clear;
    PlayerCodeEdit.Clear;
    PlayerPenaltyEdit.Clear;
    PlayerScoreEdit.Clear;
    ComboBoxPosition.ItemIndex := -1;
End;

procedure TAddPlayerForm.ComboBoxPositionKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := #0;
end;

procedure TAddPlayerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ClearEdits;
end;

procedure TAddPlayerForm.Image1Click(Sender: TObject);
begin
    ClearEdits;
end;

end.
