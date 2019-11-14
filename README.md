# Account Bank
    API permite registrar uma nova conta, realizar tranferência, depósito e consultar saldo

# Ambiente de desenvolvimento
- Ruby 2.5.0
- Ruby on Rails 5.2
- Postgres 9.6
- Docker para contêiners
- Docker-compose para serviços

# Executando o ambiente de desenvolvimento

O ambiente já está preparado para com um único comando realizar toda configuração necessária. Basta ter configurado o docker e docker-compose. Caso ainda não tenha tem dois arquivos na raíz do projeto que podem te ajudar a instalar.
Caso já tenha esse requisito na sua máquina basta executar o comando abaixo na raíz do projeto.

```bash
$ docker-compose up
```
Caso precise acessar dentro do contêiner execute o comando

```bash
$ docker-compose exec api /bin/bash
```

Temos uma arquivo de automatização do processo de configuração do banco de dados

```bash
$ ./cleanDB.sh
``` 
Caso queira executar os testes acesse o terminal e execute

```bash
$ rails test
```


# Links Úteis
Caso queira acessar a API estamos disponibilizando uma URL. Esse projeto está hospedado na Heroku

[dedede](url)

# Implementações
- Autênticação realizada com JWT (Json Web Token)
- Registro de uma nova conta 
- Login em uma conta existente
- Listar um usuário específico
- Consulta saldo de uma conta

# GNU General Public License v3.0
Esse projeto está sob a licença GNU 3.0

# Código de Conduta
Para contribuir com esse projeto é necessário seguir o código de conduto. Para mais informações leia o arquivo CODE_OF_CONDUCT.md que se encontra na raíz do projeto.

# Contribuições 
Caso queira contribuir com o projeto esse algumas evoluções que podem ser feitas. Caso tenha outra em mente ficaremos felizes em receber sua contribuição
    
- Permissões de contas para ADM
- Outras operações de transação bancária