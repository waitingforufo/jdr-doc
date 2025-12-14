# Maven 第一个项目

[https://www.runoob.com/maven/maven-start.html](https://www.runoob.com/maven/maven-start.html)

### 使用 Maven Archetype 生成项目
Maven 提供了项目模板（Archetype），可以快速生成标准项目结构。最常用的是 maven-archetype-quickstart（基础 Java 项目模板）。

执行命令：
```bas
mvn archetype:generate \
    -DgroupId=com.example \
    -DartifactId=my-first-app \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DinteractiveMode=falseh
```

### 参数说明：
|参数                      | 说明
|--                        |--
|-DgroupId                 | 组织名（如公司域名倒写）
|-DartifactId              | 项目名称（会成为项目文件夹名）
|-DarchetypeArtifactId     | 使用的模板（quickstart 是基础 Java 项目）
|-DinteractiveMode=false   | 非交互模式（避免手动确认）

```bash
my-first-app/
├── pom.xml           # Maven 项目配置文件
├── src/
│   ├── main/         # 主代码目录
│   │   └── java/     # Java 源代码
│   │       └── com/example/App.java  # 自动生成的示例类
│   └── test/        # 测试代码目录
│       └── java/     # 测试类
│           └── com/example/AppTest.java  # 自动生成的测试类

```

### 项目结构解析
### pom.xml详解
这是 Maven 的核心配置文件，定义了项目的基本信息和依赖。

生成的 pom.xml 示例：

```java
<project>
    <!-- POM 模型版本，固定 4.0.0 -->
    <modelVersion>4.0.0</modelVersion>

    <!-- 项目坐标（唯一标识） -->
    <groupId>com.example</groupId>
    <artifactId>my-first-app</artifactId>
    <version>1.0-SNAPSHOT</version>

    <!-- 项目打包方式（默认 jar，也可以是 war、pom 等） -->
    <packaging>jar</packaging>

    <!-- 项目名称和 URL（可选） -->
    <name>my-first-app</name>
    <url>http://www.example.com</url>

    <!-- 依赖管理 -->
    <dependencies>
        <!-- JUnit 测试依赖 -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>  <!-- 仅用于测试 -->
        </dependency>
    </dependencies>
</project>
```
### 示例代码：
### 主类 App.java
```java
// 实例
package com.example;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello Maven!");
    }
}
```

### 测试类 AppTest.java
```java
// 实例
package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {
    @Test
    public void testApp() {
        assertTrue(true);  // 示例测试
    }
}
```

# 构建与运行
### 常用 Maven命令
|命令               | 作用
|--                 |--
|mvn compile        | 编译源代码
|mvn test           | 运行测试
|mvn package        | 打包（生成 .jar 文件）
|mvn install        | 安装到本地仓库（供其他项目依赖）
|mvn clean          | 清理 target 目录

### 完整构建流程
1. 编译项目： **mvn compile**  
     编译后的 .class文件会放在 target/classes目录
2. 运行测试： **mvn test**  
     执行 src/test/java下的测试类
3. 打包： **mvn package**  
     生成 target/my-first-app-1.0-SNAPSHOT.jar。
4. 运行程序：
   ```bash
   java -cp target/my-first-app-1.0-SNAPSHOT.jar com.example.App
   ```

# 扩展： 修改项目
### 添加依赖
例如，添加 Gson 用于 JSON 处理：

修改 pom.xml：
```bash
<dependencies>
    <!-- 原有 JUnit 依赖 -->
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.12</version>
        <scope>test</scope>
    </dependency>

    <!-- 新增 Gson 依赖 -->
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <version>2.8.9</version>
    </dependency>
</dependencies>
```

**运行 mvn compile**，Maven 会自动下载 Gson。

### 修改主类使用 Gson
```java
// 实例
package com.example;

import com.google.gson.Gson;

public class App {
    public static void main(String[] args) {
        Gson gson = new Gson();
        String json = gson.toJson("Hello Maven with Gson!");
        System.out.println(json);
    }
}
```

**重新打包并运行：**
```bash
mvn package
java -cp target/my-first-app-1.0-SNAPSHOT.jar com.example.App
```

# 配置国内镜像库
```bash
<!-- 在 settings.xml 或 pom.xml 中配置 -->
<mirror>
    <id>aliyun</id>
    <url>https://maven.aliyun.com/repository/public</url>
    <mirrorOf>central</mirrorOf>
</mirror>
```
阿里云仓库介绍：https://developer.aliyun.com/mvn/guide。

### 编译版本问题 - 在 pom.xml中指定java版本：
```bash
<properties>
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
</properties>
```

# 总结
  **1.创建项目：** mvn archetype:generate 生成标准结构。  
  **2.项目结构：**  
    1.pom.xml 定义依赖和配置。  
    2.src/main/java 放主代码，src/test/java 放测试代码。  
  **3.构建命令：**  
    1. mvn compile → mvn test → mvn package。  
  **4.运行：**  
    java -jar 或 java -cp 执行 .jar 文件。








