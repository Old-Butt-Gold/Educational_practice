unit MainUnit;

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
    Code, Rank: Integer; //��� �������
    Name: String[25];  //��� �������
    Country: string[25]; //������ �������
    //����� ������� � ��������� �������
  end;

  TPlayer = record
    FullName: String[50]; //������ ��� ����������
    Code, PenaltyPoints, GoalsScored: Integer; //��� ������ (������������ ����)
    Position: String[12];  //������ ������
     //�������� ����
    //���������� ������� ����� ��� ���������� �����
  end;

  TArrPlayer = Array [0..10] of TPlayer;
  TAllInfo = Record
    Data: TTeam;
    TeamPlayers: TArrPlayer;
  End;


  PTeam = ^TTeamNode;
  TTeamNode = Record
    Info: TAllInfo;
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
    ListBox1: TListBox;
    LViewTeam: TListView;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    PanelAnalysis: TPanel;
    PanelAdd: TPanel;
    ListView2: TListView;
    PanelPlayers: TPanel;
    Label2: TLabel;
    ImageList1: TImageList;
    procedure LViewTeamColumnClick(Sender: TObject; Column: TListColumn);
    Procedure InsertInList(InsNode: TTeamNode);
    Procedure RemoveTeam(Code: Integer);
    procedure LViewTeamSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure LViewTeamDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LViewTeamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    Procedure AddToListView;
    Function FindTeamByCode(Code: Integer): PTeam;
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

uses Unit1;

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

Procedure TMainForm.AddToListView;
Var
    Item: TListItem;
Begin
    Item := LViewTeam.Items.Add;
    Item.Caption := IntToStr(FTeamList.Tail^.Info.Data.Code);
    Item.SubItems.Add(FTeamList.Tail^.Info.Data.Name);
    Item.SubItems.Add(FTeamList.Tail^.Info.Data.Country);
    Item.SubItems.Add(IntToStr(FTeamList.Tail^.Info.Data.Rank));
End;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
    AddForm.ChangeBtn.Visible := False;
    AddForm.AddBtn.Visible := True;
    AddForm.ShowModal;
    If AddForm.ModalResult = MrYes Then
        AddToListView;
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

Function TMainForm.FindTeamByCode(Code: Integer): PTeam;
Var
    CurrentNode: PTeam;
    IsFounded: Boolean;
Begin
    Result := Nil;
    IsFounded := False;
    CurrentNode := FTeamList.Head;
    While (CurrentNode <> nil) and Not(IsFounded) do
    Begin
        If CurrentNode^.Info.Data.Code = Code Then
        Begin
            IsFounded := True;
            Result := CurrentNode;
        End;
        CurrentNode := CurrentNode^.Next;
    End;
End;

Procedure TMainForm.RemoveTeam(Code: Integer);
Var
    CurrentNode, PreviousNode: PTeam;
begin
    CurrentNode := FTeamList.Head;
    PreviousNode := nil;
    While (CurrentNode <> nil) and (CurrentNode.Info.Data.Code <> Code) do
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

procedure TMainForm.InsertInList(InsNode: TTeamNode);
Var
    NewNode: PTeam;
begin
    New(NewNode);
    NewNode^.Info.Data := InsNode.Info.Data;
    NewNode^.Info.TeamPlayers := InsNode.Info.TeamPlayers;
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
end;

procedure TMainForm.LViewTeamDblClick(Sender: TObject);
var
    Item: TListItem;
begin
    Item := LViewTeam.Selected;
    If Assigned(Item) and Item.Selected then
    begin
        AddForm.CurrentCode := StrToInt(Item.Caption);
        AddForm.TeamNameEdit.Text := Item.SubItems.Strings[0];
        AddForm.TeamCodeEdit.Text := Item.Caption;
        AddForm.TeamCountryEdit.Text := Item.SubItems.Strings[1];
        AddForm.TeamRankEdit.Text := Item.SubItems.Strings[2];
        AddForm.AddBtn.Visible := False;
        AddForm.ChangeBtn.Visible := True;
        AddForm.ShowModal;
      // ������ ���� �������
      // ��������� ����������� ��������
    end;
end;

procedure TMainForm.LViewTeamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //Var X := LViewTeam.Selected.Caption; //��� �������
    If (Key = VK_DELETE) and (LViewTeam.ItemIndex <> -1) and
    (MessageBox(MainForm.Handle, '�� ������ ������� ������ �������?', '��������', MB_YESNO + MB_ICONQUESTION) = ID_YES) Then
    Begin
        RemoveTeam(StrToInt(LViewTeam.Selected.Caption));
        LViewTeam.Delete(LViewTeam.Selected);
    End;
end;

procedure TMainForm.LViewTeamSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
Var
    Y: TListItem;
begin
    //��� � �� ������ ������ ������ ���� ���������� StringGrid ������� ������ �������

    {Var X := Item.Caption;
    X := Item.SubItems.Strings[0];
    X := Item.SubItems.Strings[1];
    X := Item.SubItems.Strings[2];}
    //Var X := StrToInt(Item.Caption); //��� �������
    If LViewTeam.ItemIndex = -1 Then
        ListView2.Clear;
    //Label1.Caption := IntToStr(LViewTeam.ItemIndex);
    //Var X := Item;
    Var Meow := LViewTeam.ItemIndex;
    Y := LViewTeam.Selected;
    // ListView1.Selected := nil;

    
    If Assigned(Y) then
    //If Selected Then
        //BitBtn1.Enabled := True
    Else
        //BitBtn1.Enabled := False;
end;

end.
