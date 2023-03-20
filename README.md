# pastebin-bash

pastebin-bash é um projeto que permite postar textos ou arquivos para pastebin.com usando uma função bash e curl.

## Funcionalidades

Com pastebin-bash você pode:

- Postar mensagens simples para pastebin.com usando o comando `pastebin 'sua mensagem'`.
- Postar arquivos inteiros para pastebin.com usando o comando `cat seu_arquivo.txt | pastebin`.
- Obter a URL do seu post na saída padrão.

## Tecnologias utilizadas

pastebin-bash utiliza as seguintes tecnologias:

- Bash: uma linguagem de script usada para interagir com sistemas operacionais baseados em Unix.
- Curl: uma ferramenta de linha de comando usada para transferir dados via protocolos HTTP(S).

## Inicialização

Para usar pastebin-bash você precisa:

- Ter bash e curl instalados no seu sistema operacional. Você pode verificar se eles estão instalados usando os comandos `bash --version` e `curl --version`.
- Ter uma conta em pastebin.com e obter uma API key na página https://pastebin.com/api#1
- Copiar e colar a função bash definida no arquivo pastebin.sh no seu terminal e substituir <your_api_key> pela sua API key obtida no passo anterior.

## Implementações futuras

Algumas ideias para melhorar ou expandir pastebin-bash são:

- Adicionar opções para configurar a privacidade, a expiração e o formato dos posts.
- Adicionar opções para listar, editar ou deletar os posts existentes.
- Criar um script executável que possa ser instalado globalmente.

## Colaboradores

pastebin-bash foi criado por samuelcaldas. O código original foi encontrado em https://stackoverflow.com/a/58440856/10637718 e todos os créditos vão para o autor original.

## Status do projeto

pastebin-bash está concluído. Não há previsão de novas atualizações ou manutenção.
