unit Ratings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MainUnit, Vcl.ComCtrls, Vcl.Grids, CommCtrl;

type
  TRating = Record
      TeamCode, Score: Integer;
      FullName: String[50];
      Code: String[6];
  End;

  PRating = ^TRating;

  PAllRating = ^TAllRating;
  TAllRating = Record
      Current: TRating;
      Next: PAllRating;
  End;

  TLinkedList = Record
      Head, Tail: PAllRating;
  End;

  TListView = class(Vcl.ComCtrls.TListView)
  protected
      procedure WndProc(var Message: TMessage); override;
  end;

  TRatingForm = class(TForm)
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    Procedure FindBestAndWorst(Temp: PTeam);
    Procedure InsertElement(Var List: TLinkedList; NewRating: TRating);
    Procedure OutputInfo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      BestList, WorstList: TLinkedList;
      OldWndProc: TWndMethod;
      procedure ListViewNewWndProc(var Msg: TMessage);

  public

  end;

var
  RatingForm: TRatingForm;

implementation

procedure ClearLinkedList(var list: TLinkedList);
var
    current, nextNode: PAllRating;
begin
    current := list.Head;
    while current <> nil do
    begin
        nextNode := current^.Next;
        Dispose(current);
        current := nextNode;
    end;
    list.Head := nil;
    list.Tail := nil;
end;


procedure TRatingForm.InsertElement(Var List: TLinkedList; NewRating: TRating);
var
    NewNode: PAllRating;
begin
    New(NewNode);
    NewNode^.Current := NewRating;
    NewNode^.Next := nil;
    If List.Head = nil Then
    Begin
        List.Head := NewNode;
        List.Tail := NewNode;
    End
    Else
    Begin
        List.Tail^.Next := NewNode;
        List.Tail := List.Tail^.Next;
        //List.Tail^.Next := Nil;
    End;
end;

procedure TListView.WndProc(var Message: TMessage);
begin
    If Message.Msg = WM_NCCALCSIZE then
        ShowScrollBar(Handle, SB_HORZ, False);
    Inherited WndProc(Message);
end;

procedure TRatingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ListView1.Clear;
    ClearLinkedList(BestList);
    ClearLinkedList(WorstList);
end;

procedure TRatingForm.FormCreate(Sender: TObject);
begin
    OldWndProc := ListView1.WindowProc;
    ListView1.WindowProc := ListViewNewWndProc;
end;

procedure TRatingForm.ListViewNewWndProc(var Msg: TMessage);
var
    hdn: ^THDNotify;
begin
    if Msg.Msg = WM_NOTIFY then
    begin
        hdn := Pointer(Msg.lParam);
        if (hdn.hdr.code = HDN_BeginTrackW) or (hdn.hdr.code = HDN_BeginTrackA) then
            Msg.Result := 1
        else
            OldWndProc(Msg);
    end
    else
        OldWndProc(Msg);
end;

// Процедура для разделения списка на две половины
procedure SplitLinkedList(var source, frontList, backList: PAllRating);
var
    fastPtr, slowPtr: PAllRating;
begin
    slowPtr := source;
    fastPtr := source^.Next;

    // Используется два указателя: slowPtr и fastPtr.
    // fastPtr перемещается вдвое быстрее, чем slowPtr,
    // чтобы разделить список пополам.
    while (fastPtr <> nil) do
    begin
        fastPtr := fastPtr^.Next;
        if (fastPtr <> nil) then
        begin
            slowPtr := slowPtr^.Next;
            fastPtr := fastPtr^.Next;
        end;
    end;

    // frontList указывает на начало первой половины списка,
    // а backList указывает на начало второй половины списка.
    frontList := source;
    backList := slowPtr^.Next;
    slowPtr^.Next := nil; // Разрываем связь между двумя половинами.
end;

// Функция для объединения двух отсортированных списков
function SortedMerge(listA, listB: PAllRating): PAllRating;
var
  mergedList: PAllRating;
begin
    // Если один из списков пуст, возвращаем другой список.
    if (listA = nil) then
        Result := listB
    else if (listB = nil) then
        Result := listA
    else
    begin
        // Сравниваем значения Score элементов двух списков и
        // рекурсивно объединяем их в отсортированный список.
        if (listA^.Current.Score >= listB^.Current.Score) then // <= по убыванию, Вместо Score введите свое поле
        begin
            mergedList := listA;
            mergedList^.Next := SortedMerge(listA^.Next, listB);
        end
        else
        begin
            mergedList := listB;
            mergedList^.Next := SortedMerge(listA, listB^.Next);
        end;

        Result := mergedList;
    end;
end;

// Процедура для сортировки списка с использованием алгоритма Merge Sort
procedure MergeSort(var headList: PAllRating);
var
    headPtr, firstHalf, secondHalf: PAllRating;
begin
    headPtr := headList;

    // Базовый случай: если список пуст или состоит из одного элемента,
    // он уже отсортирован.
    if (headPtr = nil) or (headPtr^.Next = nil) then
      Exit;

    // Разделяем список на две половины.
    SplitLinkedList(headPtr, firstHalf, secondHalf);

    // Рекурсивно сортируем каждую половину списка.
    MergeSort(firstHalf);
    MergeSort(secondHalf);

    // Объединяем отсортированные половины в один список.
    headList := SortedMerge(firstHalf, secondHalf);
end;

// Процедура для сортировки однонаправленного списка (TLinkedList)
procedure SortLinkedList(var linkedList: TLinkedList);
begin
    // Вызываем MergeSort, передавая указатель на начало списка.
    MergeSort(linkedList.Head);

    // Находим указатель на последний элемент списка (Tail).
    linkedList.Tail := linkedList.Head;
    If LinkedList.Tail <> Nil Then
        while (linkedList.Tail^.Next <> nil) do
            linkedList.Tail := linkedList.Tail^.Next;
end;


Procedure TRatingForm.FindBestAndWorst(Temp: PTeam);
Var
    CurrentNode: PTeam;
    Info: PRating;
    I: Integer;
Begin
    CurrentNode := Temp;
    While CurrentNode <> Nil do
    Begin
        For I := Low(CurrentNode.Info.TeamPlayers) to High(CurrentNode.Info.TeamPlayers) do
        Begin
            If CurrentNode.Info.TeamPlayers[I].FullName <> '' Then
            Begin
                New(Info);
                Info^.TeamCode := CurrentNode.Info.Data.Code;
                Info^.Score := CurrentNode.Info.TeamPlayers[I].GoalsScored;
                Info^.FullName := CurrentNode.Info.TeamPlayers[I].FullName;
                Info^.Code := CurrentNode.Info.TeamPlayers[I].Code;
                InsertElement(BestList, Info^);
                Dispose(Info);
                New(Info);
                Info^.TeamCode := CurrentNode.Info.Data.Code;
                Info^.Score := CurrentNode.Info.TeamPlayers[I].PenaltyPoints;
                Info^.FullName := CurrentNode.Info.TeamPlayers[I].FullName;
                Info^.Code := CurrentNode.Info.TeamPlayers[I].Code;
                InsertElement(WorstList, Info^);
            End;
        End;
        CurrentNode := CurrentNode^.next;
    End;
    SortLinkedList(BestList);
    SortLinkedList(WorstList);
    OutputInfo;
End;

Procedure TRatingForm.OutputInfo;
Var
    I: Integer;
    TempOutputBest, TempOutputWorst: PAllRating;
    Item: TListItem;
Begin
    TempOutputBest := BestList.Head;
    TempOutputWorst := WorstList.Head;
    I := 0;
    While (TempOutputBest <> Nil) and (TempOutputWorst <> Nil) and (I < 10) do
    Begin
        Item := ListView1.Items.Add;
        Item.Caption := IntToStr(TempOutputBest.Current.TeamCode);
        Item.SubItems.Add(TempOutputBest.Current.Code);
        Item.SubItems.Add(TempOutputBest.Current.FullName);
        Item.SubItems.Add(IntToStr(TempOutputBest.Current.Score));
        Item.SubItems.Add(' ');
        Item.SubItems.Add(IntToStr(TempOutputWorst.Current.TeamCode));
        Item.SubItems.Add(TempOutputWorst.Current.Code);
        Item.SubItems.Add(TempOutputWorst.Current.FullName);
        Item.SubItems.Add(IntToStr(TempOutputWorst.Current.Score));
        TempOutputBest := TempOutputBest^.Next;
        TempOutputWorst := TempOutputWorst^.Next;
        Inc(I);
    End;
End;

{$R *.dfm}

end.
