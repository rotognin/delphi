# Delphi
Projetos de estudo em Delphi


### __R-Backup__
Copiar arquivos de uma pasta para outra. Irá receber 3 parâmetros de entrada:
1. arquivo texto com os nomes de arquivos que serão copiados da origem para o destino
2. pasta de origem dos arquivos
3. pasta de destino, para onde os arquivos serão copiados. Se a pasta não existir, a mesma será criada.

Exemplo de uso: `rBackup "C:\teste\lista.txt" "C:\Origem\" "C:\Destino\"`


### __R-Info__
Separador de informações. Muito útil para visualização rápida de informações geradas com delimitadores.
Exemplo: `00100;RODRIGO TOGNIN;Projeto Delphi;19/06/2021;17:00;`

Ao escolher ";" como delimitador e "0" como sequência, a grade irá exibir:

Posição | Tamanho | Informação
--------|---------|-----------
0       | 5       | 00100
1       | 14      | RODRIGO TOGNIN
2       | 14      | Projeto Delphi
3       | 10      | 19/06/2021
4       | 5       | 17:00


### __R-Leitor__

Evolução do projeto "R-Info", esse projeto recebe como parâmetro (opcionalmente) um arquivo com diversas informações com delimitadores, separa em linhas na primeira grade, e ao selecionar uma linha, irá separar as informações da linha na segunda grade.

O projeto suporta passagem por parâmetros por linha de comando para funcionar de forma automática. Seguem abaixo os parâmetros:

Parâmetro | O que é     | Descrição                                                         | Exemplo
----------|-------------|-------------------------------------------------------------------|-----------------------------------
1         | Arquivo     | Um arquivo que tenha linhas e delimitadores                       | C:\Rodrigo\Projetos\Teste\info.csv
2         | Delimitador | Separador de informações (opcional, ";" padrão)                   | ";" ou "\|"
3         | Sequência   | Linha inicial a ser exibida na segunda grade (opcional, padrão 0) | 0 ou 1

Exemplo de chamada pela linha de comando passando parâmetros: 

`rLeitor "C:\Rodrigo\Projetos\Teste\info.csv" "|" "0"`

