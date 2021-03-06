Trabalho 2 de Multimídia e Hipermídia - SSC0661
4 de Dezembro de 2016

[Imobiliária Imobilizato]

Alunos-corretores:
	Adriano Belfort de Sousa				(7960706)
	Henrique de Almeida Machado da Silveira (7961089)
	Marcello de Paula Ferreira Costa 		(7960690)

Neste trabalho, implementamos um modelo de dados de um sistema de imobiliária.

Os dados são recebidos por meio de um arquivo .txt, que é interpretado e 
convertido por um parser para um XML que segue as regras de um XML Schema 
também definido por nós (modelo.xsd, localizado no diretório raiz). Note 
que no arquivo TXT esperamos que a primeira linha sempre seja a de código
de um imóvel, independentemente da ordem das outras propriedades.

Criamos arquivos de transformação (folhas de estilos) para três saídas: uma
para desktops (desktoptransform.xsl, na pasta raiz), gerando arquivos em HTML,
utilizando CSS para exibir imóveis na tela; uma para dispositivos mobile 
(mobiletransform.xsl, na pasta raiz), gerando arquivos em HTML, mas utilizando
apenas formatação nativa do HTML; e uma que transforma o XML para RSS 
(rsstransform.xsl, na pasta raiz), contendo apenas informações básicas sobre
os imóveis disponíveis.

O diretório deste projeto contém pastas específicas:

- inputText: contém as entradas em txt que devem ser convertidas para XML e
outros formatos. O usuário do nosso sistema pode optar por deixar os arquivos
TXT a serem processados nesse diretório. Enregamos essa pasta contendo um
exemplo de TXT idêntico ao do PDF fornecido com as especificações do trabalho.

- XML: contém os arquivos XML gerados pelo parser na leitura do arquivo TXT
de entrada e que serão utilizados pelas transformações XSL. Entregamos essa
pasta com o XML gerado a partir do exemplo fornecido no PDF de especificação
do trabalho. 
IMPORTANTE: é necessária a exeistência da pasta XML para que o
parser realize a gravação dos arquivos XML gerados por ele.

- XSLTOutput: contém os arquivos HTML e XML referentes às páginas para desktop,
mobile e RSS, geradas do arquivo XML intermediário. Nesta pasta há também os
arquivos CSS e de imagens para as páginas "decoradas". Enviamos essa pasta
contendo os arquivos CSS e de imagens e também os resultados da aplicação dos
XSL ao exemplo do PDF de especificação do trabalho.

- tests: casos de teste elaborados pelo grupo, usados para testar o parser e
verificar o comportamento do sistema. Foram criados diversos casos de teste
com erros que vão contra a especificação do sistema fornecida pelo professor.

Utilizamos nesse trabalho as seguintes ferramentas:
	- Python 2.7.11
	- lxml 3.6.4
	- Bootstrap CSS 3.3.7
    - Bootstrap JS 3.3.7
	- xmllint 
	- xsltproc

A conversão do arquivo txt de entrada para os diferentes tipos de saída
propostos pode ser feita executando-se o script "executeImobilizato.py"

Antes de executá-lo, certifique-se de que possui o Python 2.7.11 e o lxml
3.6.4. O Python 2 já vem instalado por padrão em várias distribuições
Unix. Já o lxml precisa ser instalado por um gerenciador de pacotes. 
Para facilitar o processo, criamos um script em Python chamado 
installDependencies.py, que instala todas as dependências do projeto. 
Para executá-lo, basta ir à pasta do projeto na linha de comando e digitar

$ python installDependencies.py

O script instalará o pip (sistema de gerenciamento de pacotes do Python)
e a biblioteca lxml (por meio do pip). A senha do usuário administrador 
será necessária (sudo).

Com todas as dependências instaladas, execute o script executeImobilizato.py
com o arquivo TXT de entrada da seguinte forma:

$ python executeImobilizato.py <arquivo>

Obs.: caso o arquivo não esteja no mesmo diretório que o script
executeImobilizato.py, será necessário especificar o caminho para ele.
Por exemplo, se um arquivo chamado entrada.txt estiver no diretório
inputText, deve-se usar:

$ python executeImobilizato.py inputText/entrada.txt

Os arquivos de saída estarão na pasta XSLOutput.