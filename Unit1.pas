unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CustomizeDlg,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ActnColorMaps,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.CheckLst, Vcl.CategoryButtons,
  Vcl.ButtonGroup, Vcl.ComCtrls, Vcl.JumpList, CommCtrl, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ControlList, System.ImageList, Vcl.ImgList;

type

  TTeam = record
    Code: Integer; //Код команды
    Name: string;  //Имя команды
    Country: string; //Страна команды
    Rank: Integer;   //Номер команды в турнирной таблице
  end;

  TPlayer = record
    FullName: string; //Полное имя футболиста
    Code: Integer; //Код игрока (эквивалентно выше)
    Position: string;  //Амплуа игрока
    PenaltyPoints: Integer; //Штрафные очки
    GoalsScored: Integer;  //Количество забитых голов или переданных пасов
  end;

  PTeam = ^TTeamNode;
  TTeamNode = Record
    Data: TTeam;
    TeamPlayers: Array [0..10] of TPlayer;
    Next: PTeam;
  end;

  TTeamList = record
    Head: PTeam;
    Tail: PTeam;
  end;
  
  TListView = class(Vcl.ComCtrls.TListView)
  protected
      procedure WndProc(var Message: TMessage); override;
  end;
  
  TMainForm = class(TForm)
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    ListBox1: TListBox;
    LViewTeam: TListView;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    PanelAnalysis: TPanel;
    PanelAdd: TPanel;
    ListView2: TListView;
    PanelPlayers: TPanel;
    Label2: TLabel;
    procedure LViewTeamColumnClick(Sender: TObject; Column: TListColumn);
    Procedure InsertInList(Info: TTeamNode);
    Procedure RemoveTeam(Code: Integer);
    procedure LViewTeamSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure LViewTeamDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LViewTeamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
      FTeamList: TTeamList;
      FListViewOldWndProc, FPlayerOldWndProc: TWndMethod;
      procedure ListViewNewWndProc1(var Msg: TMessage);
      procedure ListViewNewWndProc2(var Msg: TMessage);
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ListViewNewWndProc1(var Msg: TMessage);
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

procedure TMainForm.ListViewNewWndProc2(var Msg: TMessage);
var
    hdn: ^THDNotify;
begin
    if Msg.Msg = WM_NOTIFY then
    begin
        hdn := Pointer(Msg.lParam);
        if (hdn.hdr.code = HDN_BeginTrackW) or (hdn.hdr.code = HDN_BeginTrackA) then
            Msg.Result := 1
        else
            FPlayerOldWndProc(Msg);
    end
    else
        FPlayerOldWndProc(Msg);
end;

procedure TListView.WndProc(var Message: TMessage);
begin
    If Message.Msg = WM_NCCALCSIZE then
        ShowScrollBar(Handle, SB_HORZ, False);
    Inherited WndProc(Message);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    FListViewOldWndProc := LViewTeam.WindowProc;
    LViewTeam.WindowProc := ListViewNewWndProc1;
    FPlayerOldWndProc := ListView2.WindowProc;
    ListView2.WindowProc := ListViewNewWndProc2;
    LViewTeam.Columns[2].Width := LVSCW_AUTOSIZE_USEHEADER;
end;
    

procedure TMainForm.FormShow(Sender: TObject);
begin
    LViewTeam.Width := LViewTeam.Width + 1;
    LViewTeam.Width := LViewTeam.Width - 1;
end;

Procedure TMainForm.RemoveTeam(Code: Integer);
Var
    CurrentNode, PreviousNode: PTeam;
begin
    CurrentNode := FTeamList.Head;
    PreviousNode := nil;

    While (CurrentNode <> nil) and (CurrentNode.Data.Code <> Code) do
    begin
        PreviousNode := CurrentNode;
        CurrentNode := CurrentNode.Next;
    end;

    If CurrentNode <> nil then
    begin
        If CurrentNode = FTeamList.Head then
            FTeamList.Head := FTeamList.Head^.Next
        Else
            PreviousNode.Next := CurrentNode^.Next;

        If CurrentNode = FTeamList.Tail then
            FTeamList.Tail := PreviousNode;

      Dispose(CurrentNode);
    end;
end;

procedure TMainForm.InsertInList(Info: TTeamNode);
Var
    NewNode: PTeam;
begin
    New(NewNode);
    NewNode^.Data := Info.Data;
    NewNode^.TeamPlayers := Info.TeamPlayers;
    NewNode^.Next := nil;
    If FTeamList.Head = nil Then
    Begin
        FTeamList.Head := NewNode;
        FTeamList.Tail := NewNode;
    End
    Else
    Begin
        FTeamList.Tail^.Next := NewNode;
        FTeamList.Tail := FTeamList.Tail^.Next;
    End;
end;

procedure TMainForm.LViewTeamColumnClick(Sender: TObject; Column: TListColumn);
begin
    Var X := Column.Index;
    (Sender as TCustomListView).AlphaSort;
end;

procedure TMainForm.LViewTeamDblClick(Sender: TObject);
var
    Item: TListItem;
begin
    Item := LViewTeam.Selected;
    If Assigned(Item) and Item.Selected then
    begin
        ShowMessage('Meow');
      // ячейка была выбрана
      // выполнить необходимые действия
    end;
end;

procedure TMainForm.LViewTeamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //Var X := LViewTeam.Selected.Caption; //код команды
    If (Key = VK_DELETE) and (LViewTeam.ItemIndex <> -1) and
    (MessageBox(MainForm.Handle, 'Вы хотите удалить данную команду?', 'Удаление', MB_YESNO + MB_ICONQUESTION) = ID_YES)Then
        LViewTeam.Delete(LViewTeam.Selected);
end;

procedure TMainForm.LViewTeamSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
Var
    Y: TListItem;
begin
    //Тут я по выбору строки справа буду показывать StringGrid игроков данной команды

    {Var X := Item.Caption;
    X := Item.SubItems.Strings[0];
    X := Item.SubItems.Strings[1];
    X := Item.SubItems.Strings[2];}
    //Var X := StrToInt(Item.Caption); //Код команды
    Label1.Caption := IntToStr(LViewTeam.ItemIndex);
    //Var X := Item;
    Var Meow := LViewTeam.ItemIndex;
    Y := LViewTeam.Selected;
    // ListView1.Selected := nil;

    
    If Assigned(Y) then
    //If Selected Then
        BitBtn1.Enabled := True
    Else
        BitBtn1.Enabled := False;
end;

end.
