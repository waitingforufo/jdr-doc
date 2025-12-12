# Spring Beanスコープのクイックガイド

### **1概要**

このクイックチュートリアルでは、Springフレームワークのさまざまな種類のBeanスコープについて学びます。

Beanの有効範囲は、そのBeanが使用されるコンテキストにおけるそのBeanのライフサイクルと可視性を定義します。

Springフレームワークの最新版は6種類のスコープを定義しています。

- シングルトン  -singleton

- プロトタイプ  -prototype

↓はweb対応アプリでのみ利用可能

- リクエスト    -request
- セッション    - session
- 応用               - application
- websocket     - websocket

前述の最後の4つのスコープ *request、session、application* および websocket __はWeb対応アプリケーションでのみ利用可能です。

### **2シングルトンスコープ**   - default scopt

*singleton* スコープを使用してBeanを定義すると、**コンテナはそのBeanの単一インスタンスを作成**し、そのBean名に対する**すべての要求は同じオブジェクトを返し**ます。これは**キャッシュされます**。オブジェクトへの**変更はすべて、Beanへのすべての参照に反映**されます。他の範囲が指定されていない場合、この範囲がデフォルト値です。

スコープの概念を例示するために *Person* エンティティを作成しましょう。

```java
public class Person {
    private String name;

   //standard constructor, getters and setters
}
```

その後、 *@ Scope* アノテーションを使用して *singleton* スコープを持つBeanを定義します。

```java
@Bean
@Scope("singleton")
public Person personSingleton() {
    return new Person();
}
```

次のようにして、 *String* 値の代わりに定数を使用することもできます。

```java
@Scope(value = ConfigurableBeanFactory.SCOPE__SINGLETON)
```

今度は、同じBeanを参照している2つのオブジェクトが同じBeanインスタンスを参照しているため、どちらか一方だけが状態を変更しても、同じ値を持つことを示すテストを作成します。

```java
private static final String NAME = "John Smith";

@Test
public void givenSingletonScope__whenSetName__thenEqualNames() {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("scopes.xml");

    Person personSingletonA = (Person) applicationContext.getBean("personSingleton");
    Person personSingletonB = (Person) applicationContext.getBean("personSingleton");

    personSingletonA.setName(NAME);
    Assert.assertEquals(NAME, personSingletonB.getName());

    ((AbstractApplicationContext) applicationContext).close();
}
```

この例の *scopes.xml* ファイルには、使用されるBeanのXML定義が含まれています。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="personSingleton" class="org.baeldung.scopes.Person" scope="singleton"/>
</beans>
```

ApplicationContextは@AutowiredでもOK

```java
@Autowired
ApplicationContext context;

```

### **3プロトタイプスコープ**

**注！！  ApplicationContext.getBean()で取得する場合は @Scope("prototype")でOKだが、 @Autowiredで取得する場合はNG.**

**@Autowiredで取得するためには、 必ず @Scope(value="prototype", proxyMode = ScopedProxyMode.TARGET_CLASS)で定義すること。**

```java
@Component
@Scope(value="prototype", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Counter1{
    ...
}

※↑で @Autowiredで取得しても、毎回新しいインスタンスになる
```



*prototype* スコープを持つBeanは、**コンテナから要求されるたびに異なるインスタンスを返し**ます。 Bean定義で *prototype* を *@ Scope* アノテーションに設定することで定義されます。

```java
@Bean
@Scope("prototype")
public Person personPrototype() {
    return new Person();
}
```

シングルトンスコープに対して行ったように、定数を使用することもできます。

```java
@Scope(value = ConfigurableBeanFactory.SCOPE__PROTOTYPE)
```

スコーププロトタイプで同じBean名を要求する2つのオブジェクトは、同じBeanインスタンスを参照していないため、状態が異なることを示す前と同様のテストを作成します。

```java
private static final String NAME = "John Smith";
private static final String NAME__OTHER = "Anna Jones";

@Test
public void givenPrototypeScope__whenSetNames__thenDifferentNames() {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("scopes.xml");

    Person personPrototypeA = (Person) applicationContext.getBean("personPrototype");
    Person personPrototypeB = (Person) applicationContext.getBean("personPrototype");

    personPrototypeA.setName(NAME);
    personPrototypeB.setName(NAME__OTHER);

    Assert.assertEquals(NAME, personPrototypeA.getName());
    Assert.assertEquals(NAME__OTHER, personPrototypeB.getName());

    ((AbstractApplicationContext) applicationContext).close();
}
```

*scopes.xml* ファイルは、前のセクションで示したものと似ていますが、 *prototype* スコープを持つBeanのxml定義が追加されています。

```xml
<bean id="personPrototype" class="org.baeldung.scopes.Person" scope="prototype"/>
```

### **4 Web対応の範囲**

前述のように、**Web対応アプリケーションのコンテキストでのみ利用可能**な4つの追加のスコープがあります。これらは実際にはあまり使われません。

***request* スコープ**は**単一のHTTPリクエスト用のBeanインスタンスを作成**し、

**session** スコープは**HTTPセッション用に作成**します。

***application*** *scopeはライフサイクル* **ServletContext *のBeanインスタンスを作成**し、

**webbsocket** *scopeは特定の* *WebSocket* __sessionに対して作成します。

Beanのインスタンス化に使用するクラスを作成しましょう。



**注： application  vs singlton**    -     **「4.3 適用範囲」参照**

**application**:  該当アプリレベルのスコープ。　**複数のユーザがログインした場合、全ユーザで共有される**。

**singlton**：　複数のユーザがログインした場合でも、**それぞれ１つのユーザに対して、全域**で１つのインスタンスだけ生成される。



```java
public class HelloMessageGenerator {
    private String message;

   //standard getter and setter
}
```



#### **4.1. リクエスト範囲**

*@ Scope* アノテーションを使用して *request* スコープでBeanを定義できます。

```java
@Bean
@Scope(value = WebApplicationContext.SCOPE__REQUEST, proxyMode = ScopedProxyMode.TARGET__CLASS)
public HelloMessageGenerator requestScopedBean() {
    return new HelloMessageGenerator();
}
```

Webアプリケーションコンテキストのインスタンス化の時点ではアクティブな要求がないため、 *proxyMode* 属性が必要です。 Springは依存関係として注入されるプロキシを作成し、リクエストで必要になったときにターゲットBeanをインスタンス化します。

次に、 *requestScopedBean* への注入された参照を持つコントローラを定義できます。 Web固有のスコープをテストするために、同じリクエストに2回アクセスする必要があります。

リクエストが実行されるたびに *message* を表示すると、後でメソッド内で変更されていても、値が *null* にリセットされていることがわかります。これは、リクエストごとに異なるBeanインスタンスが返されるためです。



```java
@Controller
public class ScopesController {
    @Resource(name = "requestScopedBean")
    HelloMessageGenerator requestScopedBean;

    @RequestMapping("/scopes/request")
    public String getRequestScopeMessage(final Model model) {
        model.addAttribute("previousMessage", requestScopedBean.getMessage());
        requestScopedBean.setMessage("Good morning!");
        model.addAttribute("currentMessage", requestScopedBean.getMessage());
        return "scopesExample";
    }
}
```

#### **4.2. セッションスコープ**

同様の方法で *session* スコープでbeanを定義できます

```java
@Bean
@Scope(value = WebApplicationContext.SCOPE__SESSION, proxyMode = ScopedProxyMode.TARGET__CLASS)
public HelloMessageGenerator sessionScopedBean() {
    return new HelloMessageGenerator();
}
```

次に、 *sessionScopedBean* を参照してコントローラーを定義します。繰り返しますが、 *message* フィールドの値がセッションで同じであることを示すために、2つのリクエストを実行する必要があります。

この場合、初めて要求が出されたときには、値 *message* は____nullです。ただし、一度変更すると、セッション全体で同じBeanのインスタンスが返されるため、後続の要求に対してその値が保持されます。

```java
@Controller
public class ScopesController {
    @Resource(name = "sessionScopedBean")
    HelloMessageGenerator sessionScopedBean;

    @RequestMapping("/scopes/session")
    public String getSessionScopeMessage(final Model model) {
        model.addAttribute("previousMessage", sessionScopedBean.getMessage());
        sessionScopedBean.setMessage("Good afternoon!");
        model.addAttribute("currentMessage", sessionScopedBean.getMessage());
        return "scopesExample";
    }
}
```



#### **4.3. 適用範囲**

***application*** *scopeは、* **ServletContextのライフサイクルのBeanインスタンス**を作成します

これは**シングルトンスコープに似ています**が、Beanのスコープに関して**非常に重要な違いがあります**。

Beanが ***application* スコープ**の場合、Beanの同じインスタンスは同じ *ServletContext* 内で実行されている**複数のサーブレットベースのアプリケーション間で共有**されますが、**singletonスコープ**のBeanは**単一のアプリケーションコンテキストのみにスコープされます**。

*application* スコープでBeanを作成しましょう。

```java
@Bean
@Scope(value = WebApplicationContext.SCOPE__APPLICATION, proxyMode = ScopedProxyMode.TARGET__CLASS)
public HelloMessageGenerator applicationScopedBean() {
    return new HelloMessageGenerator();
}
```

そして、このBeanを参照するコントローラは、

```java
@Controller
public class ScopesController {
    
    @Resource(name = "applicationScopedBean")
    HelloMessageGenerator applicationScopedBean;

    @RequestMapping("/scopes/application")
    public String getApplicationScopeMessage(final Model model) {
        model.addAttribute("previousMessage", applicationScopedBean.getMessage());
        
        applicationScopedBean.setMessage("Good afternoon!");
        
        model.addAttribute("currentMessage", applicationScopedBean.getMessage());
        
        return "scopesExample";
    }
}
```

この場合、 applicationScopedBeanに設定された値 message *は、後続のすべてのリクエスト、セッション、および同じ* ServletContextで実行されている場合はこのBeanにアクセスする**別のサーブレットアプリケーションでも保持されます**。



#### **4.4. WebSocketスコープ**

最後に、 **_ webbsocket\* _* scopeでBeanを作成しましょう。

```java
@Bean
@Scope(scopeName = "websocket", proxyMode = ScopedProxyMode.TARGET__CLASS)
public HelloMessageGenerator websocketScopedBean() {
    return new HelloMessageGenerator();
}
```

最初にアクセスしたときのWebSocketスコープのBeanは、 ***WebSocket* セッション属性に格納されています**。 WebSocketセッション全体でそのBeanがアクセスされるたびに、そのBeanの同じインスタンスが返されます。

また、これはシングルトンの動作を示しますが、 *WebSocket* セッションのみに制限されていると言えます。
