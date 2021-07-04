{GLOBAL                                     }
{ESCRITA POR ALFREDO S. KOPLIN EM 23/12/2001}

unit Global;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, StdCtrls,FileCtrl,
Graphics, shellapi, Printers, Forms, MMSystem, Mask, DB, DBCtrls, DBIProcs,
DBTables, MPlayer, Variants, Registry, IniFiles,ExtCtrls,DateUtils;

type

  TtbVolInfo = record
  Name: string;
  Serial: Cardinal;
  IsCompressed: boolean;
  MaxCompLen: Cardinal;
  FileSysName: string;
//  PrinterMatrixSpool: TPrinterMatrixSpool;
  handle:THandle;
  end;

const
	Chave = '\Software\Microsoft\Windows\CurrentVersion\RunOnce\nilpok\';
	  DLL = Chave;//'sys\DLLUser';
	  MVO = '\MVO';
	  CTS = 'CTS';
cntValor = '1';
  Alerta = 'O Prazo para a avaliação deste produto expirou. Por favor, entre em contato com seu fornecedor visando obter o Reset.';

	 //______________________________________________________
Function FileVersion():string;
function dataMy(data:TDAte):String;
Function Aqui(Dir,Arquivo:String):String;
function After(const Search, Find: string): string;
function AliasPath( sAlias : String) : String;
function Alltrim(const Search: string): string;
function Arquivos(Const AMask: string): TStringList;  {Retorna uma TStringlist de todos os arquivos localiz. no path corrente. Esta função aceita mascaras}
function ArredondaFloat(x : Real): Real;  {Arredonda um número float para convertê-lo em String}
function Base10(Base2:Integer):Integer; assembler;
function Before(const Search, Find: string): string;
function BinToInt(Value: String): LongInt;
function BuscaDireita(Busca,Text : string) : integer;
function BuscaTroca(Text,Busca,Troca : string) : string;
Function CartaoValido(numero:string): Boolean; //valida cartao de credito...
Function Codifica( const Str1: string): String;
function ContaCaracs(Edit:String): integer;
function CopiaArquivo(source,dest: String): Boolean; {copia um arquivo de um lugar para outro. Retornando falso em caso de erro}
Function CriaIni:string;
function DatadoArquivo(Arquivo: String): String; {Retorna a data e a hora de um arquivo}
function DecToBase( Decimal: LongInt; const Base: Byte): String;
function DecToBinStr(n: integer): string;
function DecToRoman( Decimal: LongInt ): String;
Function Delphi() :Boolean;
function DiasDoMes(const Mes, Ano: word): word;
function DirWindows:string; //diretorio do windows...
function DirWindowsSystem:string;//system...
function DiscoNoDrive(const drive : char): boolean;
function DriveExiste(const Drive: Char): boolean;{ Retorna true se o drive existe }
function DriveInfo(const Drive: Char; Path: PChar): TtbVolInfo;{ Retorna informações diversas sobre uma unidade. Veja TtbVolInfo }
function DriveOk(const Drive: Char): boolean;{ Retorna true se o drive está preparado }
function Empty(inString:String): Boolean;
function Encrypt( Senha:String ): String;
Function ExecFile(F, modo,parametro: String):Boolean;//executa arquivo - modo >>open, print, etc...
function Extenso(Numero: String): String; //retorna o extenso de um numero...
function ExtensoMil(Numero : String) : String; //faz parte da anterior...
function FullFill(Str:String;FLen:byte;symb:char):string;
function Gerapercentual(valor:real;Percent:Real):real;
function ImpressoraPadrao :String; // Retorna a impressora padrão do windows Requer a unit printers declarada na clausula uses da unit
function IntPrime(Value: Integer): Boolean; //verifica se o inteiro e primo...
function IntToBin(Value: LongInt;Size: Integer): String; //convert integer p/ binario...
function IsPrinter : Boolean;
Function LeReg(Valor:string):Boolean;//usado na validade...
function LetrasdosDrives: string;{ Retorna uma string contendo as letras de unidades de existentes }
function LineIsEmpty(Text:string):boolean;//verifica se a linha esta em branco...
Function Lixeira(sFileName : string ) : boolean; // Envia um arquivo para a lixeira ( requer a unit Shellapi.pas)
function LTrim(Texto:String):String;//remove caracteres em branco a esq. da string...
function Maiuscula(Texto:String): String; //converte p/ maiusculas...
function MaskString(Valor: String) : String;//desativada...
function Max(A, B: Integer): Integer; //retorna o maior valor no intervalo...
function Min(A, B: Integer): Integer; //retorna o menor valor no intervalo...
function MouseClip(const Rct: TRect): boolean;{ Aprisiona o mouse em um retângulo }
function MouseGetButtons: byte;{ Retorna o número de botões do mouse }
function MouseGetPos(var Pt: TPoint): boolean;{ Retorna a posição do mouse }
function MouseInWindow(const WinHandle: HWnd): boolean;{ Retorna true se o mouse está sobre a janela }
function MouseIsPresent: boolean;{ Retorna true se o mouse está configurado }
function MouseMoveToControl(const Control: TControl): boolean;{ Move o ponteiro do mouse para um controle (componente visual) }
function MouseSetPos(const Pt: TPoint): boolean;{ Define a posição do mouse }
function MouseShowCursor(const Show: boolean): boolean;{ Exibe ou oculta o ponteiro do mouse }
function MouseSlideToControl(const Control: TControl; Jump, JumpTime: Word): boolean;{ Desliza o ponteiro do mouse até um controle }
function MouseSwapButtons(const Swap: boolean): boolean;{ Inverte os botões do mouse }
function MouseSwappedButtons: boolean;{ Retorna true se os botões estão invertidos }
function MouseUnClip: boolean;{ Libera o mouse - previamente aprisionado com MouseClip }
function NaRede: boolean;{ Retorna true se o computador está configurado para rede }
function NomedoArquivo(const Arquivo: String): String;{Retorna o nome do Arquivo sem extensão}
function NomedoDrive(const Drive: Char; Path: PChar): string;{ Retorna o nome de volume de uma unidade }
function NumeroDeCores : Integer;{Retorna a quantidade atual de cores no Windows (16, 256, 65536 = 16 ou 24 bit}
function NumerodoDrive(const Drive: Char): byte;{ Retorna o número do drive: A=1, B=2, C=3, etc. }
function NumLinhasArq(Arqtexto:String): integer; // Retorna o número de linhas que um arquivo possui...
function NumToHex(Num: Word): String; //converte numero para hexa...
function PadC(S:string;Len:byte):string;
function Padl(s:string;n:integer):string;
function Padr(s:string;n:integer):string;
Function PegaChave(Campo,Tabela:String):Variant;
function PegaDatadoArquivo(Arquivo: string): string;
function Percentdisk(unidade: byte): Integer; {Retorna a porcentagem de espaço livre em uma unidade de disco}
function PrintImage(Origem: String):Boolean;  // imprime um bitmap selec. retornando falso em caso negativo requer as units Graphics e printers
function QuebraString(Strn,Delimitador:String):TStringList;
function RemoveAcentos(Str:String): String;
function Replicate( Caracter:String; Quant:Integer ): String;   //repete o nº de veses definido a string...
function RoundNum(Valor:Extended;Decimais:Integer):Extended; //arrendonda o valor no nº de casaS DECIMAIS
function RTrim(Texto:String):String;  //remove brancos a direita da string...
function SeNumSeq(tabela: String; Dataset:TDataSet): Boolean;
function SerialdoDrive(const Drive: Char; Path: PChar): Cardinal;{ Retorna o número serial de uma unidade }
Function SeMVO:Boolean; //verifica se MVO esta presente...
function strByteSize(Value: Longint): String;
function StringToFloat(s : string) : Extended;
Function Strs(I:longint):string ;
function StrToPChar(const Str: string): PChar;
Function StrToReal(inString :String): Real;
function StrZero(Zeros:string;Quant:integer):String;
function StrZerodec(Numero: Double; Total, Decimal: integer): string;
function SysComputerName: string;{ Retorna o nome do computador }
function SysPlatform: DWord;{ Retorna a identificação da plataforma }
function SysSetComputerName(const S: string): boolean;{ Define o nome do computador }
function SysTempDir: string;{ Retorna o diretório Temp do Windows }
function SysUserName: string;{ Retorna o nome do usuário logado no Windows }
function SysVersion(var Ver: _OSVERSIONINFOA): boolean;{ Retorna informações de versão do Windows }
function SysVersionStr: string;{ Retorna uma string contendo a versão do Windows }
function TabelaTravada(Tabela: TTable): Boolean;
function TamanhodoArquivo(const Arquivo: String): LongInt; //Retorna o tamanho de um arquivo}
function tbGetLongStr(const S: string; const Sep: Char): string;{ Retorna string ao lado direito do separador }
function tbGetShortStr(const S: string; const Sep: Char): string;{ Retorna a string ao lado esquerdo do separador }
function tbPadC(const S: string; const Len: integer; const Ch: Char): string;{ Semelhante a PadC do clipper }
function tbPadL(const S: string; const Len: integer; const Ch: Char): string;{ Semelhante a PadL do clipper }
function tbPadR(const S: string; const Len: integer; const Ch: Char): string;{ Semelhante a PadR do clipper }
function tbReplChar(const Ch: Char; const Len: integer): string;{ Replica um caractere n vezes formando uma string }
function tbReplStr(const S: string; const Len: integer): string;{ Replica uma string até atingir o tamanho especificado }
function tbSpace(const Len: integer): string;{ Retorna uma string de N espaços }
function tbStrZero(const Value, Len: integer): string;{ Forma um número inteiro com zeros à esquerda }
Function TemSom(Value:integer): Boolean;{Testa se existe uma placa de som no seu computador}
function TipodoArquivo(const Arquivo: String): String; {Retorna descrição do tipo do arquivo. Requer a unit ShellApi}
function TipodoDrive(const Drive: Char; Path: PChar): integer;// Retorna o tipo do drive.
Function Validade(Valor:string):integer;//libera aplicatico por n dias...
function VerificaAno: Boolean; //verifica se o ano tem 4 digitos
function VerificaChave(alias:String; tTabela:TTable; Campo, NomeTabelaReal:String; Valor:Variant): Boolean;
function VoltaPercentual(valor:real;Percent:Real; Soma:boolean):real;//calcula o valor mais ou menos o % dado...
Function wordcount(str : string) : integer; //conta as palavras de uma string...
function InputSenha(const ACaption, APrompt: string; var Value: string): Boolean;
function Idade(Data1,Data2:TDate):string;
function EntreAspas(Simples:integer;s:string):String;
function DataSQL(Data:TDate):String;
function Troca(s,oldPalavra, newPalavra:string):string;
function InsereBranco(TC : Word; QB : Word; Campo : string): string;
function FormataTel1(xtel: string): string;
function IPInvalido(ip: string): Boolean;
function FormataCep(cep : string): string;
function Rateio(Valor_Nota, Valor_Tot_Itens: Real): Real;
function TiraMascara (S: String) : String;
function DataBR(Campo_Data:string ):string;
function InputMask(const ACaption, APrompt: string;
var Value: string; const AMask: String = '!99/99/0000;1;'): String;
function RemoveTitleBar(hWindow: THANDLE; Hide: boolean = True): DWORD;
function Iff(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;

procedure ApagaArquivos(caminho, Nome_do_Arquivo:string; AvisaSeTerminou:Boolean);//delete o arquivo definido e avisa ao termino...
procedure ChecaUF(sender:TObject);
procedure CopiaArquivoII( Const origem, destino: String );{Copia um arquivo de um lugar para outro}
procedure DeletaArquivosdoTipo(vMasc:String); //Apaga arquivos usando mascaras tipo: *.zip, *.* ...
procedure FormataData(sender: TObject);
procedure FormataTel(sender: TObject);
procedure FormataTxt(sender:TObject);
procedure GravaReg(Valor:string; n:Double);
procedure LimpaDataset(const DataSet: TDataSet);
procedure MouseClick(const Duration: Word);{ Simula - click de mouse }
procedure SeVazio(sender: TObject); //valida entrada em edits e combos...
procedure TravaCtrlAltDel(travar:Boolean);
procedure WndProcessMessages(const Wnd: HWnd);//Processa as mensagens enviadas a uma janela
procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal);{ Process mens. env.  a 1 jan. - soment o interv  de mens informado }
procedure ExecutaSQL(Alias, Comando:string);
procedure ConfiguraRG(RadioGroup:TRadioGroup;itens:array of integer);
procedure AjustaRelogio(DataHora:string);
procedure FreeMemm;
procedure MAPEAR(PServer,PLetra:string);
procedure DirList( ASource : string; ADirList : TStringList );

implementation

function TiraMascara (S: String) : String;
var
	StrResult,
	naopresta :String;
	i: Integer;
begin
	for i := 1 to Length (S) do
	begin
		if S[i] in ['.',',','/','-','(',')',' '] then
			naopresta := naopresta + S[i]
		else
			StrResult := StrResult + S[i]
	end;
	Result := StrResult;
end;

Function FormataCep(cep : string): string;
//
// Formata uma cadeia de strings referente ao Cep
//
begin
Result := Copy(cep,1,2)+'.'+Copy(cep,3,3)+'-'+Copy(cep,6,3);
end;

function InsereBranco(TC : Word; QB : Word; Campo : string): string;
var i : Integer;
	 A : string;
begin
	i := TC - QB;
	A := Campo;
	while i > 0 do
	begin
		Insert(' ',A,Length(A)+1);
		Inc(i,-1);
	end;
	Result := A;
end;

function IPInvalido(ip: string): Boolean;
var z:integer; i: byte; st: array[1..3] of byte;
const ziff = ['0'..'9'];
begin
st[1] := 0; st[2] := 0; st[3] := 0; z := 0; IPInvalido := true;
for i := 1 to Length(ip) do
If not (ip[i] in ziff) then begin
if ip[i] = '.' then begin
Inc(z);
if z < 4 then st[z] := i
else
Exit;
end else
Exit;
end;
if (z <> 3) or
   (st[1] < 2) or
   (st[3] = Length(ip)) or
   (st[1] + 2 > st[2]) or
   (st[2] + 2 > st[3]) or
   (st[1] > 4) or
   (st[2] > st[1] + 4) or
	(st[3] > st[2] + 4) then Exit;

z := StrToInt(Copy(ip, 1, st[1] - 1));
if (z > 255) or
   (ip[1] = '0') then Exit;
z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
if (z > 255) or
   ((z <> 0) and
   (ip[st[1] + 1] = '0')) then Exit;
z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
if (z > 255) or ((z <> 0) and
	(ip[st[2] + 1] = '0')) then Exit;
z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
if (z > 255) or ((z <> 0) and
   (ip[st[3] + 1] = '0')) then exit;
IPInvalido := false;
end;

procedure DirList( ASource : string; ADirList : TStringList );
var
SearchRec : TSearchRec;
Result : integer;
begin
Result := FindFirst( ASource, faAnyFile, SearchRec );
if Result = 0 then
while (Result = 0) do
begin
if (SearchRec.Name+' ')[1] = '.' then
{ Se pegou nome de SubDiretorio }
begin
Result := FindNext( SearchRec );
Continue;
end;
ADirList.Add( SearchRec.Name );
Result := FindNext( SearchRec );
end;
FindClose( SearchRec );
ADirList.Sort;
end;

function RemoveTitleBar(hWindow: THANDLE; Hide: boolean = True): DWORD;
var
  R: TRect;
begin
  Result := GetWindowLong(hWindow, GWL_STYLE);
  if (Hide) then
	 Result := Result and not WS_CAPTION
  else
    Result := Result or WS_CAPTION;
  GetClientRect(hWindow, R);
  SetWindowLong(hWindow, GWL_STYLE, Result);
  AdjustWindowRect(R, Result, boolean(GetMenu(hWindow)));
  SetWindowPos(hWindow, 0, 0, 0, (R.Right - R.Left), (R.Bottom - R.Top),
    SWP_NOMOVE or SWP_NOZORDER or SWP_FRAMECHANGED or SWP_NOSENDCHANGING);
end;

PROCEDURE MAPEAR(PServer,PLetra:string);
var
err : DWord; PSenha: PChar; B:BOOLEAN;
Begin
PServer := PServer + #0;
PLetra := PLetra+':';
PSenha := '';
If PLetra='' then raise exception.Create('Falta a letra da unidade');
If PServer='' then raise exception.Create('Falta o caminho para a unidade');
ERR := WNetAddConnection ( Pchar(PServer) , PSenha , PChar(PLetra) );
b:=false;
CASE ERR of
ERROR_ACCESS_DENIED : ShowMessage ( 'Acesso negado.' );
ERROR_ALREADY_ASSIGNED : b:=true;//ShowMessage ( 'A letra do drive especificada já está conectada.' );
ERROR_BAD_DEV_TYPE : ShowMessage ( 'O tipo de dispositivo e o tipo de recurso não são compatíveis.' );
ERROR_BAD_DEVICE : ShowMessage ( 'Letra inválida.' );
ERROR_BAD_NET_NAME : ShowMessage ( 'Nome do servidor não é válido ou não pode ser localizado.' );
ERROR_BAD_PROFILE : ShowMessage ( 'Formato incorreto de parâmetros.' );
ERROR_CANNOT_OPEN_PROFILE : ShowMessage ( 'Conexão permanente não disponível.' );
ERROR_DEVICE_ALREADY_REMEMBERED : ShowMessage ( 'Uma entrada para o dispositivo especificado já está no perfil do usuário.' );
ERROR_EXTENDED_ERROR : ShowMessage ( 'Erro de rede.' );
ERROR_INVALID_PASSWORD : ShowMessage ( 'Senha especificada inválida.' );
ERROR_NO_NET_OR_BAD_PATH : ShowMessage ( 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.' );
ERROR_NO_NETWORK : ShowMessage ( 'A rede não está presente.' );
else if Err > 0 then
If not b then
ShowMessage ('Erro cod.: '+IntToStr(Err));
end; end;



Function FileVersion():string;
var
VerInfoSize: DWORD;
VerInfo: Pointer;
VerValueSize: DWORD;
VerValue: PVSFixedFileInfo;
Dummy: DWORD;
V1, V2, V3, V4: Word;
Prog : string;
begin
Prog := Application.Exename;
VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
with VerValue^ do
  begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
  end;
FreeMem(VerInfo, VerInfoSize);
result := Copy (IntToStr (100 + v1), 3, 2) + '.' +
  Copy (IntToStr (100 + v2), 3, 2) + '.' +
  Copy (IntToStr (100 + v3), 3, 2) + '.' + 
  Copy (IntToStr (100 + v4), 3, 2);
end;


function DataSQL(Data:TDate):String;
begin
result:=QuotedStr(FormatDateTime('mm/dd/yyyy',data));
end;

function  DataBR(Campo_Data:string ):string;
begin
result:=' DATE_FORMAT('+Campo_Data+',''%d/%m/%Y'') ';
end;

procedure FreeMemm;
Begin
if (Win32Platform = VER_PLATFORM_WIN32_NT) or (Win32Platform = VER_PLATFORM_WIN32s) then
SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
end;

procedure AjustaRelogio(DataHora:string);
var data:TsystemTime;
begin
getlocaltime(Data);
DecodeDate(StrToDatetime(DataHora),data.wYear,data.wMonth,data.wDay);
DecodeTime(StrTodateTime(DataHora),data.wHour,data.wminute ,data.wsecond,data.wmilliseconds);
setlocaltime(data);
end;

function dataMy(data:TDAte):String;
begin
//SELECT DATE_FORMAT(ADDDATE(20051102,30),GET_FORMAT(DATE,'EUR')) AS MYDATA FROM TIPO LIMIT 1
//result:='date_format('+FormatDateTime('yyyymmdd',data)+',get_format(date,''eur''))';
result:=FormatDateTime('yyyymmdd',data);
end;

function QuebraString(Strn,Delimitador:String):TStringList;
var posi:integer;
begin
Result:=TStringList.Create;
While STRn <>'' do begin
posi:=pos(Delimitador,strn);
If posi = 0 then begin
Result.Add(strn);
strn:='';
end else begin
Result.Add(Copy(strn,1,posi-1));
delete(strn,1,posi);
end; end; end;

function EntreAspas(Simples:integer;s:string):String;
begin
If Simples = 0 Then result:= QuotedSTR(s) else
   result:= ''''+s+'''';
end;

function RegistroMestre(CNPJ,IE,EMPRESA,CIDADE,UF,TEL:STRING;DATAI,DATAF:TDate; Convenio,Natureza,Finalidade:integer) : String;
VAR I:INTEGER;   //GERA CABEÇALHO DO ARQUIVO...
begin
while pos('(0',tel)<>0 do delete(tel,pos('(0',tel),2); //remoção de caracteres não numéricos...
while pos('(',tel)<>0 do delete(tel,pos('(',tel),1);
while pos(')',tel)<>0 do delete(tel,pos(')',tel),1);
while pos('-',tel)<>0 do delete(tel,pos('-',tel),1);
while pos('.',CNPJ)<>0 do delete(CNPJ,pos('.',CNPJ),1);
while pos('-',CNPJ)<>0 do delete(CNPJ,pos('-',CNPJ),1);
while pos('/',CNPJ)<>0 do delete(CNPJ,pos('/',CNPJ),1);
while pos('.',IE)<>0 do delete(IE,pos('.',IE),1);
while pos('-',IE)<>0 do delete(IE,pos('-',IE),1);
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('10',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,3);
INSERT(copy(IE,1,14),RESULT,17);
INSERT(copy(EMPRESA,1,35),RESULT,31);
INSERT(copy(CIDADE,1,30),RESULT,66);
INSERT(copy(UF,1,2),RESULT,96);
INSERT(copy(TEL,1,10),RESULT,98);
INSERT(FormatDateTime('yyyymmdd',DATAI),RESULT,108);//DATA INICIAL...
INSERT(FormatDateTime('yyyymmdd',DATAF),RESULT,116);
INSERT(intToStr(convenio),RESULT,124);
INSERT(intToStr(Natureza),RESULT,125);
INSERT(intToStr(Finalidade),RESULT,126);
RESULT:=COPY(RESULT,1,126);
end;

function Registro50(Numero:integer; DATA_RECEBIMENTO:TDate; CNPJ, IE, MODELO, SERIE,
  SUBSERIE, CFOP, SITUACAO,UF: STRING; TOTAL, BASE_ICMS, ICMS, ISENTA,
  OUTRAS, ALIQUOTA: REAL): String;
VAR I:INTEGER; S:String;   //GERA registros...
begin
while pos('.',CFOP)<>0 do delete(CFOP,pos('.',CFOP),1);
while pos('.',CNPJ)<>0 do delete(CNPJ,pos('.',CNPJ),1);
while pos('-',CNPJ)<>0 do delete(CNPJ,pos('-',CNPJ),1);
while pos('/',CNPJ)<>0 do delete(CNPJ,pos('/',CNPJ),1);
while pos('.',IE)<>0 do delete(IE,pos('.',IE),1);
while pos('-',IE)<>0 do delete(IE,pos('-',IE),1);
result:='';
If modelo='*' then modelo:='  ';
If serie='*' then serie:='   ';
If subserie='*' then subserie:='  ';
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('50',RESULT,1);
cnpj:='0000'+cnpj;
cnpj:=copy(cnpj,length(cnpj)-13,14);
INSERT(CNPJ,RESULT,3);
INSERT(copy(IE,1,14),RESULT,17);
INSERT(FormatDateTime('yyyymmdd',DATA_RECEBIMENTO),Result,31);
INSERT(UF,RESULT,39);
INSERT(copy(MODELO,1,2),RESULT,41);
INSERT(copy(SERIE,1,3),RESULT,43);
INSERT(copy(SUBSERIE,1,2),RESULT,46);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,48);
INSERT(CFOP,RESULT,54);
I:=ROUND(TOTAL*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,57);
I:=ROUND(base_icms*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,70);
I:=ROUND(icms*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,83);
I:=ROUND(isenta*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,96);
I:=ROUND(outras*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,109);
I:=ROUND(aliquota*100);
s:=Format('%.4d',[(i)]);
INSERT(s,result,122);
INSERT(situacao,result,126);
result:=copy(result,1,126);
end;

function Registro51(DATA: TDate; NUMERO: INTEGER; CNPJ, IE, UF,  SERIE, SUBSERIE, CFOP, SITUACAO: String;
                    TOTAL, IPI, IPI_ISENTA, IPI_OUTRAS: Real): string;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('51',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,3);
INSERT(copy(IE,1,14),RESULT,17);
INSERT(FormatDateTime('yyyymmdd',DATA),Result,31);
INSERT(copy(UF,1,2),RESULT,39);
INSERT(copy(SERIE,1,2),RESULT,41);
INSERT(copy(SUBSERIE,1,2),RESULT,43);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,45);
INSERT(CFOP,RESULT,51);
I:=ROUND(TOTAL*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,54);
I:=ROUND(ipi*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,67);
I:=ROUND(IPI_Isenta*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,80);
I:=ROUND(IPI_outras*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,93);
//INSERT(CSTF1,result,106);   NÃO USA MAIS. FICAM EM BRANCO...
//INSERT(CSTF2,result,111);
//INSERT(CSTF3,result,116);
//INSERT(CSTF4,result,121);
INSERT(situacao,result,126);
result:=copy(result,1,126);
end;

procedure ConfiguraRG(RadioGroup:TRadioGroup;itens:array of integer);
var i,j:integer;
begin
With RadioGroup do begin
For i:=0 to ComponentCount-1 do
If Components[i] is TRadioButton then begin
(Components[i] as TRadioButton).enabled:=false;
for j:=0 to RadioGroup.Items.Count-1 do
If i = itens[j] then
(Components[i] as TRadioButton).enabled:=true;
end; end; end;

function Registro53(Data: TDate; Numero: integer; CNPJ, IE, UF,Modelo,
  SERIE, SUBSERIE, CFOP, SITUACAO: String; BASE_ICMS_SUBST,ICMS_RETIDO, ODA: Real): String;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('53',RESULT,1);
INSERT(COPY(CNPJ,1,14),RESULT,3);
INSERT(COPY(IE,1,14),RESULT,17);
INSERT(FormatDAteTime('yyyymmdd',Data),RESULT,31);
INSERT(UF,RESULT,39);
INSERT(COPY(MODELO,1,2),RESULT,41);
INSERT(COPY(SERIE,1,3),RESULT,43);
INSERT(COPY(SUBSERIE,1,2),RESULT,46);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,48);
INSERT(CFOP,RESULT,54);
I:=ROUND(BASE_ICMS_SUBST*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,57);
I:=ROUND(ICMS_RETIDO*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,70);
I:=ROUND(ODA*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,83);
INSERT(SITUACAO,RESULT,96);
s:='';
FOR I:=0 TO 40 DO S:=s+' ';
INSERT(S,RESULT,97);
result:=copy(result,1,126);
end;

function Registro60M(DataEmissao:TDate; ECF,SerieECF,ModeloECF:string; Vr_Gd_Tot_In,Vr_Gd_Tot_Fin:Real;
Cont_Inic,Cont_Fim,Cont_RedZ:integer): String;
VAR I:INTEGER; S:String;
begin
result:='';
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('60M',RESULT,1);
s:='';
INSERT(FormatDateTime('yyyymmdd',DataEmissao),RESULT,4);
INSERT(COPY(ECF,1,3),RESULT,12);
INSERT(COPY(SerieECF,1,15),RESULT,15);
INSERT(COPY(ModeloECF,1,2),RESULT,30);
s:=Format('%.6d',[(Cont_Inic)]);
INSERT(s,RESULT,32);
s:=Format('%.6d',[(Cont_Fim)]);
INSERT(s,RESULT,38);
s:=Format('%.6d',[(Cont_RedZ)]);
INSERT(s,RESULT,44);
I:=ROUND(Vr_Gd_Tot_In*100);
s:=Format('%.16d',[(I)]);
INSERT(s,RESULT,50);
I:=ROUND(Vr_Gd_Tot_Fin*100);
s:=Format('%.16d',[(I)]);
INSERT(s,RESULT,66);
s:='';
FOR I:=0 TO 80 DO S:=s+' ';
INSERT(S,RESULT,82);
result:=copy(result,1,126);
end;

function Registro60A(DataEmissao:TDate; ECF, st:string; Acum:Real): String;
VAR I:INTEGER; S:String;
begin
If St='Isen' then st:='I';
If St='Não ' then st:='N';
If St='Subs' then st:='F';
If St='Canc' then st:='CANC';
If St='ISSQ' then st:='ISS';
If St='Desc' then st:='DESC';
result:='';
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('60A',RESULT,1);
s:='';
INSERT(FormatDateTime('yyyymmdd',DataEmissao),RESULT,4);
INSERT(COPY(ECF,2,3),RESULT,12);
INSERT(st,RESULT,15);
I:=ROUND(Acum*100);
s:=Format('%.12d',[(I)]);
INSERT(s,RESULT,19);
result:=copy(result,1,126);
end;

function Registro61(Data_Emissao: TDate; Nmro_Inicial, Nmro_Final: integer; VALOR: Real; SERIE, SUBSERIE, MODELO: String): String;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('61',RESULT,1);
s:='';
FOR I:=0 TO 27 DO S:=s+' ';
INSERT(S,RESULT,3);
INSERT(FormatDAteTime('yyyymmdd',Data_Emissao),RESULT,31);
INSERT(COPY(MODELO,1,2),RESULT,39);
INSERT(COPY(serie,1,3),RESULT,41);
INSERT(COPY(subserie,1,2),RESULT,42);
s:=Format('%.9d',[(Nmro_Inicial)]);
INSERT(s,RESULT,45);
s:=Format('%.9d',[(Nmro_Final)]);
INSERT(s,RESULT,54);
I:=ROUND(VALOR*100);
s:=Format('%.16d',[(i)]);
INSERT(s,result,63);
s:='';
FOR I:=0 TO 50 DO S:=s+' ';
INSERT(S,RESULT,79);
result:=copy(result,1,126);
end;


Function Registro11(Logradouro,numero,complemento,bairro,cep,contato,tel:string):string;
var i:integer; s:string;
begin
while pos('.',cep)<>0 do delete(cep,pos('.',cep),1);
while pos('-',cep)<>0 do delete(cep,pos('-',cep),1);
result:='11';
FOR I:=0 TO 125 DO S:=s+' ';
Insert(result,s,0);
Insert(COPY(Logradouro,1,34),s,3);
i:=StrToInt(numero);
Insert(Format('%.5d',[i]),s,37);
Insert(copy(complemento,1,22),s,42);
Insert(copy(bairro,1,15),s,64);
Insert(copy(cep,1,8),s,79);
Insert(copy(contato,1,28),s,87);
while pos('(0',tel)<>0 do delete(tel,pos('(0',tel),2); //remoção de caracteres não numéricos...
while pos('(',tel)<>0 do delete(tel,pos('(',tel),1);
while pos(')',tel)<>0 do delete(tel,pos(')',tel),1);
while pos('-',tel)<>0 do delete(tel,pos('-',tel),1);
tel:='000'+tel;
tel:=copy(tel,length(tel)-12,12);
Insert(tel,s,115);
Result:=Copy(s,1,126);
end;

function Registro90(cnpj,ie,s1,s2,s3,s4,s5,s6,s7,s8,s9:string): string;
var i,j:integer; ss:string;
begin
result:='';
ss:='';
FOR I:=0 TO 125 DO result:=result+' ';
while pos('.',CNPJ)<>0 do delete(CNPJ,pos('.',CNPJ),1);
while pos('-',CNPJ)<>0 do delete(CNPJ,pos('-',CNPJ),1);
while pos('/',CNPJ)<>0 do delete(CNPJ,pos('/',CNPJ),1);
while pos('.',IE)<>0 do delete(IE,pos('.',IE),1);
while pos('-',IE)<>0 do delete(IE,pos('-',IE),1);
IE:=IE+'*';
cnpj:='0000'+cnpj;
cnpj:=copy(cnpj,length(cnpj)-13,14);
INSERT('90',RESULT,1);
INSERT(CNPJ,RESULT,3);
INSERT(copy(IE,1,14),result,17);
ss:=ss+copy(s1,1,10);
ss:=trim(ss);
ss:=ss+copy(s2,1,10);
ss:=trim(ss);
ss:=ss+copy(s3,1,10);
ss:=trim(ss);
ss:=ss+copy(s4,1,10);
ss:=trim(ss);
ss:=ss+copy(s5,1,10);
ss:=trim(ss);
ss:=ss+copy(s6,1,10);
ss:=trim(ss);
ss:=ss+copy(s7,1,10);
ss:=trim(ss);
ss:=ss+copy(s8,1,10);
ss:=trim(ss);
ss:=ss+copy(s9,1,10);
i:=0;
If copy(s1,3,8)<>'' then i:=i+StrToInt(copy(s1,3,8)); If copy(s2,3,8)<>'' then i:=i+StrToInt(copy(s2,3,8));
If copy(s3,3,8)<>'' then i:=i+StrToInt(copy(s3,3,8)); If copy(s4,3,8)<>'' then i:=i+StrToInt(copy(s4,3,8));
If copy(s5,3,8)<>'' then i:=i+StrToInt(copy(s5,3,8)); If copy(s6,3,8)<>'' then i:=i+StrToInt(copy(s6,3,8));
If copy(s7,3,8)<>'' then i:=i+StrToInt(copy(s7,3,8)); If copy(s8,3,8)<>'' then i:=i+StrToInt(copy(s8,3,8));
If copy(s9,3,8)<>'' then i:=i+StrToInt(copy(s9,3,8));
result:=trim(result);
result:=result+ss;
j:=i;
while pos('*',result)<> 0 do Begin
      i:=pos('*',result);
      delete(result,i,1);
      insert(' ',result,i);
      end;
ss:='';
result:=result+'99'+format('%.8d',[j+3]);
for i:=0 to 126 do ss:=ss+' ';
result:=result+ss;
insert('1',Result,126);
Result:=copy(result,1,126);
end;




function GetAvCharSize(Canvas: TCanvas): TPoint; //usada no imputsenha
var I: Integer; Buffer: array[0..51] of Char;
begin
for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
end;

function InputMask(const ACaption, APrompt: string;
var Value: string; const AMask: String = '!99/99/0000;1;'): String;
var
Form: TForm;
Prompt: TLabel;
Edit: TMaskEdit; // redefinir o componente Edit para TMaskEdit
DialogUnits: TPoint;
ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
Result := '';
Form := TForm.Create(Application);
with Form do
  try
    Canvas.Font := Font;
    DialogUnits := GetAvCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(120, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
	 with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TMaskEdit.Create(Form); // Mudar p/ maskedit - OK
    with Edit do
    begin
      Parent := Form;
		Edit.EditMask := AMask; // Atribuir a máscara
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(90, DialogUnits.X, 4);
      MaxLength := 255;
      Text := Value;
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
	 with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(8, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
		Caption := 'Cancelar';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(60, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := value;
    end;
  finally
    Form.Free;
  end;
end;

function InputSenha(const ACaption, APrompt: string; var Value: string): Boolean;
var
Form: TForm; Prompt: TLabel; Edit: TEdit; DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
Result := False;
Form := TForm.Create(Application);
with Form do try
Canvas.Font := Font;
DialogUnits := GetAvCharSize(Canvas);
BorderStyle := bsDialog;
Caption := ACaption;
ClientWidth := MulDiv(180, DialogUnits.X, 4);
Position := poScreenCenter;
Prompt := TLabel.Create(Form);
with Prompt do begin
Parent := Form;
Caption := APrompt;
Left := MulDiv(8, DialogUnits.X, 4);
Top := MulDiv(8, DialogUnits.Y, 8);
Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
WordWrap := True;
end;
Edit := TEdit.Create(Form);
with Edit do begin
Parent := Form;
Left := Prompt.Left;
Top := Prompt.Top + Prompt.Height + 5;
Width := MulDiv(164, DialogUnits.X, 4);
MaxLength := 255;
PasswordChar:='#';
SelectAll;
end;
ButtonTop := Edit.Top + Edit.Height + 15;
ButtonWidth := MulDiv(50, DialogUnits.X, 4);
ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
with TButton.Create(Form) do begin
Parent := Form;
Caption := 'OK';
ModalResult := mrOk;
Default := True;
SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
ButtonHeight);
end;
with TButton.Create(Form) do begin
Parent := Form;
Caption := 'Cancelar';
ModalResult := mrCancel;
Cancel := True;
SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
ButtonWidth, ButtonHeight);
Form.ClientHeight := Top + Height + 13;
end;
if ShowModal = mrOk then
If Edit.Text= Value Then
Result := True;
finally
Form.Free;
end; end;

procedure ExecutaSQL(Alias, Comando:String);
var Query:TQuery;
begin
Query:=TQuery.Create(nil);
With Query do Begin
DataBaseName:=Alias;
SQl.Add(Comando);
ExecSql;
Close;
Free;
end; end;

function AliasPath( sAlias : String) : String;
var   oAliasProp : TStringList; sDir : String; Session1:TSession;
begin
oAliasProp := TStringList.Create;
Session1:=TSession.Create(Application);
try
Screen.Cursor:=-11;
Session.GetAliasParams( sAlias, oAliasProp );
sDir := oAliasProp.Strings[0];
if pos('PATH',sdir) <> 0 then System.Delete(sdir,1,5) else sdir := '';
Result := sDir + '\' ;
finally
oAliasProp.Free;
Session1.free;
Screen.Cursor:=0;
end; end;

function TabelaTravada(Tabela: TTable): Boolean;
var Travada:Bool; hcur:hDBICur; Rslt:DBIResult;
begin
Tabela.UpdateCursorPos;
Check(DBiIsRecordLocked(Tabela.Handle,Travada));
Result:=Travada;
If Result=False Then Begin
   Check(DbiCloneCursor(Tabela.Handle,False,False,hcur));
   Try
   rslt:=DbiGetRecord(hCur,dbiWRITELOCK,nil,nil);
If Rslt<> DBIERR_NONE Then Begin
If hibyte(rslt)=ERRCAT_LOCKCONFLICT Then Result:=True
else
check(Rslt);
end else
Check(dbiRelRecordLock(hcur,FAlse));
Finally
Check(dbiCloseCursor(hcur));
end; end; end;

function TamanhodoArquivo(const Arquivo: String): LongInt;
var  SearchRec : TSearchRec;
begin { !Win32! -> GetFileSize }
If FindFirst(Arquivo,faAnyFile,SearchRec)=0 then Result:=SearchRec.Size
  else Result:=0;
FindClose(SearchRec);
end;

function PegaDatadoArquivo(Arquivo: string): string;
var FHandle: integer;
begin
FHandle := FileOpen(Arquivo, 0);
result := DateToStr((FileDateToDateTime(FileGetDate(FHandle))));
FileClose(FHandle);
end;

function DatadoArquivo(Arquivo: String): String;
var FHandle: integer;
begin
If not fileexists(Arquivo) then Result := 'Nome de Arquivo Inválido' else
  begin
  FHandle := FileOpen(Arquivo, 0);
  try
  Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
  FileClose(FHandle);
  end; end; end;

Procedure DeletaArquivosdoTipo(vMasc:String);
Var Dir : TsearchRec; Erro: Integer;
Begin
  Erro := FindFirst(vMasc,faArchive,Dir);
  While Erro = 0 do Begin
  DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
  Erro := FindNext(Dir);
  End;
  FindClose(Dir);
End;

function Arquivos(Const AMask: string): TStringList;
var  SearchRec : TSearchRec; intControl : integer;
begin
  Result := TStringList.create;
  intControl := FindFirst( AMask, faAnyFile, SearchRec );
If intControl = 0 then begin
  while (intControl = 0) do begin
  Result.Add( SearchRec.Name );
  intControl := FindNext( SearchRec );
  end;
  FindClose( SearchRec );
  end;
end;

Function Lixeira(sFileName : string ) : boolean;
var fos : TSHFileOpStruct;
Begin
FillChar( fos, SizeOf( fos ), 0 );
With fos do  begin
wFunc := FO_DELETE;
pFrom := PChar( sFileName );
fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
end;
Result := (0 = ShFileOperation(fos));
end;

function NumLinhasArq(Arqtexto:String): integer;
Var f: Textfile; cont:integer;
Begin
cont := 0;
AssignFile(f,Arqtexto);
Reset(f);
While not eof(f) Do begin
ReadLn(f);
Cont := Cont + 1;
end;
Closefile(f);
result := cont;
end;

function CopiaArquivo(source,dest: String): Boolean;
var fSrc,fDst,len: Integer; size: Longint; buffer: packed array [0..2047] of Byte;
begin
result:=False;
If source <> dest then begin
   fSrc := FileOpen(source,fmOpenRead);
If fSrc >= 0 then begin
  size := FileSeek(fSrc,0,2);
  FileSeek(fSrc,0,0);
  fDst := FileCreate(dest);
If fDst >= 0 then begin
while size > 0 do begin
len := FileRead(fSrc,buffer,sizeof(buffer));
FileWrite(fDst,buffer,len);
size := size - len;
end;
FileSetDate(fDst,FileGetDate(fSrc));
FileClose(fDst);
FileSetAttr(dest,FileGetAttr(source));
Result := True;
end else begin
Result := False;
end;
FileClose(fSrc);
end; end; end;


Procedure CopiaArquivoII( Const origem, destino: String );
Var  S, T: TFileStream;
Begin
S := TFileStream.Create( origem, fmOpenRead );
try
T := TFileStream.Create( destino, fmOpenWrite or fmCreate );
try
T.CopyFrom(S, S.Size ) ;
finally
T.Free;
end;
finally
S.Free;
end; end;

function NomedoArquivo(const Arquivo: String): String;
var aExt : String; aPos : Integer;
begin
aExt := ExtractFileExt(Arquivo);
Result := ExtractFileName(Arquivo);
If aExt <> '' then begin
  aPos := Pos(aExt,Result);
If aPos > 0 then begin
  Delete(Result,aPos,Length(aExt));
end; end; end;


function TipodoArquivo(const Arquivo: String): String;
var aInfo: TSHFileInfo;
begin
If SHGetFileInfo(PChar(Arquivo),0,aInfo,Sizeof(aInfo),SHGFI_TYPENAME)<>0 then
Result := StrPas(aInfo.szTypeName)
else begin
Result := ExtractFileExt(Arquivo);
Delete(Result,1,1);
Result := Result +' Arquivo';
end;  end;
 
 
function PrintImage(Origem: String):Boolean;
var Imagem: TBitmap;
begin
If fileExists(Origem) then begin
  Imagem := TBitmap.Create;
  Imagem.LoadFromFile(Origem);
  with Printer do  begin
  BeginDoc;
  Canvas.Draw((PageWidth - Imagem.Width) div 2,(PageHeight - Imagem.Height) div 2,Imagem);
  EndDoc;
  end;
  Imagem.Free;
  Result := True;
  end  else begin
  Result := False;
end; end;

function NumerodoDrive(const Drive: Char): byte;   { Uso: X := NumerodoDrive('C') }
begin
If Drive = #0 then Result := 0
else
Result := Ord(UpCase(Drive)) - 64;
end;
 
function DriveExiste(const Drive: Char): boolean;  { Uso: If DriveExiste('A') then ... }
begin
Result := Pos(UpCase(Drive), LetrasdosDrives) > 0;
end;
 
function DriveOk(const Drive: Char): boolean; { Uso: If DriveOk('A') then ... }
begin
Result := SysUtils.DiskSize(NumerodoDrive(Drive)) >= 0;
end;

function LetrasdosDrives: string;  { Uso: S := LetrasdosDrivers; - retorna 'A - C - D' se existir as unidades A:, C: e D: }
var Drives: LongWord; I: byte;
begin
Result := '';
Drives := GetLogicalDrives;
If Drives <> 0 then
for I := 65 to 90 do
If ((Drives shl (31 - (I - 65))) shr 31) = 1 then
Result :=Result + Char(I)+' - ';
end;

function tipododrive(const Drive: Char; Path: PChar): integer;
begin
If Path = nil then Path := PChar(Drive + ':\');
Case Windows.GetDriveType(PChar(Path)) of
              0: Result := 0;   //Unknown;
              1: Result := 1;   //NotExist;
DRIVE_REMOVABLE: Result := 2;   //Removable;
	 DRIVE_FIXED: Result := 3;   //Fixed;
   DRIVE_REMOTE: Result := 4;   //Remote;
    DRIVE_CDROM: Result := 5;   //CdRom;
  DRIVE_RAMDISK: Result := 6;   //RamDisk;
else
                 Result := -1;  //erro...
end; end;

function NomedoDrive(const Drive: Char; Path: PChar): string;  { Uso: S := tbVolName('A', nil); ou  S := tbVolName(#0, '\\computador\c\'); }
var  MaxCompLen, FileSysFlag, PrevErrorMode: Cardinal;
begin
If Path = nil then Path := PChar(Drive + ':\');
SetLength(Result, 255);
PrevErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
try
If GetVolumeInformation( PChar(Path), PChar(Result), 255,nil, MaxCompLen, FileSysFlag, nil, 0) then
Result := string(PChar(Result))
else
Result := '';
finally
SetErrorMode(PrevErrorMode);
end; end;

function SerialdoDrive(const Drive: Char; Path: PChar): Cardinal; { Uso: S := tbVolSerial('A', nil); ou S := tbVolSerial(#0, '\\computador\c\'); }
var MaxCompLen, FileSysFlag, PrevErrorMode: Cardinal;
begin
If Path = nil then Path := PChar(Drive + ':\');
PrevErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
try
If not GetVolumeInformation(PChar(Path), nil, 0,@Result, MaxCompLen, FileSysFlag, nil, 0) then
Result := 0;
finally
SetErrorMode(PrevErrorMode);
end; end;

function DriveInfo(const Drive: Char; Path: PChar): TtbVolInfo; { Uso: Info := tbVolInfo('A', nil); ou Info := tbVolInfo(#0, '\\computador\c\'); }
const cVolNameLen = 255; cSysNameLen = 255;
var Flags, PrevErrorMode: Cardinal;
begin
If Path = nil then Path := PChar(Drive + ':\');

SetLength(Result.Name, cVolNameLen);
SetLength(Result.FileSysName, cSysNameLen);

PrevErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
try
If GetVolumeInformation(Path, PChar(Result.Name), cVolNameLen,@Result.Serial, Result.MaxCompLen, Flags,PChar(Result.FileSysName), cSysNameLen) then
begin
Result.Name := string(PChar(Result.Name));
Result.FileSysName := string(PChar(Result.FileSysName));
Result.IsCompressed := (Flags and FS_VOL_IS_COMPRESSED) > 0;
end else begin
Result.Name := '';
Result.Serial := 0;
Result.IsCompressed := false;
Result.MaxCompLen := 0;
Result.FileSysName := '';
end;
finally
SetErrorMode(PrevErrorMode);
end; end;

function DirWindows: string;
var MeuBuffer: Array [1..128] of Char; retorno: Integer;
Begin
retorno:=GetWindowsDirectory(@MeuBuffer[1],128);
if (retorno>128) OR (retorno=0) then result:=''
else
Result:=StrPas(@MeuBuffer[1]);
End;

function DirWindowsSystem: string;
var MeuBuffer: Array [1..128] of Char; retorno: Integer;
Begin
retorno:=GetSystemDirectory(@MeuBuffer[1],128);
if (retorno>128) OR (retorno=0) then result:=''
else
Result:=StrPas(@MeuBuffer[1]);
End;

Procedure ApagaArquivos(Caminho, Nome_do_Arquivo:string; AvisaSeTerminou:Boolean);
var SR: TSearchRec; I: integer;
begin
I := FindFirst(Caminho+Nome_do_Arquivo, faAnyFile, SR);
  while I = 0 do begin
  if (SR.Attr and faDirectory) <> faDirectory then
  if not DeleteFile(Caminho + SR.Name) then
  If AvisaSeTerminou then
  ShowMessage('Apagar arquivos - Exclusao falhou'+Caminho+ SR.Name);
  I := FindNext(SR);
end;
If AvisaSeTerminou then showMessage('Apagar arquivos - Operação concluída');
end;

Procedure ChecaUF(sender:TObject);
const Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var Posicao : integer;  Sigla : string;
begin
With sender as TCustomEdit do begin
Sigla:=text;
if Sigla <> '' then begin
  Posicao := Pos(UpperCase(Sigla),Estados);
if (Posicao = 0) or ((Posicao mod 2) = 0) then Begin
  ShowMessage('Sigla incorreta');
  SetFocus;
end; end; end; end;

Function TemSom(Value:integer): Boolean;
begin
if WaveOutGetNumDevs > 0 then result := True
else
Result := False;
end;

function Idade(Data1,Data2:TDate):string;
var Ano2,Ano1,Mes2,Mes1,Dia2,Dia1,Anos,Meses:word;  s,ss:string;
begin
If data1=0 then result:='Idade não informada.' else begin
DecodeDate(Data2,ano2,mes2,dia2);
DecodeDate(Data1,ano1,mes1,dia1);
If Dia2 >1 then
If Mes2 > 1 then dec(Mes2)
   else begin
   Mes2:=12;
   Dec(Ano2);
   end;
If Mes2 < mes1 then begin
   Dec(ano2);
   inc(mes2,12);
   end;
If ano2<ano1 then ano2:=ano1;
   anos:=ano2-ano1;
   meses:=Mes2-mes1+1;
If meses=12 then begin
   Meses:=0;
If YearOf(Data2)> YearOf(data1) then inc(anos);
   end;
   s:='meses'; ss:='anos';
	If meses = 1 then s:='mês';
   If anos=1 then ss:='ano';
If anos = 0 then result := format('%.2d '+s,[meses]) else
If meses=0 Then result := format('%.2d '+ss,[anos]) else
If(meses>0)and(anos>0) then result := format('%.2d '+ss+' e %.2d '+s,[Anos,meses]);
If(meses=0)and(anos=0) then begin
   meses:=dia2-dia1;
If meses < 2 then  result := format('%.2d dia',[meses]) else
  result := format('%.2d dias',[meses]);
end; end; end;

function DiscoNoDrive(const drive : char): boolean;
var DriveNumero : byte; EMode : word;
begin
result := false;
Emode:=0;
DriveNumero := ord(Drive);
if DriveNumero >= ord('a') then begin
  dec(DriveNumero,$20);
  EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  end;
  try
if DiskSize(DriveNumero-$40) = -1 then Result := False
  else
  Result := True;
  Except
  SetErrorMode(EMode);
end; end;

function NumeroDeCores : Integer;
var DC:HDC; BitsPorPixel: Integer;
begin
Dc := GetDc(0); // 0 = vídeo
BitsPorPixel := GetDeviceCaps(Dc,BitsPixel);
Result := 2 shl (BitsPorPixel - 1);
end;

function Percentdisk(unidade: byte): Integer;
var
A,B, Percentual : longint;
begin
if DiskFree(Unidade)<> -1 then
  begin
  A := DiskFree(Unidade) div 1024;
  B := DiskSize(Unidade) div 1024;
  Percentual:=(A*100) div B;
  result := Percentual;
  end
else
  begin
  result := -1;
  end;
end;

function IsPrinter : Boolean;
Const PrnStInt : Byte = $17; StRq : Byte = $02; PrnNum : Word = 0; { 0 para LPT1, 1 para LPT2, etc. }
Var nResult : byte;
Begin
Asm
mov ah,StRq;
mov dx,PrnNum;
Int $17;
mov nResult,ah;
end;
IsPrinter := (nResult and $80) = $80;
End;

function ImpressoraPadrao :String;
var Device : array[0..255] of char; Driver : array[0..255] of char; Port : array[0..255] of char; hDMode : THandle;
begin
Printer.GetPrinter(Device, Driver, Port, hDMode);
Result := Device;//+' na porta '+Port;
//ShowMessage(result);
end;

procedure MouseClick(const Duration: Word);
var Win: HWnd; Pt: TPoint; Msg: TMsg; FlagMouseDown, FlagMouseUp: DWord;
begin
  { Se os botões estiverem invertidos... }
if MouseSwappedButtons then begin
	FlagMouseDown := MOUSEEVENTF_RIGHTDOWN;
   FlagMouseUp := MOUSEEVENTF_RIGHTUP;
end else begin; { Se os botões estiverem normais... }
   FlagMouseDown := MOUSEEVENTF_LEFTDOWN;
   FlagMouseUp := MOUSEEVENTF_LEFTUP;
end;
{ Obtém o handle da janela que está sob o cursor }
Windows.GetCursorPos(Pt);
Win := Windows.WindowFromPoint(Pt);
  { Inicia o click }
mouse_event(FlagMouseDown, 0, 0, 0, 0);

  { Processa as mensagens do mouse pertencentes à janela sob o cursor }
while PeekMessage(Msg, Win, WM_LBUTTONDOWN, WM_LBUTTONDOWN, PM_REMOVE) do DispatchMessage(Msg);
Sleep(Duration);
{ Conclui o click }
mouse_event(FlagMouseUp, 0, 0, 0, 0);
end;

function MouseClip(const Rct: TRect): boolean;
begin
Result := Windows.ClipCursor(@Rct);
end;

function MouseGetButtons: byte;
begin
Result := GetSystemMetrics(SM_CMOUSEBUTTONS);
end;

function MouseGetPos(var Pt: TPoint): boolean;
begin
Result := Windows.GetCursorPos(Pt);
end;

function MouseInWindow(const WinHandle: HWnd): boolean;
var Pt: TPoint;
begin
Result := GetCursorPos(Pt) and (WindowFromPoint(Pt) = WinHandle);
end;

function MouseIsPresent: boolean;
begin
Result := GetSystemMetrics(SM_MOUSEPRESENT) <> 0;
end;

function MouseMoveToControl(const Control: TControl): boolean;
var Pt: TPoint;
begin
  Pt.x := Control.Width div 2;
  Pt.y := Control.Height div 2;
  Pt := Control.ClientToScreen(Pt);
  Result := SetCursorPos(Pt.X, Pt.Y);
end;

function MouseSetPos(const Pt: TPoint): boolean;
begin
  Result := Windows.SetCursorPos(Pt.X, Pt.Y);
end;

function MouseShowCursor(const Show: boolean): boolean;
var I: integer;
begin
I := ShowCursor(LongBool(true));
if Show then begin
  { ShowCursor(true) incrementa um contador interno do Windows.
  Quando este contador ficar > = 0, então o cursor é exibido }
  Result := I >= 0;
  while I < 0 do begin
  Result := ShowCursor(LongBool(true)) >= 0;
  Inc(I);
  end;
  end else begin
  { ShowCursor(false) decrementa um contador interno do Windows.
  Quando este contador ficar < 0, então o cursor é ocultado }
  Result := I < 0;
  while I >= 0 do begin
  Result := ShowCursor(LongBool(false)) < 0;
  Dec(I);
end; end; end;

function MouseSlideToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
var ToPoint, Pt: TPoint;
function ExecJump: boolean;
begin
if (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y) then begin
Result := false; { Chegou }
Exit;
end;
{ Calcula X }
if Pt.x < ToPoint.x then begin
Inc(Pt.x, Jump);
if Pt.x > ToPoint.x then { Se passou... }
Pt.x := ToPoint.x;
end else if Pt.x > ToPoint.x then begin
Dec(Pt.x, Jump);
if Pt.x < ToPoint.x then
Pt.x := ToPoint.x;
end;
{ Calcula Y }
if Pt.y < ToPoint.y then begin
Inc(Pt.y, Jump);
if Pt.y > ToPoint.y then { Se passou... }
Pt.y := ToPoint.y;
end else if Pt.y > ToPoint.y then begin
Dec(Pt.y, Jump);
if Pt.y < ToPoint.y then
Pt.y := ToPoint.y;
end;
Result := SetCursorPos(Pt.x, Pt.y);
end;

begin
if Jump = 0 then
Jump := 1;

SetCursor(Screen.Cursors[Control.Cursor]);
with Control do begin
ToPoint.x := Width div 2;
ToPoint.y := Height div 2;
ToPoint := ClientToScreen(ToPoint);
end;
if GetCursorPos(Pt) then
while ExecJump do Sleep(JumpTime);

Result := GetCursorPos(Pt) and
(Pt.x = ToPoint.x) and (Pt.y = ToPoint.y);
end;

function MouseSwapButtons(const Swap: boolean): boolean;
begin
  Result := Windows.SwapMouseButton(LongBool(Swap));
end;
 
function MouseSwappedButtons: boolean;
begin
  Result := GetSystemMetrics(SM_SWAPBUTTON) <> 0;
end;

function MouseUnClip: boolean;
begin
  Result := Windows.ClipCursor(nil);
end;

function NaRede: Boolean;
begin
If GetSystemMetrics(SM_NETWORK)and $01=1 Then Result:=True else Result:=False;
end;

function SysComputerName: string;
var I: DWord;
begin
I := MAX_COMPUTERNAME_LENGTH + 1;
SetLength(Result, I);
Windows.GetComputerName(PChar(Result), I);
Result := string(PChar(Result));
end;

function SysPlatform: DWord;
var Ver: _OSVERSIONINFOA;
begin
if SysVersion(Ver) then
Result := Ver.dwPlatformId
else
Result := 0;
end;

function SysSetComputerName(const S: string): boolean;
begin
Result := Windows.SetComputerName(PChar(S));
end;

function SysTempDir: string;
begin
SetLength(Result, MAX_PATH);
if GetTempPath(MAX_PATH, PChar(Result)) > 0 then
Result := string(PChar(Result))
else
Result := '';
end;

function SysUserName: string;
var I: DWord;
begin
I := 255;
SetLength(Result, I);
Windows.GetUserName(PChar(Result), I);
Result := string(PChar(Result));
end;

function SysVersion(var Ver: _OSVERSIONINFOA): boolean;
begin
Ver.dwOSVersionInfoSize := SizeOf(Ver);
Result := GetVersionEx(Ver);
end;

function SysVersionStr: string;
var Ver: _OSVERSIONINFOA;
begin
if SysVersion(Ver) then
Result := IntToStr(Ver.dwMajorVersion) + '.' +IntToStr(Ver.dwMinorVersion)
else
Result := '';
end;

procedure WndProcessMessages(const Wnd: HWnd);
begin
WndProcessMessagesEx(Wnd, 0, 0);
end;

procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal);
var
Msg: tagMsg;
begin
while PeekMessage(Msg, Wnd, FromMsg, ToMsg, PM_REMOVE) do
DispatchMessage(Msg);
end;

function tbGetShortStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := S
  else
  Result := Copy(S, 1, I - 1);
end;
 
function tbGetLongStr(const S: string; const Sep: Char): string;
var
  I: Integer;
begin
  I := AnsiPos(Sep, S);
  if I = 0 then
  Result := ''
  else
  Result := Copy(S, I + 1, High(integer));
end;
 
function tbPadC(const S: string; const Len: integer; const Ch: Char): string;
var
  I, J: integer;
  Pad: string;
  Impar: boolean;
begin
  I := Length(S);
  if I < Len then begin
  J := Len - I;
  Impar := J mod 2 = 1;
  J := J div 2;
  Pad := tbReplChar(Ch, J);
  Result := Pad + S + Pad;
  if Impar then
  Result := Result + Ch;
  end else if I > Len then begin
  J := I - Len;
  Impar := J mod 2 = 1;
  J := J div 2;
  Result := S;
  Delete(Result, I-J+1, J);
  Delete(Result, 1, J);
  if Impar then begin
  Dec(I, J * 2);
  Delete(Result, I, 1);
  end;
  end else
  Result := S;
end;
 
function tbPadL(const S: string; const Len: integer; const Ch: Char): string;
var
  LenS: integer;
begin
  LenS := Length(S);
  if LenS < Len then
  Result := tbReplChar(Ch, Len - LenS) + S
  else if LenS > Len then
  Result := Copy(S, LenS-Len+1, Len)
  else
  Result := S;
end;
 
function tbPadR(const S: string; const Len: integer; const Ch: Char): string;
var
  LenS: integer;
begin
  LenS := Length(S);
  if LenS < Len then
  Result := S + tbReplChar(Ch, Len - LenS)
  else if LenS > Len then
  Result := Copy(S, 1, Len)
  else
  Result := S;
end;
 
function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;
 
function tbReplStr(const S: string; const Len: integer): string;
begin
  Result := '';
  while Length(Result) < Len do
  Result := Result + S;
  Result := Copy(Result, 1, Len);
end;

function tbSpace(const Len: integer): string;
begin
  Result := tbReplChar(#32, Len);
end;
 
function tbStrZero(const Value, Len: integer): string;
var
  I: integer;
begin
  Result := IntToStr(Value);
  I := Length(Result);
  if I < Len then
  Result := tbReplChar('0', Len-I) + Result
  else if I > Len then
  Result := tbReplChar('*', Len);
end;

function ArredondaFloat(x : Real): Real;
Begin
  if x > 0 Then
  begin
  if Frac(x) > 0.5 Then
  begin
  x := x + 1 - Frac(x);
  end
  else
  begin
  x := x - Frac(x);
  end;
  end
  else
  begin
  x := x - Frac(x);
  end;
  result := x
end;
 
 
function RoundNum(Valor:Extended;Decimais:Integer):Extended;
{Quando houver,Arredonda uma possivel terceira casa decimal em uma variável}
var
  I:Integer;
  Multiplicador:Integer;
begin
  if Decimais > 15 then
  begin
  Decimais := 15;
  end
  else if Decimais < 0 then
  begin
  Decimais := 0;
  end;
  Multiplicador := 1;
  for I:=1 to Decimais do
  begin
  Multiplicador := Multiplicador*10;
  end;
Result := round(Valor*Multiplicador)/Multiplicador;
end;

function VoltaPercentual(valor:real;Percent:Real; Soma:boolean):real;
// Retorna a porcentagem de um valor
begin
If percent=0 then Begin
   result:=valor;
   Exit;
   end else
percent:=(Valor*Percent)/100;
If Soma Then result := valor+Percent else result := valor-Percent;
end;


function Gerapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
begin
percent := percent / 100;
try
  valor := valor * Percent;
finally
  result := valor;
end; end;
 
// Integer
function IntToBin(Value: LongInt;Size: Integer): String;
{Converte uma string em binário}
var
  i: Integer;
begin
Result:='';
for i:=Size downto 0 do
  begin
  if Value and (1 shl i)<>0 then
  begin
  Result:=Result+'1';
  end
  else
  begin
  Result:=Result+'0';
  end;
  end;
end;
 

function BinToInt(Value: String): LongInt;
{Converte um numero binário em Inteiro}
var
i,Size: Integer;
begin
Result := 0;
Size := Length(Value);
for i:=Size downto 0 do
  begin
  if Copy(Value,i,1)='1' then
  begin
  Result := Result+(1 shl i);
  end;
  end;
end;

 
function DecToBase( Decimal: LongInt; const Base: Byte): String;
{converte um número decimal na base especificada}
const
  Symbols: String[16] = '0123456789ABCDEF';
var
  scratch: String;
  remainder: Byte;
begin
  scratch := '';
  repeat
  remainder := Decimal mod Base;
  scratch := Symbols[remainder + 1] + scratch;
  Decimal := Decimal div Base;
  until ( Decimal = 0 );
  Result := scratch;
end;
 
function Base10(Base2:Integer):Integer; assembler;
{Converte uma string em Base 10}
asm
  cmp eax,100000000 // check upper limit
  jb @1 // ok
  mov eax,-1 // error flag
  jmp @exit // exit with -1
@1:
  push ebx // save registers
  push esi
  xor esi,esi // result = 0
  mov ebx,10 // diveder base 10
  mov ecx,8 // 8 nibbles (10^8-1)
@2:
  mov edx,0 // clear remainder
  div ebx // eax DIV 10, edx mod 10
  add esi,edx // result = result + remainder[I]
  ror esi,4 // shift nibble
  loop @2 // loop for all 8 nibbles
  mov eax,esi // function result
  pop esi // restore registers
  pop ebx
@exit:
end;
 
 
function DecToBinStr(n: integer): string;
{Converte um numero decimal em binário}
var S: string; i: integer; Negative: boolean;
begin
negative:=false;
if n < 0 then
  begin
  Negative := true;
  end;
n := Abs(n);
for i := 1 to SizeOf(n) * 8 do
  begin
  if n < 0 then
  begin
  S := S + '1';
  end
  else
  begin
  S := S + '0';
  end;
  n := n shl 1;
  end;
Delete(S,1,Pos('1',S) - 1);//remove leading zeros
if Negative then
  begin
  S := '-' + S;
  end;
Result := S;
end;

 
function DecToRoman( Decimal: LongInt ): String;
{Converte um numero decimal em algarismos romanos}
const
Romans: Array[1..13] of String = ( 'I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M' );
Arabics: Array[1..13] of Integer =( 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
var
i: Integer;
scratch: String;
begin
  scratch := '';
  for i := 13 downto 1 do
  while ( Decimal >= Arabics[i] ) do
  begin
  Decimal := Decimal - Arabics[i];
  scratch := scratch + Romans[i];
  end;
  Result := scratch;
end;
 
 
function NumToHex(Num: Word): String;
//Converte um numero em Hexadecimal
Var
L : string[16];
BHi,BLo : byte;
Begin
L := '0123456789ABCDEF';
BHi := Hi(Num);
BLo := Lo(Num);
result := copy(L,succ(BHi shr 4),1) +
  copy(L,succ(BHi and 15),1) +
  copy(L,succ(BLo shr 4),1) +
  copy(L,succ(BLo and 15),1);
end;
 

function Min(A, B: Integer): Integer;
{Compara dois valores Retornando o maior deles}
begin
  if A < B then
  Result := A
  else
  Result := B;
end;
 
 
function Max(A, B: Integer): Integer;
{Compara dois valores Retornando o maior deles}
begin
  if A > B then
  Result := A
  else
  Result := B;
end;
 

function IntPrime(Value: Integer): Boolean;
{Testa se um numero é primo ou não}
var
i : integer;
begin
Result := False;
Value := Abs(Value);
if Value mod 2 <> 0 then
  begin
  i := 1;
  repeat
  i := i + 2;
  Result:= Value mod i = 0
  until Result or ( i > Trunc(sqrt(Value)) );
  Result:= not Result;
  end;
end;
 
function strByteSize(Value: Longint): String;
{Retorna uma conversão de Bytes para integer}
Const
KBYTE = Sizeof(Byte) shl 10;
MBYTE = KBYTE shl 10;
GBYTE = MBYTE shl 10;
begin
  if Value > GBYTE then
  begin
  Result := FloatToStrF(Round(Value / GBYTE),ffNumber,6,0)+' GB';
  end
  else if Value > MBYTE then
  begin
  Result := FloatToStrF(Round(Value / MBYTE),ffNumber,6,0)+' MB';
  end
  else if Value > KBYTE then
  begin
  Result := FloatToStrF(Round(Value / KBYTE),ffNumber,6,0)+' KB';
  end
  else
  begin
  Result := FloatToStrF(Round(Value),ffNumber,6,0)+' Byte';
  end;
end;
 
// Strings
Function StrToReal(inString :String): Real;
{converte um número em Float}
Var
  i : Real;
  k : Integer;
Begin
  Val(inString,i,k);
  StrToReal := i;
End;
 
function BuscaDireita(Busca,Text : string) : integer;
{Pesquisa um caractere à direita da string,
 retornando sua posição}
var n,retorno : integer;
begin
retorno := 0;
for n := length(Text) downto 1 do
  begin
  if Copy(Text,n,1) = Busca then
  begin
  retorno := n;
  break;
  end;
  end;
Result := retorno;
end;
 
function BuscaTroca(Text,Busca,Troca : string) : string;
{ Substitui um caractere dentro da string}
var n : integer;
begin
for n := 1 to length(Text) do
  begin
  if Copy(Text,n,1) = Busca then
  begin
  Delete(Text,n,1);
  Insert(Troca,Text,n);
  end;
  end;
Result := Text;
end;

function Troca(s,oldPalavra, newPalavra:string):string;
var i:integer;
begin
i:= pos(oldPalavra,s);
If i<>0 then begin
Delete(s,i,length(oldPalavra));
insert(newPalavra,s,i);
result:=s;
end; end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr(Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;
 

function ContaCaracs(Edit:String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
Result := Length(Edit);
end;
 
 
function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;
 
 
function LTrim(Texto:String):String;
{Remove os Espaços em branco à direita da string}
var
  I : Integer;
begin
  I := 0;
  while True do
  begin
  inc(I);
  if I > length(Texto) then
  break;
  if Texto[I] <> #32 then
  break;
  end;
  Result := Copy(Texto,I,length(Texto));
end;

 
function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para 
maiuscula e as restantes para minuscula}
begin
if Texto <> '' then begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

function Padr(s:string;n:integer):string;
{alinha uma string à direita}
begin
Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;
 
 
function RemoveAcentos(Str:String): String;
{Remove caracteres acentuados de uma string}
Const ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜŽµ';
		SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUAUAA';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
  Begin
  if Pos(Str[x],ComAcento)<>0 Then
  begin
  Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  end;
  end;
Result := Str;
end;
 
 
function Replicate( Caracter:String; Quant:Integer ): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;
 

function RTrim(Texto:String):String;
{Remove os Espaços em branco à direita da string}
var
  I : Integer;
begin
  I := length(Texto)+1;
  while True do
  begin
  Dec(I);
  if I <= 0 then
  break;
  if Texto[I] <> #32 then
  break;
  end;
  Result := Copy(Texto,1,I);
end;


function StringToFloat(s : string) : Extended;
{ Filtra uma string qualquer, convertendo as suas partes
  numéricas para sua representação decimal, por exemplo:
  'R$ 1.200,00' para 1200,00 '1AB34TZ' para 134}
var
  i :Integer;
  t : string;
  SeenDecimal,SeenSgn : Boolean;
begin
  t := '';
  SeenDecimal := False;
  SeenSgn := False;
  {Percorre os caracteres da string:}
  for i := Length(s) downto 0 do
  {Filtra a string, aceitando somente números e separador decimal:}
  if (s[i] in ['0'..'9', '-','+',DecimalSeparator]) then
  begin
  if (s[i] = DecimalSeparator) and (not SeenDecimal) then
  begin
  t := s[i] + t;
  SeenDecimal := True;
  end
  else if (s[i] in ['+','-']) and (not SeenSgn) and (i = 1) then
  begin
  t := s[i] + t;
  SeenSgn := True;
  end
  else if s[i] in ['0'..'9'] then
  begin
  t := s[i] + t;
  end;
  end;
  Result := StrToFloat(t);
  end;
 
 
Function Strs(I:longint):string ;
{Converte uma variavel numérica em string}
Var
 X : string[16] ;
begin
  STR (I,X) ;
  Strs := X ;
end ;
 
 
function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var Ring: array[TRingIndex] of PChar; RingIndex: TRingIndex; Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;
 
 
function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
end;
 
 
function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;
 
 
function StrZerodec(Numero: Double; Total, Decimal: integer): string;
{Insere Zeros e decimais à frente de uma string}
var
 TempStr: string;
begin
 Str(Numero:0:Decimal,TempStr);
 while length(TempStr) < Total do
  begin 
  Insert('0',TempStr,1);
  end;
Result := TempStr;
 
end;
 
 
 
function Padl(s:string;n:integer):string; // Alinhamento pela esquerda
{alinha uma string à esquerda}
begin
  Result:=Format('%-'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;
 
 
Function wordcount(str : string) : integer;
// Retorna o número de palavras que contem em uma string
var
count : integer;
i : integer;
len : integer;
begin
len := length(str);
count := 0;
i := 1;
while i <= len do
  begin
  while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
  inc(i);
  if i <= len then
  inc(count);
  while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
  inc(i);
  end;
  wordcount := count;
end;
 
 
function LineIsEmpty(Text:string):boolean;
// Testa se uma linha de texto está vazia ou não
var
  i:byte;
begin
for i:=1 to length(Text) do
  begin
  if Text[i]<>' ' then
  begin
  result := False;
  exit;
  end;
  end;
Result := True;
end;
 
 
function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espaço determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
  begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do
  begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do
  begin
  str := str+s[L];
  end;
 Result := str;
end;
 
 
function FullFill(Str:String;FLen:byte;symb:char):string;
// Preenche o restante da string com um caractere especificado
var
 S:String;
 i:byte;
begin
s:=Str;
if Length(s) >= FLen then
  begin
  Result := s;
  Exit;
  end;
for i := Length(s) to FLen do
  begin
  S := S + symb;
  end;
Result := s;
end;
 
 
function Before(const Search, Find: string): string;
{Retorna uma cadeia de caracteres antecedentes a uma parte da string selecionada}
const
  BlackSpace = [#33..#126];
var
  index: byte;
begin
  index:=Pos(Find, Search);
  if index = 0 then
  Result:=Search
  else
  Result:=Copy(Search, 1, index - 1);
end;
 
 
function after(const Search, Find: string): string;
{Retorna uma cadeia de caracteres após a parte da string selecionada}
var
index: byte;
begin
index := Pos(Find, Search);
if index = 0 then
  begin
  Result := '';
  end
else
  begin
  Result := Copy(Search, index + Length(Find), 255);
  end;
end;
 
 
function MaskString(Valor: String) : String;
begin
//Result := FormatMaskText('!aaaaaaaaaaaaaa;0; ',(FormatFloat('#,##0.00',StrToFloat(valor))));
end;
 
function Encrypt( Senha:String ): String;
{Encripta uma String}
Const
  Chave : String = 'Jesus';
Var
  x,y : Integer;
  NovaSenha : String;
begin
  for x := 1 to Length( Chave ) do begin
  NovaSenha := '';
  for y := 1 to Length( Senha ) do
  NovaSenha := NovaSenha + chr( (Ord(Chave[x]) xor Ord(Senha[y])));
  Senha := NovaSenha;
  end;
  result := Senha;
end;


function SeNumSeq(tabela: String; Dataset:TDataSet): Boolean;
begin
Dataset.Open;
If not Dataset.Locate('Tabela',tabela,[]) Then Begin
   Result:=FAlse;
   end else Result:=True;
end;

Function PegaChave(Campo,Tabela:String):Variant;
var query:TQuery;
begin
query:=TQuery.create(nil);
Query.DatabaseName:='est';
Query.SQL.Add('select max ('+Campo+')as '+Campo+' from '+  Tabela);
Query.Open;
If query.fieldByName(Campo).Value=null then Result:=1 else Result:= query.fieldByName(campo).Value+1;
Query.Close;
Query.Free;
end;

function VerificaAno: Boolean;
begin
Result := (Pos('yyyy',SHortDateFormat)>0);
If Result = FAlse then Begin
ShowMessage('Ajuste seu computador para o formato de data dd/mm/aaaa.');
Application.Terminate;
end; end;

function ExtensoMil(Numero : String) : String;
const
  Unidades : Array[1..19] of String = ('Um','Dois','Três','Quatro',
    'Cinco','Seis','Sete','Oito','Nove','Dez','Onze','Doze','Treze',
	 'Quatorze','Quinze','Dezesseis','Dezessete','Dezoito','Dezenove');
  Dezenas : Array[2..9] of String = ('Vinte','Trinta','Quarenta',
    'Cincoenta','Sessenta','Setenta','Oitenta','Noventa');
  Centenas : Array[0..9] of String = ('Cem','Cento','Duzentos','Trezentos',
    'Quatrocentos','Quinhentos','Seiscentos','Setecentos','Oitocentos',
    'Novecentos');
begin
//If Copy(numero,1,3)='100' Then Centenas[1]:='Cem' else Centenas[1]:='Cento';
Result:='';
If Copy(numero,1,3)='100' then Result := Centenas[0] else
If Numero[1] <> '0' then Result := Centenas[Ord(Numero[1])-Ord('0')];
If StrToInt(Copy(Numero,2,2)) > 0 then begin
If Result <> '' then Result := Result + ' e ';
If StrToInt(Copy(Numero,2,2)) <= 19 then Result := Result + Unidades[StrToInt(Copy(Numero,2,2))]
else begin
Result := Result + Dezenas[Ord(Numero[2])-Ord('0')];
If Numero[3] <> '0' then Result := Result + ' e ' + Unidades[Ord(Numero[3])-Ord('0')];
end; end; end;

function Extenso(Numero: String): String;
const
UnidSing : Array[0..5] of String = ('Centavo.','Real','Mil','Milhão','Bilhão','Trilhão');
UnidPlur : Array[0..5] of String = ('Centavos.','Reais','Mil','Milhões','Bilhões','Trilhões');
var
Lista : TStringList;  NumStr : String;  i : Integer;  JaLigou : Boolean;  Texto : String;  PosDec : Integer;
begin
Lista := TStringList.Create;
PosDec := Pos(DecimalSeparator,Numero);
If PosDec > 0 then begin
   Lista.Add('0'+Copy(Numero,PosDec+1,2));
   NumStr := Copy(Numero,1,PosDec-1);
   end else begin
   Lista.Add('000');
   NumStr := Numero;
	end;
while NumStr <> '' do If Length(NumStr) > 3 then begin
      Lista.Add(Copy(NumStr,Length(NumStr)-2,3));
      NumStr := Copy(NumStr,1,Length(NumStr)-3);
      end else begin
while Length(NumStr) < 3 do NumStr := '0'+NumStr;
      Lista.Add(NumStr);
      NumStr := '';
      end;
Result := '';
JaLigou := False;
For i := 0 to Lista.Count - 1 do begin
If Lista[i] <> '000' then begin
   Texto := ExtensoMil(Lista[i]);
If (Lista[i] <> '001') or ((i = 1) and (Lista.Count > 2)) then Texto := Texto + ' ' + UnidPlur[i] else Texto := Texto + ' ' + UnidSing[i];
If (i = 2) Then
If (Lista[1] = '000') then Texto := Texto + ' Reais' else
If (i > 2) Then
If (Lista[2] = '000') and (Lista[1] = '000') then Texto := Texto + ' de Reais';
If Result <> '' then begin
If JaLigou then Result := Texto + ', ' + Result else begin
   Result := Texto + ' e ' + Result;
   JaLigou := True;
	end;
   end else
   Result := Texto;
end; end; end;

procedure FormataTel(sender: TObject);
var a,b,s:string; i:integer;              //configura formato do nº telef...
begin
	If (sender is TEdit) or (sender is TDBEdit) Then
		With sender as tCustomEdit do
		Begin
			s:=tCustomEdit(sender).Text;
			s:=RTrim(s);
			If (Copy(s,1,1)='(') or (Copy(s,5,1)='-') Then Exit;
			If(s<>'')Then
			Begin
				i:= Length(s);              //se o campo não estiver vazio ou
				If not(i in[0,7..10])Then
					If (Copy(s,1,1)<>'(') then
					Begin         //            com tam. 9 ou 10 ...
						ShowMessage('Entrada incorreta');
						tCustomEdit(sender).Clear;
						tCustomEdit(sender).SetFocus;
						Exit;
					end;
				If i=7 Then
				Begin
					a:= s;
					Insert('-',a,4);
					tCustomEdit(sender).Text:=a;
					Exit;
				end;
				If i=8 then
				Begin
					a:= s;
					Insert('-',a,5);
					tCustomEdit(sender).Text:=a;
					Exit;
				end;
				a:=Copy((s),1,2);
				If i = 9 Then
				Begin
					b:= a + '-' + Copy((s),3,3)+ '-';
					a:=(s);
					Delete(a,1,5);
					tCustomEdit(sender).Text:='(0)' + b + a;
				end
				else
				If i = 10 Then
				Begin
					b:= a + '-' + Copy((s),3,4)+ '-';
					a:=(s);
					Delete(a,1,6);
					tCustomEdit(sender).Text:='(0)' + b + a;
				end;
			end;
		end;
end;

procedure FormataData(sender: TObject);
var s1,s2,p:String; i:integer;
begin
If(sender is TEdit)or(sender is TDBEdit)Then With sender as tCustomEdit do Begin
s1:=tCustomEdit(sender).Text;          //pega o texto do edit...
i:=Length(tCustomEdit(sender).Text);   //calcula o tamanho da string...
p:=Copy(s1,3,1);                   //verifica se o 3º caract é uma  barra...
If(p = '/')or(s1 = '') Then Exit;  //se tem barra ou está vazio, sai...
If i = 6 Then Begin                // se o ano foi digitado com 2 dig...
  s2:=Copy(s1,5,2);                // pega os digitos do ano...
If StrToFloat(s2)> 50 Then s2:='19'+s2 else s2:='20'+ s2; //se menor que 50 é 2000...
	Delete(s1,5,2);                 //retira os 2 dig...
   s1:=s1 + s2;                    //insere o ano com 4 dig...
   end;
insert('/',s1,3);
insert('/',s1,6);                  //insere as barras...
If Copy(s1,8,1)='' Then Begin     //verifica o ano não está como em "01/01/0"...
   ShowMessage(s1+' não é uma data válida');
   Delete(s1,3,1);              //retira as barras...
   Delete(s1,6,1);
   tCustomEdit(sender).Text:='';
   tCustomEdit(sender).SetFocus;
   Exit;
   end;
Try
StrToDate(s1);                     //verifica se é uma data válida...
tCustomEdit(sender).Text:=s1;          //se for repõe o texto no edit...
Except
ShowMessage(s1+' não é uma data válida');      //senão...
tCustomEdit(sender).Text:='';
tCustomEdit(sender).SetFocus;
end; end; end;

procedure FormataTxt(sender:TObject);
var s1,s2,s3:string; tam1,i:integer; b:boolean;
begin
If(sender is TEdit)or(sender is TDBEdit)Then With sender as tCustomEdit do Begin
s1:=TCustomEdit(sender).Text;
tam1:=Length(s1);
for i:= 0 to tam1 -1 Do Begin
s2:=Copy(s1,i,1);
If i = 0 Then begin
delete(s1,1,1);
s1:=ansiUpperCase(s2)+s1;
end;
If(s2=' ')Then Begin
s3:=Copy(s1,i+1,3);
If(s3='do ')or(s3='da ')or(s3='das')or(s3='e/o')or(s3='dos')or(s3='de ')or(Copy(s3,Length(s3)-1,1)=' ') Then B:=True else b:=False;
If b=false Then Begin
s3:=Copy(s1,i+1,1);
delete(s1,i+1,1);
s3:=AnsiUpperCase(s3);
insert(s3,s1,i+1);
end; end;
TCustomEdit(sender).Text:=s1;
end; end; end;





function DiasDoMes(const Mes, Ano: word): word;
const DiasPorMes: array[1..12] of Word =(31,28,31,30,31,30,31,31,30,31,30,31);
begin
If(IsLeapYear(Ano))and(Mes=2)Then Result := 29 else Result := DiasPorMes[Mes];
end;

Function Delphi() :Boolean;
var PClasse,PJanela : array[0..79] of char;
begin
StrPCopy(PClasse,'TPropertyInspector');
StrPCopy(PJanela,'Object Inspector');
if FindWindow(PClasse,PJAnela) <> 0 then
result := true
else
Result := false;
end;

procedure TravaCtrlAltDel(travar:Boolean);
var OldValue : LongBool;
begin
If Travar then
SystemParametersInfo(97, Word(True), @OldValue, 0) else
{desliga a trava}
SystemParametersInfo(97, Word(False), @OldValue, 0);
end;

procedure LimpaDataset(const DataSet: TDataSet);
begin
with DataSet do while RecordCount > 0 do Delete;
end;

Function CartaoValido(numero:string): Boolean;
Var Valor, Soma, Multiplicador, Tamanho, i : Integer; s:string;
begin
Result:=False;
s:=numero;
if trim(s)='' then Exit;
Multiplicador := 2;
Soma := 0; 
Tamanho := Length (AllTrim (S)); 
For i := 1 to Tamanho - 1 do 
begin
Valor := StrToIntDef (Copy (S, i, 1),0) * Multiplicador;
Soma := Soma + (Valor DIV 10) + (Valor mod 10); 
if Multiplicador = 1 Then 
Multiplicador := 2 
else 
Multiplicador := 1; 
end; 
if IntToStr ((10 - (Soma mod 10)) mod 10) = Copy (S, Tamanho, 1) Then 
Result := True; 
end; 

procedure SeVazio(sender: TObject);
begin
If(sender is TDBLookUpComboBox)and(TDBLookUpComboBox(sender).text ='') Then Begin
   ShowMessage('Este campo é obrigatório.');
   TDBLookUpComboBox(sender).SetFocus;
end ;
If(sender is TEdit)or(sender is TDBEdit)Then With sender as tCustomEdit do
If TCustomEdit(sender).Text='' Then Begin
   ShowMessage('Este campo é obrigatório.');
   TCustomEdit(sender).SetFocus;
end; end;

function VerificaChave(alias:String; tTabela:TTable; Campo, NomeTabelaReal:String; Valor:Variant): Boolean;
var Table:TTable;
begin
If tTAbela.State in [dsEdit,dsBrowse] Then Begin
   Result:=False;
   Exit;
   end;
Table:=TTable.Create(nil);
With Table do Begin
Close;
DataBaseName:=Alias;
TableName:=NomeTabelaReal;
OPen;
end;
If Table.Locate(campo, Valor,[]) Then Result:=True else Result:=False;
Table.Destroy;
end;

Function ExecFile(F, modo,parametro: String):Boolean;
var r: String; handle:THandle;
begin
Result:=false;
case ShellExecute(Handle,PChar(modo), PChar(F),PChar(parametro), nil, SW_SHOWNORMAL) of
ERROR_FILE_NOT_FOUND: r := 'Arquivo não encontrado.';
ERROR_PATH_NOT_FOUND: r := 'Caminho não encontrado.';
ERROR_BAD_FORMAT: r := 'Arquivo .EXE inválido (não é um Win32 ou está corrompido).';
SE_ERR_ACCESSDENIED: r := 'Windows 95 only: The operating system denied access to the specified file.';
SE_ERR_ASSOCINCOMPLETE: r := 'Associação incompleta ou inválida.';
SE_ERR_DDEBUSY: r := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
SE_ERR_DDEFAIL: r := 'The DDE transaction failed.';
SE_ERR_DDETIMEOUT: r := 'The DDE transaction could not be completed because the request timed out.';
SE_ERR_DLLNOTFOUND: r := 'DLL não encontrada.';
SE_ERR_NOASSOC: r := 'Nenhum programa associado a este arquivo.';
SE_ERR_OOM: r := 'Memória insuficiente para executar este arquivo.';
SE_ERR_SHARE: r := 'Violação de compartilhamento.';
else Begin
Result:=true;
Exit;
end; end;
ShowMessage(r);
end;

procedure GravaReg(Valor:string; n:Double);
var Reg: TRegistry;
begin
Reg := TRegistry.Create;
Try
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(chave, True);
begin
Reg.WriteFloat(valor,n);
If  Reg.HasSubKeys Then Begin
Reg.WriteDate(Valor+'Dt',0);  //renova a data
Reg.WriteInteger(Valor+'kop',0); // zera os dias...
end;
Reg.CloseKey;
end;
finally
Reg.Free;
end; end;

Function LeReg(Valor:string):Boolean;
var Reg: TRegistry;
begin
Reg := TRegistry.Create;
Result:=false;
Try
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(chave, true);
begin
If not Reg.HasSubKeys Then Reg.WriteFloat(valor,126);
If(Reg.ReadFloat(valor)= SerialdoDrive('C',nil))or(Reg.ReadFloat(valor)= SerialdoDrive('C',nil)+1) Then Result:=True;
Reg.CloseKey;
end;
finally
Reg.Free;
end; end;

Function SeMVO:Boolean;
var Reg: TRegistry;
begin
Reg := TRegistry.Create;
Result:=false;
Try
Reg.RootKey := HKEY_CURRENT_USER;  //HKEY_CURRENT_USER\VLA\LBM=1...
Reg.OpenKey(MVO, False);
begin
If(Reg.ReadString(CTS)= cntValor)or FileExists('MVO.ini') Then Result:=True;
Reg.CloseKey;
end;
finally
Reg.Free;
end; end;

Function Validade(valor:string):integer; //valor = nome da aplicação...
var cod, val, dias:string;
begin
	cod:=copy(Valor,1,6);
	cod:=inttohex(StrToInt('$'+cod)-3023456,6);
	val:=copy(Valor,8,5);
	dias:=copy(Valor,7,1)+copy(Valor,length(Valor),1);
	If strtoint('$'+val)=date then
	begin
		showmessage('Codigo válido até '+datetostr(date + strtoint('$'+dias) )+
						' - '+inttostr(strtoint('$'+dias))+ 'dias');
		result:=StrtoInt('$'+dias);
	end
	else
	begin
		showmessage('Código incorreto!');
		result:=-1;
	end;
end;


Function CriaIni:string;
var ini:TIniFile;  s:string;
begin
s:='cfg.ini';
ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+ s);
s:= Copy(extractFileName(Application.ExeName),1,length(extractFileName(Application.ExeName))-4);
ini.WriteString('App','*',s);
Result:=s;
ini.Free;
end;

Function Aqui(Dir,Arquivo:String):String;
begin
If dir<>'' then
ForceDirectories(ExtractFilePath(ParamStr(0))+dir);
If dir<>'' then dir:=dir+'\';
Result:=ExtractFilePath(ParamStr(0))+dir+arquivo;
end;


Function Registro88C(NUMERO,ITEM:INTEGER; CNPJ,MODELO,SERIE,SUBSERIE,CFOP,CODPRODUTO:String;
         QUANT,BASECALCSTORIGEM,VALORCALCSTREPASSADO,ICMSSTUFCOMPLDESTINO:Real):string;
var I:INTEGER; S:String;
Begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88C',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,4);
INSERT(copy(MODELO,1,2),RESULT,18);
INSERT(copy(SERIE,1,3),RESULT,20);
INSERT(copy(SUBSERIE,1,2),RESULT,23);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,25);
INSERT(CFOP,RESULT,31);
s:=Format('%.3d',[(item)]);
INSERT(s,RESULT,34);
INSERT(copy(CODPRODUTO,1,14),RESULT,37);
I:=ROUND(quant*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,51);
I:=ROUND(BASECALCSTORIGEM*100);
s:=Format('%.12d',[(i)]);
INSERT(s,result,64);
I:=ROUND(VALORCALCSTREPASSADO*100);
s:=Format('%.12d',[(i)]);
INSERT(s,result,76);
I:=ROUND(ICMSSTUFCOMPLDESTINO*100);
s:=Format('%.12d',[(i)]);
INSERT(s,result,88);
result:=copy(result,1,126);
end;

Function Registro88D(NUMERO:INTEGER; CNPJ,IE,UF,MODELO,SERIE,SUBSERIE,CFOP:String; DATAEMISSAO,DATASAIDAENTRADA:TDate):string;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88D',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,4);
INSERT(copy(IE,1,14),RESULT,18);
INSERT(copy(UF,1,2),RESULT,32);
INSERT(copy(MODELO,1,2),RESULT,34);
INSERT(copy(SERIE,1,3),RESULT,36);
INSERT(copy(SUBSERIE,1,2),RESULT,39);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,41);
INSERT(CFOP,RESULT,47);
s:=FormatDateTime('yyyymmdd',DATAEMISSAO);
INSERT(s,RESULT,50);
s:=FormatDateTime('yyyymmdd',DATASAIDAENTRADA);
INSERT(s,RESULT,58);
result:=copy(result,1,126);
end;

Function Registro88E(CNPJ,IE,CODIGOSISTEMA,CODIGOSEF:String):string;
VAR I:INTEGER;
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88E',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,4);
INSERT(copy(IE,1,14),RESULT,18);
INSERT(copy(CODIGOSISTEMA,1,14),RESULT,32);
INSERT(copy(CODIGOSEF,1,14),RESULT,46);
result:=copy(result,1,126);
end;

Function Registro88M(CNPJ:String):string;
VAR I:INTEGER;
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88M',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,4);
INSERT('SEM MOVIMENTOS DE ENTRADAS / SAÍDAS',RESULT,18);
result:=copy(result,1,126);
END;

Function Registro88Q(DATAESTOQUE:TDate; CODIGOPRODUTO:String; QUANTIDADE,VALORTOTAL:REAL; CODPOSSE:INTEGER):string;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88Q',RESULT,1);
s:=FormatDateTime('yyyymmdd',DATAESTOQUE);
INSERT(s,RESULT,4);
INSERT(copy(CODIGOPRODUTO,1,14),RESULT,12);
I:=ROUND(QUANTIDADE*100);
s:=Format('%.13d',[(i)]);
INSERT(s,result,26);
I:=ROUND(VALORTOTAL*100);
s:=Format('%.12d',[(i)]);
INSERT(s,result,39);
s:=IntToStr(CODPOSSE);
INSERT(s,result,52);
result:=copy(result,1,126);
END;

Function Registro88T(NUMERO,TIPOFRETE:INTEGER; CNPJ,CNPJFRETE,IE,UF,UFFRETE,PLACA1,PLACA2,PLACA3,MODELO,SERIE,
         SUBSERIE,CFOP:String; DATAEMISSAO:TDate; VALORFRETE,ICMSFRETE,ALIQFRETE:Real):string;
VAR I:INTEGER; S:String;   //GERA registros...
begin
FOR I:=1 TO 125 DO RESULT:=RESULT+' ';
INSERT('88T',RESULT,1);
INSERT(copy(CNPJ,1,14),RESULT,4);
INSERT(copy(IE,1,14),RESULT,18);
s:=FormatDateTime('yyyymmdd',DATAEMISSAO);
INSERT(s,RESULT,32);
INSERT(copy(UF,1,2),RESULT,40);
INSERT(copy(MODELO,1,2),RESULT,42);
INSERT(copy(SERIE,1,3),RESULT,44);
INSERT(copy(SUBSERIE,1,2),RESULT,47);
s:=Format('%.6d',[(numero)]);
INSERT(s,RESULT,49);
s:=IntToStr(TIPOFRETE);
INSERT(s,result,55);
INSERT(copy(CNPJFRETE,1,14),RESULT,56);
INSERT(copy(UFFRETE,1,2),RESULT,70);
INSERT(copy(PLACA1,1,7),RESULT,72);
INSERT(copy(PLACA2,1,7),RESULT,79);
INSERT(copy(PLACA3,1,7),RESULT,86);
I:=ROUND(VALORFRETE*100);
s:=Format('%.12d',[(i)]);
INSERT(S,RESULT,93);
I:=ROUND(ICMSFRETE*100);
s:=Format('%.12d',[(i)]);
INSERT(S,RESULT,105);
I:=ROUND(ALIQFRETE*100);
s:=Format('%.4d',[(i)]);
INSERT(S,RESULT,117);
result:=copy(result,1,126);
end;

function FormataTel1(xtel: string): string;
var a,b,s:string; i:integer;              //configura formato do nº telef...
begin
s:=xtel;
Result := s;
s:=RTrim(s);
If(Copy(s,1,1)='(')or (Copy(s,5,1)='-')Then Exit;
If(s<>'')Then Begin
i:= Length(s);              //se o campo não estiver vazio ou
If not(i in[0,7..10])Then
If (Copy(s,1,1)<>'(') then Begin         //            com tam. 9 ou 10 ...
	ShowMessage('Entrada incorreta');
	Exit;
	end;
If i=7 Then Begin
a:= s;
	 Insert('-',a,4);
	 result:=a;
	 Exit;
	 end;
If i=8 Then Begin
a:= s;
	 Insert('-',a,5);
	 result:=a;
	 Exit;
	 end;
a:=Copy((s),1,2);
If i = 9 Then Begin
	b:= '('+a+')' + ' ' + Copy((s),3,3)+ '-';
	a:=(s);
	Delete(a,1,5);
	result:= b + a;
	end else
If i = 10 Then Begin
	b:= '('+a+')' + ' ' + Copy((s),3,4)+ '-';
	a:=(s);
	Delete(a,1,6);
	result:=b + a;
		end;
	end;
end;

function Rateio(Valor_Nota, Valor_Tot_Itens : Real): Real;
begin
	if(Valor_Nota=0)or
	  (Valor_Tot_Itens = 0) then
	Result:=0 else   // em %
		Result := 100 - (((Valor_Nota - Valor_Tot_Itens)/Valor_Nota) * 100);
end;

function Iff(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
	  Result := ParteTRUE
  else
	  Result := ParteFALSE;

end;

end.

