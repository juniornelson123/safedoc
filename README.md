# SAFEDOC!

Sistema para gestão e armazenamento de arquivos

# Dependências

Elixir >= 1.6.4
Phoenix Framework >= 1.4
PostgreSQL >= 9.0

Instalação Elixir: https://elixir-lang.org/install.html
Instalação Phoenix Framework: https://hexdocs.pm/phoenix/installation.html

## Atualizar Dependências

```shell
mix deps.get
```

```shell
cd assets && yarn && yarn run webpack --mode development && cd ..
```

## Banco de dados

Remover `.sample` do arquivo `/config/dev.secret.exs.sample` e alterar as configurações de banco:

```elixir
config :safedoc, Safedoc.Repo,
  username: "dbusername", # nome de usuário do banco
  password: "dbpassword", # senha do banco
  database:  "safedoc_dev",
  hostname:  "localhost",
  pool_size:  10
```

## Criar Banco de Dados

```shell
mix ecto.create
```

## Migrações Banco de Dados

```shell
mix ecto.migrate
```

## Semear Banco de Dados

```shell
mix run priv/repo/seeds.exs
```

## Iniciar Servidor

```shell
mix phx.server
```
