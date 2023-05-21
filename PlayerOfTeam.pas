unit PlayerOfTeam;

interface

uses
    Vcl.Forms, MainUnit, Math, System.Classes, Vcl.Controls, Vcl.ComCtrls;

type
  TTeamForm = class(TForm)
    ListView1: TListView;
    Procedure CalculatePlayers(Current: PTeam);
  end;

var
  TeamForm: TTeamForm;

implementation

Procedure TTeamForm.CalculatePlayers(Current: PTeam);
Var
    Temp: PTeam;
    Penalty, AllScore, I: Integer;
Begin
    Temp := Current;
    While Temp <> Nil do
    Begin
        Penalty := Temp^.Info.TeamPlayers[0].PenaltyPoints;
        AllScore := Temp^.Info.TeamPlayers[0].GoalsScored;
        For I := 1 to High(Temp^.Info.TeamPlayers) do
        Begin
            Penalty := Max(Penalty, Temp^.Info.TeamPlayers[I].PenaltyPoints);
            AllScore := Max(Penalty, Temp^.Info.TeamPlayers[I].GoalsScored);
        End;
        //Вывод результатов
        Temp := Temp^.Next;
    End;
End;

{$R *.dfm}

end.
