unit change_val;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfchange_val = class(TForm)
    StatusBar1: TStatusBar;
    oBtn_Change: TButton;
    oBtn_Cancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    oPag_Des: TDBEdit;
    oPag_Mon: TDBNumberEditEh;
    Shape1: TShape;
    procedure oBtn_CancelClick(Sender: TObject);
    procedure oBtn_ChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fchange_val: Tfchange_val;

implementation

uses UtilesV20, imports_1;

{$R *.dfm}

procedure Tfchange_val.oBtn_ChangeClick(Sender: TObject);
begin
  fimports_1.oQry_Ctas.post;
  close;
end;

procedure Tfchange_val.oBtn_CancelClick(Sender: TObject);
begin
  fimports_1.oQry_Ctas.Cancel;
  close;
end;

end.
