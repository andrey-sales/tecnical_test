# ecommerce

Desafio tecnico para Engenheiro de Software Flutter III

## Gerenciamento de Estado e Arquitetura

O gerenciamento de estado utilizado para o projeto e avaliação tecnica foi mobx. Para o modelo arquitetural, eu estava pensando em MVVM (já anunciado pela google como uma arquitetura padrão de projetos) ou o clean architecture. A minha decisão foi ir para o clean pela base teoria dele ajudar a solucionar problemas. Acredito que a base teorica que o uncle bob passou nos livros e na série ajudaram nessa decisão. 

Bom, mas será que isso faria alguma diferença? Sim. Quando solicitaram o consumo local e remoto de dados, me veio o pensamento de fazer as duas externais separadas. Normalmente, um projeto que aplica conceitos de offline first tem suas bases propositalmente separadas para facilitar manutenções e implementações.

<img src=https://github.com/user-attachments/assets/d9e2791a-1d09-472e-b23b-e14680f0e99e width=400/>

## SharedPreference ou EncryptedSharedPreferences

Para esta avaliação foi solicitada a utilização do shared preferences para armazenamento local e avaliação. Nesse ponto, eu apliquei mais um pouco de experiência. O sharedPreference armazena os dados localmente em um arquivo xml para consulta. O irmão dele, o EncryptedSharedPreference realiza a criptação e desincriptação dos dados durante o processo. Aqui a escolha foi utilizar o EncrypedSharedPreferences por colocar como ponto de importancia um conceito que hoje avaliamos com essencial para o cargo. O EncrypedSharedPreference pode ser encontrado no Pacote flutter_secure_storage, facilitando e reduzindo o tempo para criar a logica de criptografia ou separar uma classe de utilidade e importar o pacote criptor.

Referencia: https://developer.android.com/reference/android/content/SharedPreferences 

Referencia: https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences

url: https://pub.dev/packages/flutter_secure_storage

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
