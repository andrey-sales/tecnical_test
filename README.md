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

## Layout e Responsividade

Para se adapte adequadamente em diferentes tamanhos de tela, eu apliquei componentes de layout (Columns, Rows, Expanded, Flexible) e para adequar o tamanho e a orientação, apliquei MediaQuery.


<table>

  <tr>
    <td>Retrato</td>
    <td>Paisagem</td>
  </tr>

  <tr>
    <td> <img src=https://github.com/user-attachments/assets/f8ed7f0c-1b8e-42eb-acc3-c606c88081b3  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/8dfc2082-d983-45bb-b3d6-19b6dab15bf9  width=400/> </td>
  </tr>

  <tr>
    <td> <img src=https://github.com/user-attachments/assets/000d0155-066e-40d0-a593-aa21b36be271  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/ec9a9c8d-eb94-4d18-9611-f2777d5be632  width=400/> </td>
  </tr>

   <tr>
    <td> <img src=https://github.com/user-attachments/assets/5090d03c-29c9-43f3-a228-36a871b1dd61  width=200/> </td>
    <td> <img src=https://github.com/user-attachments/assets/9e47e33f-2cdb-4f00-a5f7-93018d514e16  width=400/> </td>
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


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
