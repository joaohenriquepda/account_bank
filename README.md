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

[https://account-bank.herokuapp.com/](https://account-bank.herokuapp.com/)


# Endpoints

Existe um arquivo do programa POSTMAN na raíz do projeto que traz todas rotas mais usadas com os paramêtros.

```bash
Account-Bank.postman_collection.json
```

Alguns endpoints precisam que seja passado como paramêtro no Header "Authorization" o hash gerado do JWT para autenticação do usuário que está usando a API. Abaixo as rotas da API e o detalhmento de quais vão precisar de autenticação

```bash
# SEM USO DE AUTENTICAÇãO
POST '/accounts'; paramêtros: name,cpf,password,password_confirmation, account_balance
POST '/auth/login'; paramêtros: cpf, password
GET '/account/:id'; paramêtros: id
POST '/operations', paramêtros: source_account_id, destination_account_id, amount, type


# USO COM AUTENTICAÇÃO
GET '/account/cpf/:cpf'; paramêtros: cpf
GET '/operations'; 
POST '/operations/jwt', paramêtros: source_account_id, destination_account_id, amount, type

get '/account/cpf/:cpf', to: 'accounts#show_by_cpf'
  get '/operations', to: 'operations#index' 
  post '/operations/jwt', to: 'operations#create_with_jwt'


```


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