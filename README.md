# cadastro_cliente
Aplicativo simples para cadastro de cliente, com geração um arquivo XML com os dados para cadastro que será enviado para empresa via e-mail.

Desenvolvido com Delphi 10.3 Community Edition utilizando componentes nativos
Para a consulta de CEP para o endereço foi utilizado o ViaCep, biblioteca para consulta de cep

Ao baixar o projeto copiar os arquivos ssleay32.dll e libeay32.dll para pasta onde se o executavel do sistema.

Funcionalidades no cadastro do Cliente:

1 - Validação de CPF
2 - Consulta de CEP com preenchimento dos dados de endereço
3 - Configuração do envio do e-mail, onde clicando no checkbox ele mostra e esconde as configurações.
4 - Para melhor visualização ao cursor entrar no campo muda a cor de branco para amarelo assim facilitando saber onde vai fazer 
    a entrada dos dados.
5 - Ao gravar o sistema checa se todos os campos obrigatórios estão devidamente preenchidos caso não o foco é direcionado para 
    o campo a preencher, gerado o arquivo XML Cliente-999999999.xml onde "99999999999" é o cpf do cliente e anexado ao e-mail 
    enviado para empresa, conforme configuração do envio de e-mail e por fim limpa os dados na tela.
    
Em caso de Bug report para o e-mail marc0s.valverd3@gmail.com
