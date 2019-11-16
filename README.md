# SAFEDOC!

Sistema para gestão e armazenamento de arquivos

# Dependências

	Elixir >= 1.6.4
	Phoenix Framework >= 1.4
	PostgreSQL >= 9.0

	Instalação Elixir: https://elixir-lang.org/install.html
	Instalação Phoenix Framework: https://hexdocs.pm/phoenix/installation.html

## Atualizar Dependências

	mix deps.get
	cd assets && yarn && node node_modules/webpack/bin/webpack.js --mode development && cd ..

## Banco de dados

Alterar configurações de banco no arquivo /config/dev.exs:
	 
	 config :safedoc, Safedoc.Repo,
		username:  "user",
		password:  "password",
		database:  "safedoc_dev",
		hostname:  "localhost",
		pool_size:  10
	
## Criar Banco de Dados

	mix ecto.create

## Migrações Banco de Dados

	mix ecto.migrate

## Semear Banco de Dados

	mix run priv/repo/seeds.exs
