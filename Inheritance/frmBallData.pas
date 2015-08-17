unit frmBallData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Ball, FootBall;

type
  TfrmBall = class(TForm)
    edSize: TEdit;
    edKick: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edPanel: TEdit;     
    Label5: TLabel;
    btnBall: TButton;
    Button2: TButton;
    lbDescription: TLabel;
    procedure btnBallClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBall: TfrmBall;

implementation

{$R *.dfm}

{ ball method }
procedure TfrmBall.btnBallClick(Sender: TObject);
var
 ball : TBall;
begin
 try
 ball := TBall.Create(StrToInt(edSize.Text) );
 ball.Kick(StrToInt(edKick.Text));
 lbDescription.Caption := format('Ball of size %d hit by power %d gains the speed of %d',
                                [StrToInt(edSize.Text), StrToInt(edKick.Text), ball.GetSpeed]);
 finally
   if Assigned(ball) then
    FreeAndNil(ball);
 end;
end;

{ Football method }
procedure TfrmBall.Button2Click(Sender: TObject);
var
 Football : TFootball;                 
begin
  try
    football := TFootball.Create(strtoint(edSize.Text), strtoint(edPanel.Text));
    football.Kick(strtoint(edKick.Text));
    lbDescription.Caption := format('Ball of size %d hit by power %d gains the speed of %d',
                                  [StrToInt(edSize.Text), StrToInt(edKick.Text), football.GetSpeed]);
  finally
  if Assigned(football)then
    FreeAndNil(football);
  end;
end; 

{ end of unit }
end.
