unit UnitClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  XMLDoc, XMLIntf, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdBaseComponent, IdMessage, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdAttachmentFile, IdText, Vcl.Buttons,
  ViaCEP.Intf, ViaCEP.Core, ViaCEP.Model, UnitFunction;

type
  Tfrm_Cliente = class(TForm)
    gpb_DadosPessoais: TGroupBox;
    Label3: TLabel;
    msk_Cpf: TMaskEdit;
    edt_Nome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_Identidade: TEdit;
    Label4: TLabel;
    msk_Telefone: TMaskEdit;
    Label5: TLabel;
    edt_Email: TEdit;
    gpb_InformacaoResidencial: TGroupBox;
    Label6: TLabel;
    msk_Cep: TMaskEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    edt_Logradouro: TEdit;
    Label8: TLabel;
    edt_Numero: TEdit;
    Label9: TLabel;
    edt_Complemento: TEdit;
    Label10: TLabel;
    edt_Bairro: TEdit;
    Label11: TLabel;
    edt_Cidade: TEdit;
    Label12: TLabel;
    cbb_Estado: TComboBox;
    Label13: TLabel;
    edt_Pais: TEdit;
    gpb_ConfiguraEmail: TGroupBox;
    ckb_SendMail: TCheckBox;
    Bevel2: TBevel;
    Label15: TLabel;
    edt_AddressServer: TEdit;
    Label16: TLabel;
    edt_SendPort: TEdit;
    Label14: TLabel;
    edt_EmailDestinatario: TEdit;
    Label17: TLabel;
    edt_LoginEmail: TEdit;
    Label18: TLabel;
    edt_PasswordEmail: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckb_SendMailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure msk_CpfExit(Sender: TObject);
    Function isValidCPF(num: string): Boolean;
    procedure edt_IdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure msk_CepExit(Sender: TObject);
    procedure edt_SendPortExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure generateXml;
    function isValidEmail: boolean;
    function SendEmail(const AEmitente, AAssunto, ADestino, AAnexo: String; ACorpo: TStrings): Boolean;
    procedure FormDestroy(Sender: TObject);
    procedure edt_NumeroExit(Sender: TObject);
    procedure edt_EmailExit(Sender: TObject);
    procedure edt_EmailDestinatarioExit(Sender: TObject);
    procedure msk_TelefoneExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    ComponentePro: TComponent;
    procedure ProCode(Sender: TObject);
  end;

var
  frm_Cliente: Tfrm_Cliente;

implementation

{$R *.dfm}

function TFrm_Cliente.isValidCPF(num: string): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin

  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);

  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 +
        n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
  d1:=11-(d1 mod 11);

  if d1 >= 10 then d1 := 0;

  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 +
        n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);

  if d2 >= 10 then d2 := 0;

  calculado := inttostr(d1)+inttostr(d2);
  digitado  := num[10]+num[11];
  isValidCPF := calculado=digitado;
end;


function Tfrm_Cliente.isValidEmail: boolean;
begin
  Result := True;

  // Validações das configurações para envio do e-mail
  if Length( edt_AddressServer.Text ) < 4 then
    Result := False;

  if trim( edt_SendPort.Text ) = '' then
    Result := False;

  if Length( edt_Logradouro.Text ) < 4 then
    Result := False;

  if Length( edt_PasswordEmail.Text ) < 2 then
    Result := False;

  if Length( edt_EmailDestinatario.Text ) < 5 then
    Result := false;

 { if not fileexists(ExtractFilePath(Application.ExeName)+'libeay32.dll') then
    Result := false;

  if not fileexists(ExtractFilePath(Application.ExeName)+'ssleay32.dll') then
    Result := false;}
end;

procedure Tfrm_Cliente.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Cliente.BitBtn2Click(Sender: TObject);
var
  emailBody : TstringList;
begin
    isValidField(frm_Cliente);

    generateXml;

    MessageDlg('Cadastro realizado com sucesso!', mtinformation, [mbok], 0);

    if ckb_SendMail.checked = true then
    begin

      if isValidEmail then
      begin

        emailBody := TStringList.Create;

        with emailBody do
        begin
          Clear;

          Add('Nome: '       + edt_Nome.Text);
          Add('Identidade: ' + edt_Identidade.Text);
          Add('CPF: '        + msk_Cpf.Text);
          Add('TELEFONE: '   + msk_Telefone.Text);
          Add('E-mail: '     + edt_Email.Text);
          Add('CEP: '        + msk_Cep.Text);
          Add('Logradouro: ' + edt_Logradouro.Text);
          Add('Número: '     + edt_Numero.Text);
          Add('Complemento: '+ edt_Complemento.Text);
          Add('Bairro: '     + edt_Bairro.Text);
          Add('Cidade: '     + edt_Cidade.Text);
          Add('UF: '         + cbb_Estado.Text);
          Add('País: '       + edt_Pais.text);
        end;

        if SendEmail('Cadastro de Cliente', 'Teste envio email',
            edt_EmailDestinatario.Text, ExtractFilePath(ParamStr(0)) + 'Cliente-'+msk_Cpf.Text+'.xml', emailBody) then
          MessageDlg('E-Mail enviado com sucesso.', mtInformation, [mbOK], 0)
        else
          MessageDlg('Falha ao enviar E-MAIL. Favor verificar', mtWarning, [mbOK], 0);

        emailBody.free;

        edt_Nome.Clear;
        edt_Identidade.Clear;
        msk_Cpf.Clear;
        msk_Telefone.Clear;
        edt_Email.Clear;
        msk_Cep.Clear;
        edt_Logradouro.Clear;
        edt_Numero.Clear;
        edt_Complemento.Clear;
        edt_Bairro.Clear;
        edt_Cidade.Clear;
        cbb_Estado.Clear;
        edt_Pais.Clear;

        msk_Cpf.SetFocus;

      end
      else
        messagedlg('Favor verificar as configurações do E-MAIL e na pasta '+ ExtractFilePath(Application.ExeName)+ #13 +
                  ' se existe os arquivos libeay32.dll e ssleay32.dll.', mtWarning, [mbOK], 0);
    end;

end;

procedure Tfrm_Cliente.ckb_SendMailClick(Sender: TObject);
begin
  if ckb_SendMail.Checked then
    gpb_ConfiguraEmail.Height := 250
  else
    gpb_ConfiguraEmail.Height := 60;
end;

procedure Tfrm_Cliente.edt_EmailDestinatarioExit(Sender: TObject);
begin
  if not ValidarEmail(edt_EmailDestinatario.Text) then
  begin
    ShowMessage('E-mail incorreto, Favor verificar!');
  end;
end;

procedure Tfrm_Cliente.edt_EmailExit(Sender: TObject);
begin
  if not ValidarEmail(edt_Email.Text) then
  begin
    ShowMessage('E-mail incorreto, Favor verificar!');
  end;
end;

procedure Tfrm_Cliente.edt_IdentidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure Tfrm_Cliente.edt_NumeroExit(Sender: TObject);
begin
  if Trim(edt_Numero.Text) = '' then
    edt_Numero.Text := 'S/N';
end;

procedure Tfrm_Cliente.edt_SendPortExit(Sender: TObject);
begin
  try
    StrToInt(edt_SendPort.Text);
  except
    edt_SendPort.Text := '0';
  end;
end;

procedure Tfrm_Cliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja realmente sair?',
      'Cadastro de Cliente', mb_applmodal+MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = 7 then
      CanClose := False;
end;

procedure Tfrm_Cliente.FormCreate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ProCode;
  gpb_ConfiguraEmail.Height := 60;
end;

procedure Tfrm_Cliente.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure Tfrm_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Teclado o Esc para sair
  if Key = #27 then
  begin
    close;
  end;

  // Função para trocar o Tab por Enter
  if Key = #13 then
  begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0,0);
  end;
end;

procedure Tfrm_Cliente.generateXml;
var
  XMLDocument: TXMLDocument;
  NodeClient, NodeAddress: IXMLNode;
begin
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active                     := True;

    NodeClient                             := XMLDocument.AddChild('Client');
    NodeClient.ChildValues['Nome']         := edt_Nome.Text;
    NodeClient.ChildValues['Identidade']   := edt_Identidade.Text;
    NodeClient.ChildValues['CPF']          := msk_Cpf.Text;
    NodeClient.ChildValues['Telefone']     := msk_Telefone.Text;
    NodeClient.ChildValues['Email']        := edt_Email.Text;

    NodeAddress                            := NodeClient.AddChild('Address');
    NodeAddress.ChildValues['CEP']         := msk_cep.Text;
    NodeAddress.ChildValues['Logradouro']  := edt_Logradouro.Text;
    NodeAddress.ChildValues['Numero']      := edt_Numero.Text;
    NodeAddress.ChildValues['Complemento'] := edt_Complemento.Text;
    NodeAddress.ChildValues['Bairro']      := edt_Bairro.Text;
    NodeAddress.ChildValues['Cidade']      := edt_Cidade.Text;
    NodeAddress.ChildValues['UF']          := cbb_Estado.Text;
    NodeAddress.ChildValues['Pais']        := edt_Pais.Text;

    XMLDocument.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Cliente-'+msk_Cpf.Text+'.xml');
  finally
    XMLDocument.Free;
  end;
end;

procedure Tfrm_Cliente.msk_CepExit(Sender: TObject);
var
  ViaCEP: IViaCEP;
  getInfo: TViaCEPClass;
begin
  if msk_Cep.Text <> '' then
  begin
    ViaCEP := TViaCEP.Create;

    if ViaCEP.Validate(msk_Cep.Text) then
    begin
      getInfo := ViaCEP.Get(msk_Cep.Text);

      if Assigned(getInfo) then
      begin
        try
          edt_Logradouro.Text  := getInfo.Logradouro;
          edt_Complemento.Text := getInfo.Complemento;
          edt_Bairro.Text      := getInfo.Bairro;
          edt_Cidade.Text      := getInfo.Localidade;
          cbb_Estado.ItemIndex := cbb_Estado.Items.IndexOf(getInfo.UF);
          edt_Pais.Text        := 'Brasil';
          edt_Numero.SetFocus;
        finally
          getInfo.Free;
        end;
      end
      else
        MessageDlg('CEP não encontrado. Favor verificar.', mtwarning, [mbok], 0);
    end
    else
      messagedlg('CEP invádilo.', mtwarning, [mbok], 0);
  end
  else
  begin
    if Length(edt_EmailDestinatario.Text) < 11 then
    begin
      ShowMessage('Número de telefone invalido, Favor verificar!');
    end;
  end;
end;

procedure Tfrm_Cliente.msk_CpfExit(Sender: TObject);
begin
  if (msk_Cpf.Text <> '') and (Length(msk_Cpf.Text) = 11) then
  begin
    if not isValidCPF( msk_Cpf.Text )  then
    begin
      msk_Cpf.clear;
      MessageDlg('Favor verificar CPF INVÁLIDO.', mtwarning, [mbok], 0);
    end;
  end
  else
    MessageDlg('Campo obrigatório, CPF INVÁLIDO.', mtwarning, [mbok], 0);
end;

procedure Tfrm_Cliente.msk_TelefoneExit(Sender: TObject);
begin
  if Length(msk_Telefone.Text) < 11 then
  begin
    ShowMessage('Número de telefone invalido, Favor verificar!');
  end;
end;

procedure Tfrm_Cliente.ProCode(Sender: TObject);
begin
  if Assigned(ComponentePro) then
    TEdit(ComponentePro).Color := clWindow;

  if (ActiveControl is TEdit) or
    (ActiveControl is TMaskEdit) or
    (ActiveControl is TCheckBox) or
    (ActiveControl is TComboBox) or
    (ActiveControl is TMemo) then
  begin
    TEdit(ActiveControl).Color := clYellow;
    TMaskEdit(ActiveControl).Color := clYellow;
    ComponentePro := ActiveControl;
  end;
end;

function Tfrm_Cliente.SendEmail(const AEmitente, AAssunto, ADestino,
  AAnexo: String; ACorpo: TStrings): Boolean;
var
  idMsg                : TIdMessage;
  idText               : TIdText;
  idSMTP               : TIdSMTP;
  idSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin

  try

    try

      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      //Variável referente a mensagem
      idMsg                           := TIdMessage.Create(Self);
      idMsg.CharSet                   := 'utf-8';
      idMsg.Encoding                  := meMIME;
      idMsg.From.Name                 := AEmitente;
      idMsg.From.Address              := edt_LoginEmail.Text;
      idMsg.Priority                  := mpNormal;
      idMsg.Subject                   := AAssunto;

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ADestino;
      idMsg.CCList.EMailAddresses     := 'marcos.valverde@opeao.com.br';

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ACorpo.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      idSMTP            := TIdSMTP.Create(Self);
      idSMTP.IOHandler  := IdSSLIOHandlerSocket;
      idSMTP.UseTLS     := utUseImplicitTLS;
      idSMTP.AuthType   := satDefault;
      idSMTP.Host       := edt_AddressServer.Text;
      idSMTP.AuthType   := satDefault;
      idSMTP.Port       := StrToInt(edt_SendPort.Text);
      idSMTP.Username   := edt_LoginEmail.Text;
      idSMTP.Password   := edt_PasswordEmail.Text;

      //Conecta e Autentica
      idSMTP.Connect;
      idSMTP.Authenticate;

      if AAnexo <> EmptyStr then
        if FileExists(AAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);

      //Se a conexão foi bem sucedida, envia a mensagem
      if idSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;

      //Depois de tudo pronto, desconecta do servidor SMTP
      if idSMTP.Connected then
        idSMTP.Disconnect;

      Result := True;

    finally

      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(idSSLIOHandlerSocket);
      FreeAndNil(idSMTP);

    end;

  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

end.
