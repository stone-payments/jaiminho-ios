## Definição

Jaiminho é um facilitador para consumir a API de envio de email do [Pombo Correio](https://pombocorreio.stone.com.br).

## Instalação

#### Instalação manual
Para instalar manualmente a SDK é necessário baixar o arquivo [Jaiminho_Manual.framework.zip](https://github.com/stone-payments/jaiminho-ios/releases) e colocar os arquivos `Jaiminho.framework` e `Packer.framework` em Embedded Binaries como na imagem abaixo:

![embedded](https://user-images.githubusercontent.com/2567823/33395917-21ed1ab2-d52e-11e7-8b6c-602116f0e954.png)

Em `Build Phases` clique para adicionar um `Run Script`...

![script](https://user-images.githubusercontent.com/2567823/33395965-4870dd72-d52e-11e7-958e-eb7af04a7be1.png)

E cole o script abaixo:

```bash
FRAMEWORKS=("Jaiminho" "Packer")
for FRAMEWORK in $FRAMEWORKS
do
FRAMEWORK_EXECUTABLE_PATH="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$FRAMEWORK.framework/$FRAMEWORK"
EXTRACTED_ARCHS=()
for ARCH in $ARCHS
do
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
done
```
## Usando

#### Configuração de hambiente

Se precisar rodar o PomboCorreio em ambiente de teste pode ser usada a propriedade `environment` da classe `Configure` que recebe um enum `Environment`, podendo ser `.develop` ou `.production`.

> Por padrão o ambiente de produção já estará selecionado.

```swift
// para ambiente de desenvolvimento
Configuration.environment = .develop

// para ambiente de produção
Configuration.environment = .production
```


#### Envio de email

Para enviar uma mensagem de email é necessario criar uma instancia de `Email` e usá-lo para criar uma instancia do `PomboEmailRequest`.

```swift
// Cria uma instancia do Email
let to = Contact(address: "test@mail.com.br")
let from = Contact(address: "juaum@stone.com.br", name: "Juaum")
let email = Email(from: from, to: [to], body: "Hello there!", subject: "Sent with Jaiminho")

// Cria uma instancia do PomboEmailRequest
let emailRequest = PomboEmailRequest(email: email, company: "ACME", costCenter: "A cost center", structure: .commercial)

// Instancia a classe cliente da API Pombo passando o token da API
let pombo = PomboCorreio(apiToken: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

// Enviar o request passando a instancia do PomboEmailRequest e o tipo do request como POST
pombo.send(emailRequest, method: .post) { response in
    switch response {
        case .success(let success):
            print(success.trackId) // id to track the job
        case .failure(let error):
            print(error)
    }
}
```

#### Acompanhando o job

Quando um request PomboEmailRequest é enviado com sucesso ele retorna uma instancia de `PomboEmailResponse` que contém uma propriedade chamada `trackId`. Essa propriedade pode ser usada para fazer o acompanhamento do job.

```swift
// Instanciar PomboJobRequest com o trackId
let job = PomboJobRequest(trackId: "1234567890")

// Instanciar a classe cliente da api Pombo passando o token da API.
let pombo = PomboCorreio(apiToken: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

// Enviar o request passando a instancia de PomboJobRequest e o tipo do request como GET
pombo.send(job, method: .get) { response in
    switch response {
        case .success(let success):
            print(success.content.status)
        case .failure(let error):
            print(error)
    }
}
```
