# GetX

Package que aborda diversos temas do Flutter, como a gerência de estado, a injeção de dependência e as rotas do aplicativo.

### Package: https://pub.dev/packages/get

### Extensão recomendada:

[GetX Snippets](https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets)

---

## GetBuilder e GetxController

**GetxController**

```dart
class ValueController extends GetxController {
  String definedValue = '';
  bool isLoading = false;

  Future<void> setValue(String value) async {
    isLoading = true;
    update();  // Para avisar aos observers, utilizamos o método update()

    await Future.delayed(const Duration(seconds: 2));

    definedValue = value;
    isLoading = false;
    update();  // Para avisar aos observers, utilizamos o método update()
  }
}
```

**Widget GetBuilder sendo utilizado para observar alterações que ocorrerão no Controller e re-executará o código passado no parâmetro Build**

```dart
GetBuilder<ValueController>(
  init: _valueController,
  builder: (valueController) {
    return Text('Valor definido: ${valueController.definedValue}');
  },
),
```

---

## Variáveis observáveis e GetX widget

Uma outra abordagem para a reatividade e gerenciamento do estado é  utilizarmos variáveis observáveis com o Widget Getx.

O widget GetBuilder, que falamos sobre, no tópico anterior, precisava do “update()” para re-buildar os widgets dentro do método builder, o widget Getx, por outro lado, observa as variáveis observáveis criadas nele e re-builda quando o valor delas são alterados:

```dart
class ValueController extends GetxController {
  RxString definedValue = ''.obs;  // String observável
  RxBool isLoading = false.obs;  // boolean observável

  Future<void> setValue(String newValue) async {
    isLoading.value = true;  // acessando o .value para atualizar o valor da variável observável

    await Future.delayed(const Duration(seconds: 2));

    definedValue.value = newValue;  // agora, para atribuirmos um novo valor, devemos acessar o .value da variável observável
    isLoading.value = false;  
  }
}
```

Nesta outra abordagem, utilizamos o widget GetX ao invés do GetBuilder, que possui a mesma estrutura, porém, passa a observar as variáveis que são observáveis no Controller definido no tipo genérico:

```dart
GetX<ValueController>(
  init: _valueController,
   builder: (valueController) {
    return Text('Valor definido: ${valueController.definedValue.value}');
  },
),
```

---

## Obx - Também funciona com as variáveis observáveis

Não necessita de passarmos o Controller em um parâmetro “init”, ou definir no tipo genérico.

O Obx realiza o mesmo procedimento que os widgets GetBuilder e o GetX, com a diferença que não precisamos passar um objeto em seu “init”, já que ele não tem.

Em contrapartida, em seu builder, ele não trará um objeto desse controller, e seu builder não é nomeado, deixando tudo mais prático: