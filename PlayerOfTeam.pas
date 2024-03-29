unit PlayerOfTeam;

interface

uses
    Vcl.Forms, MainUnit, Math, System.Classes, Vcl.Controls, Vcl.ComCtrls, SysUtils,
  Vcl.Graphics, CommCtrl, Winapi.Messages, Winapi.Windows, Vcl.Menus,
  Vcl.Dialogs, Vcl.Styles, Vcl.Themes;

type

   TListView = class(Vcl.ComCtrls.TListView)
  protected
      procedure WndProc(var Message: TMessage); override;
  end;

  TTeamForm = class(TForm)
    ListView1: TListView;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    SaveDialog: TSaveDialog;
    Procedure CalculatePlayers(Current: PTeam);
    procedure FormCreate(Sender: TObject);
    procedure ListView1AdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    private
        FListViewOldWndProc: TWndMethod;
        procedure ListViewNewWndProc(var Msg: TMessage);
        Const FBackgroundColor: TColor = 3615019;
  end;

var
  TeamForm: TTeamForm;

implementation

procedure TListView.WndProc(var Message: TMessage);
begin
    If Message.Msg = WM_NCCALCSIZE then
        ShowScrollBar(Handle, SB_HORZ, False);
    Inherited WndProc(Message);
end;

Procedure TTeamForm.CalculatePlayers(Current: PTeam);
Var
    Temp: PTeam;
    I: Integer;
    Penalty, AllScore: TPlayer;
    Item: TListItem;
Begin
    Temp := Current;
    While Temp <> Nil do
    Begin
        Penalty := Temp^.Info.TeamPlayers[0];
        AllScore := Temp^.Info.TeamPlayers[0];
        For I := 1 to High(Temp^.Info.TeamPlayers) do
        Begin
            If Penalty.PenaltyPoints < Temp^.Info.TeamPlayers[I].PenaltyPoints Then
                Penalty := Temp^.Info.TeamPlayers[I];
            If AllScore.GoalsScored < Temp^.Info.TeamPlayers[I].GoalsScored Then
                AllScore := Temp^.Info.TeamPlayers[I];
        End;

        Item := ListView1.Items.Add;
        Item.Caption := IntToStr(Temp^.Info.Data.Code);
        Item.SubItems.Add(Temp^.Info.Data.Name);
        Item.SubItems.Add(IntToStr(Temp^.Info.Data.Rank));
        Item.SubItems.Add(' ');
        Item.SubItems.Add(AllScore.Code);
        Item.SubItems.Add(AllScore.FullName);
        Item.SubItems.Add(IntToStr(AllScore.GoalsScored));
        Item.SubItems.Add(' ');
        Item.SubItems.Add(Penalty.Code);
        Item.SubItems.Add(Penalty.FullName);
        Item.SubItems.Add(IntToStr(Penalty.PenaltyPoints));
        Temp := Temp^.Next;
    End;
End;

{$R *.dfm}

procedure TTeamForm.ListView1AdvancedCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
    Sender.Canvas.Brush.Color := StyleServices.GetStyleColor(Vcl.Themes.TStyleColor.scListView);
    case SubItem of
        4..6:
            Sender.Canvas.Font.Color := ClLime;
        8..10:
            Sender.Canvas.Font.Color := ClRed;
        Else
            Sender.Canvas.Font.Color := ClWhite;
    end;

end;

procedure TTeamForm.ListViewNewWndProc(var Msg: TMessage);
var
    hdn: ^THDNotify;
begin
    if Msg.Msg = WM_NOTIFY then
    begin
        hdn := Pointer(Msg.lParam);
        if (hdn.hdr.code = HDN_BeginTrackW) or (hdn.hdr.code = HDN_BeginTrackA) then
            Msg.Result := 1
        else
            FListViewOldWndProc(Msg);
    end
    else
        FListViewOldWndProc(Msg);
end;

procedure TTeamForm.N1Click(Sender: TObject);
Var
    FileOutput: TextFile;
    I, J: Integer;
    Str: String;
begin
    If SaveDialog.Execute Then
    Begin
        Try
            Try
                AssignFile(FileOutput, ChangeFileExt(SaveDialog.FileName, '.txt'));
                Rewrite(FileOutput);
                For I := 0 to ListView1.Items.Count - 1 do
                Begin
                    Str := ListView1.Items.Item[I].Caption + ', ';
                    For J := 0 to ListView1.Items.Item[I].SubItems.Count - 1 do
                        Str := Str + ListView1.Items.Item[I].SubItems.Strings[J] + ', ';
                    Delete(Str, Length(Str) - 2, 2);
                    WriteLn(FileOutput, Str);
                End;
            Except
                MessageBox(Handle, '���� �����������!', '��������!', MB_OK + MB_ICONWARNING);
            End;
        Finally
            If FileExists(ChangeFileExt(SaveDialog.FileName, '.txt')) Then
                CloseFile(FileOutput);
        End;
    End;
end;

procedure TTeamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ListView1.Clear;
end;

procedure TTeamForm.FormCreate(Sender: TObject);
begin
    FListViewOldWndProc := ListView1.WindowProc;
    ListView1.WindowProc := ListViewNewWndProc;
end;

end.
