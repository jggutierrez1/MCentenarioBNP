unit Proveedor;

interface

uses
  Windows, Messages, SysUtils, FileCtrl,
  Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBCtrls,
  Mask, ExtCtrls, ComCtrls, Buttons,
  GridsEh, DBGridEh, DB, DBCtrlsEh,
  PngBitBtn, PngSpeedButton, WideStrings,
  SqlExpr, DBLookupEh,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TfProveedor = class(TForm)
    oDBNav: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    oDS_Prvs: TDataSource;
    StatusBar1: TStatusBar;
    oprov_inactivo: TDBCheckBox;
    Label3: TLabel;
    oprov_nombre: TDBEdit;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    oprov_nombre2: TDBEdit;
    oprov_telefono1: TDBEdit;
    prov_telefono2: TDBEdit;
    oprov_Fax: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    oprov_direccion: TDBMemo;
    oprov_email: TDBEdit;
    Label12: TLabel;
    oBtnExit: TPngBitBtn;
    oBtnAbort: TPngBitBtn;
    oBtnSave: TPngBitBtn;
    oBtnFind: TPngBitBtn;
    oBtnDelete: TPngBitBtn;
    oBtnEdit: TPngBitBtn;
    oBtnNew: TPngBitBtn;
    oBtnPrint: TPngBitBtn;
    oid_autoinc: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    oprov_contacto_nom: TDBEdit;
    Label2: TLabel;
    oprov_contacto_movil: TDBEdit;
    oprov_contacto_movil_email: TDBEdit;
    Label6: TLabel;
    oprov_webpage: TDBEdit;
    Label14: TLabel;
    oprov_notas: TDBMemo;
    Label15: TLabel;
    Label16: TLabel;
    oprov_fecha_alta: TDBDateTimeEditEh;
    Label17: TLabel;
    oprov_fecha_modif: TDBDateTimeEditEh;
    otProvs: TFDTable;
    Label11: TLabel;
    oprov_ruc: TDBEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label18: TLabel;
    oprov_ban_cta: TDBEdit;
    Label19: TLabel;
    oprov_ban_nombre: TDBEdit;
    oprov_ban_tipo: TDBComboBoxEh;
    procedure Action_Control(pOption: integer);
    procedure oBtnNewClick(Sender: TObject);
    procedure oBtnEditClick(Sender: TObject);
    procedure oBtnDeleteClick(Sender: TObject);
    procedure oBtnFindClick(Sender: TObject);
    procedure oBtnPrintClick(Sender: TObject);
    procedure oBtnSaveClick(Sender: TObject);
    procedure oBtnAbortClick(Sender: TObject);
    procedure oBtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZTable1AfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure oprov_nombreKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_nombre2KeyPress(Sender: TObject; var Key: Char);
    procedure oprov_emailKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_webpageKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_telefono1KeyPress(Sender: TObject; var Key: Char);
    procedure prov_telefono2KeyPress(Sender: TObject; var Key: Char);
    procedure oprov_FaxKeyPress(Sender: TObject; var Key: Char);
    procedure oid_autoincKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_contacto_nomKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_contacto_movilKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_contacto_movil_emailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure oPorc_RetKeyPress(Sender: TObject; var Key: Char);
    procedure Activa_Objetos(bPar: boolean);
    procedure oprov_nombreExit(Sender: TObject);
    procedure otProvsAfterInsert(DataSet: TDataSet);
    procedure otProvsBeforePost(DataSet: TDataSet);
    procedure oLst_RutasKeyPress(Sender: TObject; var Key: Char);
    procedure oLst_MinucipioKeyPress(Sender: TObject; var Key: Char);
    procedure oprov_rucExit(Sender: TObject);
  private
    iOption: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProveedor: TfProveedor;

implementation

USES UtilesV20, BuscarGenM2, Municipios, Rutas;
{$R *.dfm}

procedure TfProveedor.oprov_contacto_nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_contacto_movilKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_contacto_movil_emailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_webpageKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oPorc_RetKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.FormCreate(Sender: TObject);
begin
  iOption := 0;
  // self.ResizeKit1.Enabled := utiles.Ctrl_Resize;
  self.PageControl1.ActivePageIndex := 0;
  self.otProvs.Connection := fUtilesV20.oPublicCnn;
  self.oDS_Prvs.DataSet := otProvs;
  self.oDS_Prvs.Enabled := true;
  self.otProvs.Active := true;
end;

procedure TfProveedor.FormShow(Sender: TObject);
begin
  iOption := 0;
  self.PageControl1.ActivePageIndex := 0;
  self.Action_Control(6);
  self.Activa_Objetos(false);
end;

procedure TfProveedor.oBtnAbortClick(Sender: TObject);
begin
  self.otProvs.Cancel;
  self.Action_Control(7);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  iOption := 0;
end;

procedure TfProveedor.oBtnDeleteClick(Sender: TObject);
var
  nResp: integer;
begin
  if self.otProvs.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  iOption := 3;
  self.Action_Control(iOption);
  nResp := MessageDlg('Seguro que desea borrar eliminar el registro alctual?', mtConfirmation, [mbYes, mbNo], 0);
  If (nResp = mrYes) Then
  begin
    self.oDBNav.DataSource.DataSet.Delete;
    self.oDBNav.DataSource.DataSet.Refresh;
  end;
  iOption := 0;
end;

procedure TfProveedor.oBtnEditClick(Sender: TObject);
begin
  iOption := 2;
  if self.otProvs.isEmpty then
  begin
    self.Action_Control(6);
    exit;
  end;
  self.PageControl1.ActivePageIndex := 0;
  self.otProvs.Edit;
  self.Action_Control(iOption);
  self.Activa_Objetos(true);
  self.oprov_nombre.SetFocus;
end;

procedure TfProveedor.oBtnExitClick(Sender: TObject);
begin
  self.close;
end;

procedure TfProveedor.oBtnFindClick(Sender: TObject);
begin
  iOption := 4;
  self.Action_Control(iOption);

  Application.CreateForm(TfBuscarGenM2, fBuscarGenM2);
  fBuscarGenM2.Hide;
  fBuscarGenM2.oLst_campos.Clear;

  BuscarGenM2.oListData[1].Texto := 'R.U.C.';
  BuscarGenM2.oListData[1].Campo := 'prov_ruc';
  BuscarGenM2.oListData[1].LLave := true;

  BuscarGenM2.oListData[2].Texto := 'Nombre Comercial';
  BuscarGenM2.oListData[2].Campo := 'prov_nombre';
  BuscarGenM2.oListData[2].LLave := false;

  BuscarGenM2.oListData[3].Texto := 'Nombre Fiscal';
  BuscarGenM2.oListData[3].Campo := 'prov_nombre2';
  BuscarGenM2.oListData[3].LLave := false;

  fBuscarGenM2.oSql1.Clear;
  fBuscarGenM2.oSql1.Lines.Add
    ('SELECT prov_ruc,UCASE(prov_nombre) as prov_nombre,UCASE(prov_nombre2) as prov_nombre_2 FROM proveedores WHERE 1=1 ');
  fBuscarGenM2.ShowModal;
  if BuscarGenM2.vFindResult <> '' then
    self.oDBNav.DataSource.DataSet.Locate('prov_ruc', BuscarGenM2.vFindResult, []);
  freeandnil(fBuscarGenM2);
  iOption := 0;
end;

procedure TfProveedor.oBtnNewClick(Sender: TObject);
VAR
  cTmp: string;
begin
  iOption := 1;
  self.PageControl1.ActivePageIndex := 0;
  self.otProvs.Insert;
  self.oprov_inactivo.Checked := true;
  self.Action_Control(iOption);
  self.Activa_Objetos(true);
  self.otProvs.FieldByName('prov_inactivo').Value := 0;
  self.oprov_nombre.SetFocus;
  cTmp := UtilesV20.Execute_SQL_Result('SELECT IFNULL(corre_provs,0)+1 AS corre_provs FROM conf_corre LIMIT 1');
  if cTmp <> '0' then
  begin
    // self.otProvs.FieldByName('prv_id').AsString := cTmp;
  end;
  self.oprov_ruc.SetFocus;
end;

procedure TfProveedor.oBtnPrintClick(Sender: TObject);
begin
  iOption := 5;
  self.Action_Control(iOption);
  ShowMessage('Opci�n a�n no programada.');
  iOption := 0;
end;

procedure TfProveedor.oBtnSaveClick(Sender: TObject);
begin
  self.otProvs.post;
  self.Action_Control(6);
  self.Activa_Objetos(false);
  self.PageControl1.ActivePageIndex := 0;
  iOption := 0;
end;

procedure TfProveedor.oprov_emailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_FaxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oid_autoincKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oLst_MinucipioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oLst_RutasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_nombreExit(Sender: TObject);
begin
  if ((fUtilesV20.isEmpty(self.oprov_nombre.Text) = true) or (self.oprov_nombre.Text = null)) then
    self.otProvs.FieldByName('prov_nombre2').AsString := self.oprov_nombre2.Text;
end;

procedure TfProveedor.oprov_nombreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.oprov_rucExit(Sender: TObject);
VAR
  cValue: string;
  cSql_Ln: string;
begin
  if (trim(self.oprov_ruc.Text) <> '') then
  begin

    if (iOption = 1) then
    begin
      cValue := UtilesV20.Execute_SQL_Result('SELECT IFNULL(prov_ruc,"") AS prov_ruc FROM proveedores WHERE 1=1');
      if (cValue <> '') then
      begin
        MessageDlg('El R.U.C del proveedor, YA EXISTE EN LA BASE DE DATOS.', mtWarning, [mbOK], 0);
        abort;
      end;
    end;

    if (iOption = 2) then
    begin
      cSql_Ln := '';
      cSql_Ln := cSql_Ln + 'SELECT IFNULL(prov_ruc,"") AS prov_ruc ';
      cSql_Ln := cSql_Ln + 'FROM proveedores ';
      cSql_Ln := cSql_Ln + 'WHERE id_autoinc <>"' + trim(self.oid_autoinc.Text) + '" ';
      cSql_Ln := cSql_Ln + 'AND   prov_ruc= "' + trim(self.oprov_ruc.Text) + '"';

      cValue := UtilesV20.Execute_SQL_Result(cSql_Ln);
      if (cValue <> '') then
      begin
        MessageDlg('El R.U.C del proveedor, YA EXISTE EN LA BASE DE DATOS.', mtWarning, [mbOK], 0);
        abort;
      end;
    end;
  end;

end;

procedure TfProveedor.oprov_nombre2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.otProvsAfterInsert(DataSet: TDataSet);
begin
  if (DataSet.State in [dsInsert]) then
  begin
    DataSet.FieldByName('prov_notas').Value := '';
    DataSet.FieldByName('prov_direccion').Value := '';
    DataSet.FieldByName('prov_inactivo').Value := 0;
    DataSet.FieldByName('prov_unico_emp').Value := 0;
  end;
end;

procedure TfProveedor.otProvsBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State in [dsEdit, dsInsert]) then
  begin
    if fUtilesV20.isEmpty(DataSet.FieldByName('prov_nombre').AsString) then
    begin
      ShowMessage('Para crear el cliente, es necesario por lo menos el nombre.');
      self.PageControl1.TabIndex := 0;
      self.oprov_nombre.SetFocus;
      abort;
    end;

    if (DataSet.State = dsEdit) then
    begin
      DataSet.FieldByName('prov_fecha_modif').Value := now();
      DataSet.FieldByName('u_usuario_modif').Value := UtilesV20.sUserName;
    end
    else if (DataSet.State = dsInsert) then
    begin
      DataSet.FieldByName('prov_fecha_alta').Value := now();
      DataSet.FieldByName('u_usuario_alta').Value := UtilesV20.sUserName;
      DataSet.FieldByName('prov_fecha_Modif').AsDateTime := now();
      DataSet.FieldByName('u_usuario_modif').Value := UtilesV20.sUserName;
    end;
    if DataSet.FieldByName('prov_unico_emp').Value = 1 then
      DataSet.FieldByName('prov_emp_id').AsInteger := UtilesV20.iId_Empresa
    else
      DataSet.FieldByName('prov_emp_id').AsInteger := 0;
  end;
end;

procedure TfProveedor.oprov_telefono1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.prov_telefono2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end
end;

procedure TfProveedor.ZTable1AfterPost(DataSet: TDataSet);
begin
  if fUtilesV20.isEmpty(DataSet.FieldByName('prov_nombre').AsString) then
  begin
    ShowMessage('Para crear un cliente es necesario por lo menos el nombre del cliente.');
    abort;
  end;
end;

procedure TfProveedor.Action_Control(pOption: integer);
begin
  if ((pOption = 1) or (pOption = 2)) then
  begin
    oDBNav.Visible := false;
    oBtnNew.Visible := false;
    oBtnEdit.Visible := false;
    oBtnDelete.Visible := false;
    oBtnFind.Visible := false;
    oBtnPrint.Visible := false;
    oBtnExit.Enabled := false;

    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := true;
    oBtnSave.Visible := true;
    oBtnExit.Visible := false;

  end;

  if ((pOption = 6) or (pOption = 7)) then
  begin
    oDBNav.Visible := true;
    oBtnNew.Visible := true;
    oBtnEdit.Visible := true;
    oBtnDelete.Visible := true;
    oBtnFind.Visible := true;
    oBtnPrint.Visible := false;
    oBtnExit.Enabled := true;
    oBtnSave.Top := oBtnNew.Top;
    oBtnSave.Left := oBtnNew.Left;

    oBtnAbort.Top := oBtnEdit.Top;
    oBtnAbort.Left := oBtnEdit.Left;

    oBtnAbort.Visible := false;
    oBtnSave.Visible := false;
    oBtnExit.Visible := true;

  end;

end;

procedure TfProveedor.Activa_Objetos(bPar: boolean);
var
  i: Word;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin

    if (self.Components[i] is TDBEdit) then
      TDBEdit(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBMemo) then
      TDBMemo(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBNumberEditEh) then
      TDBNumberEditEh(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBCheckBox) then
      TDBCheckBox(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBDateTimeEditEh) then
      TDBDateTimeEditEh(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TDBComboBoxEh) then
      TDBComboBoxEh(self.Components[i]).Enabled := bPar;

    if (self.Components[i] is TBitBtn) then
    begin
      if TBitBtn(self.Components[i]).tag = 20 then
        TBitBtn(self.Components[i]).Enabled := bPar;
    end;

    if (self.Components[i] is TButton) then
    begin
      TButton(self.Components[i]).Enabled := bPar;
    end;
  end;
  self.oid_autoinc.Enabled := false;
  self.oprov_fecha_modif.Enabled := false;
  self.oprov_fecha_alta.Enabled := false;
end;

end.
