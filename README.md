# ecommerce

Desafio tecnico para Engenheiro de Software Flutter III

## Gerenciamento de Estado e Arquitetura

O gerenciamento de estado utilizado para o projeto e avaliação tecnica foi mobx. Para o modelo arquitetural, eu estava pensando em MVVM (já anunciado pela google como uma arquitetura padrão de projetos) ou o clean architecture. A minha decisão foi ir para o clean pela base teoria dele ajudar a solucionar problemas. Acredito que a base teorica que o uncle bob passou nos livros e na série ajudaram nessa decisão. 

Bom, mas será que isso faria alguma diferença? Sim. Quando solicitaram o consumo local e remoto de dados, me veio o pensamento de fazer as duas externais separadas. Normalmente, um projeto que aplica conceitos de offline first tem suas bases propositalmente separadas para facilitar manutenções e implementações.

<img src=https://github.com/user-attachments/assets/d9e2791a-1d09-472e-b23b-e14680f0e99e width=400/>

## SharedPreference ou EncryptedSharedPreferences

Para esta avaliação foi solicitada a utilização do shared preferences para armazenamento local e avaliação. Nesse ponto, eu apliquei mais um pouco de experiência. O sharedPreference armazena os dados localmente em um arquivo xml para consulta. O irmão dele, o EncryptedSharedPreference realiza a criptação e desincriptação dos dados durante o processo. Aqui a escolha foi utilizar o EncrypedSharedPreferences por colocar como ponto de importancia um conceito que hoje avaliamos com essencial para o cargo. O EncrypedSharedPreference pode ser encontrado no Pacote flutter_secure_storage, facilitando e reduzindo o tempo para criar a logica de criptografia ou separar uma classe de utilidade e importar o pacote criptor.

Por outro lado, utilizei sharedpreference para criar uma instância mockada da base local. Digamos que eu utilizei o SharedPreference nos testes Unitários e na produção eu coloquei EncrypedSharedPreference. :D 

***Referencia:*** https://developer.android.com/reference/android/content/SharedPreferences 

***Referencia:*** https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences

***url:*** https://pub.dev/packages/flutter_secure_storage

## Testes

Foram incluídos testes unitários e testes E2E para avaliação. O pacote utilizado para a criação dos testes unitários foi o flutter_test. (sem mockito). Como, eram necessários criar testes que cubram as regras de negócio como um todo (Enterprise e Application).

***Comando: flutter test***

Para testes E2E, foi utilizado o integration_test. Nesse teste, eu escrevi os 5 cenarios de uso da aplicação:

• ***Listar produtos:*** flutter test integration_test/products/list_product_test.dart  
• ***Favoritar:***  flutter test integration_test/products/favorite_test.dart  
• ***Pesquisar e Filtrar:***  flutter test integration_test/products/search_test.dart  
• ***Visualizar detalhes:*** flutter test integration_test/products/details_test.dart  
• ***Favoritar na Página de Detalhes:*** flutter test integration_test/products/details_favorite_test.dart

***DEMO***: https://youtu.be/s0opguIHxsI

## Preveção de Erros, tratamentos e desenvolvimento de soluções

• Pesquisar: para a avaliação do pesquisar, haviam dois requisitos a serem seguidos: debounce e filtragem. Durante o processo em que iniciamos a aplicação, a lista inicial é preenchida para que reflita o visual de uma verdadeira loja de ecommerce. Sempre devemos oferecer algum item inicialmente para atrair a atenção do usuário.

***Caso de Uso 1:*** Aplicar ***debounce*** no momento da ***pesquisa*** para que a pesquisa seja realizada ***SOMENTE*** quando o
usuário terminar de digitar.

Para esse caso, vamos pensar que um novo item seja incluso na base, ao pesquisar pelo nome desse item, ele irá popular a lista de pesquisa. Para solucionar isto, a lista inicial e a lista de pesquisa serão separadas, assim sempre teremos os nossos produtos disponíveis na loja e caso um novo produto seja pesquisado, ele será buscado na base para incluir na lista de pesquisa.

***Caso de Uso 2:*** A pesquisa deve ***atualizar*** a lista de produtos em ***tempo real*** conforme o usuário ***digitar***.

Aqui, o componente de campo de busca terá um filtro que aplicará nas duas listas: inicial e pesquisa, assim mantendo os dois comportamentos esperados.

***Caso de Uso 3:*** Incluir um ícone de coração que permita ao usuário marcar/desmarcar o produto como favorito

Como o funcionamento dele esta ligado diretamento a duas páginas, não vamos precisar criar uma nova controladora para a página de detalhes, apenas extender as funções da página inicial para que ela tenha a visualização e a função de favoritar.

***Preveção de Erro 1:***

<img width="548" alt="Screenshot 2024-12-20 at 20 40 47" src="https://github.com/user-attachments/assets/62d87f6f-23c8-4ea7-ad9b-b145c932e0f1" />

Vamos pensar que o valor de comentários esta limitado a no máximo 3 digitos. Se o valor aumentar para valores como 1.000, 1.000.000, 1.0000.000.000, o layout da linha irá se quebrar, para solucionar este problema foi aplicado na utilidade o valor para converter o contador para uma String que represente valores acima de 3 digitos:

<table border="1">
  <thead>
    <tr>
      <th>Valor</th>
      <th>Resposta</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>no reviews</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1 review</td>
    </tr>
    <tr>
      <td>1,000</td>
      <td>1K</td>
    </tr>
    <tr>
      <td>1,000,000</td>
      <td>1M</td>
    </tr>
    <tr>
      <td>1,000,000,000</td>
      <td>1B</td>
    </tr>
  </tbody>
</table>

***Preveção de Erro 2:***

Você notou que as imagens elas carregam várias vezes durante as inicializações? Para isso, vamos adicionar cash para permitir que elas se mantenham durante as atualizações, sem a a necessidade de aguardar que todas as telas carreguem suas URLs. 

***Para essa solução:*** https://pub.dev/packages/cached_network_image

***Tratamento 1:***

Ao realizar o get produtos, eu não sabia o tamanho da massa de dados. Normalmente pensamos que pode ser algo do tipo 5 produtos ou 300 produtos. Para esse tratamento foi aplicado um conceito chamado de ***paralelimos/Thread*** (no dart chamamos isso de ***Isolate***). É um método simples apenas para receber e ao mesmo tempo executar a tarefa de conversão do produto.

***Documentação:*** https://docs.flutter.dev/perf/isolates

***Tratamento 2:***

Ao transformar o preço, o valor obtido deve ser em Dollar (Protótipo). Nesse caso, vamos aplicar um pacote chamado INTL para converter este valor e fazer o uso correto de pontos e vírgulas quando necessário.

***Package:*** https://pub.dev/packages/intl

***Tratamento 3:***

Mesmo criando o projeto atualizado, precisamos alterar algumas configurações do AGP para rodar em versões androids. Para isso vamos alterar a versão dele no settings.gradle

<img src=https://github.com/user-attachments/assets/49bd2ff4-d874-4c7c-aa4b-caae48958a41  width=600/>

<img src=https://github.com/user-attachments/assets/ab3f650f-35a8-4105-8534-8f4caa830bb7  width=800/>


## Layout e Responsividade

Para se adapte adequadamente em diferentes tamanhos de tela, eu apliquei componentes de layout (Columns, Rows, Expanded, Flexible) e para adequar o tamanho e a orientação, apliquei MediaQuery.


<table>

  <tr>
    <td>Retrato</td>
    <td>Paisagem</td>
  </tr>

  <tr>
    <td> <img src=https://github.com/user-attachments/assets/f8ed7f0c-1b8e-42eb-acc3-c606c88081b3  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/8dfc2082-d983-45bb-b3d6-19b6dab15bf9  width=600/> </td>
  </tr>

  <tr>
    <td> <img src=https://github.com/user-attachments/assets/000d0155-066e-40d0-a593-aa21b36be271  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/ec9a9c8d-eb94-4d18-9611-f2777d5be632  width=600/> </td>
  </tr>

   <tr>
    <td> <img src=https://github.com/user-attachments/assets/5090d03c-29c9-43f3-a228-36a871b1dd61  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/9e47e33f-2cdb-4f00-a5f7-93018d514e16  width=600/> </td>
  </tr>
  
</table>

## Inicio

<table>

  <tr>
    <img src=https://github.com/user-attachments/assets/b7aff26a-8378-48d1-8b68-9c468134fbe2  width=200/>
    <img src=https://github.com/user-attachments/assets/5d42e6ba-9b99-4078-a2e0-7b1c5b38bac3  width=200/>
    <img src=https://github.com/user-attachments/assets/826f3bdd-f01a-4131-b5de-906dece21fbd  width=200/>
    <img src=https://github.com/user-attachments/assets/6c80982c-5f52-48d6-8691-b155e424aeda  width=200/>
    
  </tr>
  
</table>

## Tela de Detalhes do Produto

<table>

  <tr>
    <img src=https://github.com/user-attachments/assets/f2140f1d-9f8e-475f-84d4-0b7c21b07062  width=200/>    
  </tr>
  
</table>

## Tela de Favoritos

<table>

  <tr>
    <img src=https://github.com/user-attachments/assets/4f77af7f-67f4-474b-a9af-6dda6757d8e2  width=200/>    
  </tr>
  
</table>
