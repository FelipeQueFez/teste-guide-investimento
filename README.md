# teste-guide-investimento

# Versão do flutter utilizada
2.10.5

# O que foi utilizado
- Clean Architecture (feature `asset_variation`)
- Múltiplos temas (arquivo `factory_theme.dart`)
- Múltiplos idiomas (arquivo `app_tr.dart`)
- Injeção de dependência
    - Pacote (GetIt) (arquivo `main.dart`)
- Chamada HTTP
    - Pacote Dio com interceptors e abstracão para utilizá-lo (arquivo `guide_requester.dart`)
- Implementação de mecanismo para múltiplos ambientes (arquivo `endpoints.dart`)
- Quebra de arquitetura em pacotes (`APP`, `CORE` e `UI`)
- MobX como gerenciador de estado (arquivo `index_store.dart`)
- fl_charts para construção de gráficos (EM DESENVOLVIMENTO)

# Testes
Aqui foi utlizado um mecanismo para testar a partir da camada de `usecase` os resultados que a API retorna, com o intuíto de garantir o funciomente da integração com um sistema externo. 

(arquivo `get_asset_test.dart`)

### ESTE TESTE NÃO É MOCADO, A INTENÇÃO É REALMENTE CONSUMIR OS DADOS REAIS E MONTAR N CENÁRIOS A PARTIR DISSO. 

# Como rodar o projeto ?
*OBS Por hora estou rodadndo no modo Web, por algum motivo não estou conseguindo rodar nos emuladores (MAS IREI CORRIGIR ISSO)*

Portanto, para rodar no web, você precisa garantir que o SDK esteja habilitado para isso, então execute o seguinte comando em seu terminal:

`flutter config --enable-web `

Agora podemos rodar o projeto com o comando:

`flutter run -d chrome`

# 10/11/2022
Ainda não terminei o teste, preciso integrar os dados que capturo da API com a TELA que está mocada.