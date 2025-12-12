# [Data Source与数据库连接池简介 JDBC简介（八）](https://www.cnblogs.com/noteless/p/10319296.html)

**DataSource是作为DriverManager的替代品而推出的，DataSource 对象是获取连接的首选方法。**

原文地址:[ Data Source与数据库连接池简介 JDBC简介（八）](https://www.cnblogs.com/noteless/p/10319296.html)

![img](https://blog-static.cnblogs.com/files/noteless/%E4%BA%8C%E7%BB%B4%E7%A0%812.gif)

### 起源

#### 为何放弃DriverManager

DriverManager负责管理驱动程序，并且使用已注册的驱动程序进行连接。

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
//1、注册驱动
Class.forName("com.mysql.jdbc.Driver");
//数据库连接所需参数
String user = "root";
String password = "123456";
String url = "jdbc:mysql://localhost:3306/sampledb?useUnicode=true&characterEncoding=utf-8";
//2、获取连接对象
Connection conn = DriverManager.getConnection(url, user, password);
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

使用DriverManager的一般形式如上面代码所示

直接使用DriverManager的这种形式，通常需要将驱动程序硬编码到项目中（JDBC4.0后可以自动注册驱动程序）

**而且最重要的是DriverManager的getConnection方法获取的连接，是建立与数据库的连接，是建立与数据库的连接，是建立与数据库的连接。**

**但是建立与数据库的连接是一项较耗资源的工作，频繁的进行数据库连接建立操作会产生较大的系统开销。**

随着企业级应用复杂度的提升以及对性能要求的提高，这一点是难以接受的。

#### 连接池

**既然每次使用时都重新建立与数据库之间的连接，会产生较大的系统开销**

**是否可以事先创建一些连接备用，当需要时，从这些连接中选择一个提供出去；当连接使用完毕后，并不是真正的关闭，而是将这些数据状态还原，然后继续等待下一个人使用？**

比如滑雪场会租赁雪具滑雪服等，如果你不是资深玩家，你没有必要浪费钱买，即使你不差钱，每次去滑雪场都不能轻装上阵，每次都要携带很多装备，也是一件麻烦事。

这种没必要的花费或者麻烦其实都是一种开销。

连接池的核心与租用的理念有类似的点，重复使用可以提高连接的利用率，减少开销（当然连接池的使用并不需要你花费一笔租金）

连接的持有是消耗空间的，但是现在绝大多数场景下，磁盘空间并没有那么金贵，我们更关心的是性能，所以**空间换取时间**，连接池的逻辑被广泛应用。

#### 数据源

DriverManager只是建立与数据库之间的连接，如何才能将连接池的概念应用其中？

**一种很自然的方式就是提供一个薄层的封装，建立一个中间层，这个中间层将DriverManager生成的连接，组织到连接池中，然后从池中提供连接。**

[![image_5c4aa662_951](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140250877-1394767455.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140250476-31357459.png)

 

**Data Source就是DriverManager的一种替代角色，对外呈现就类似于一个DriverManager，拥有对外提供连接的能力**

直接使用DriverManager，驱动程序与管理器是“服务者---管理者”的形式，借助于管理者才能提供服务。

Data Source将驱动程序的概念淡化了，突出驱动程序能够提供的服务与能力，将驱动程序提供的服务与能力抽象为Data Source数据源这一角色。

[![image_5c4aa662_6e5d](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140251439-673993707.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140251236-665240055.png)

**DataSource中获取的连接来自于连接池中，而池中的连接根本也还是从DriverManager获取而来**

有了数据源这一中间层，就可以实现连接池和分布式事务的管理。

**对外呈现DataSource就是类似于DriverManager的一个存在。**

 

**DataSource的形式是JNDI （Java Naming Directory Interface）**

DataSource是JNDI资源的一种，那么到底什么是JNDI呢

此处不过多解释，可以简单认为JNDI是类似这样一个东西：

一个哈希表，类型为<String，Object>

JNDI的两个最主要操作：bind和lookup。bind操作负责往哈希表里存对象，lookup则根据这个键值字符串往外取对象。

开发人员可以使用键值——也就是一个字符串名称——来获取某个对象。

**简言之就是可以给一个对象命名，然后可以通过名称找到这个对象。**

**数据源的概念在应用程序与数据库连接之间插入了一个中间层，进而可以实现连接池以及事务管理，并且以JNDI的形式，也能够以非常方便的形式使用。**

 

### 实现

#### 核心架构

关于数据源有以下几个核心的接口

CommonDataSource接口定义了 DataSource、XADataSource 和 ConnectionPoolDataSource 之间公用的方法。

DataSource 是 官方定义的获取 connection 的接口， ConnectionPoolDataSource 是官方定义的从 connection pool 中拿 connection 的接口，XADataSource是定义的用来获取分布式事务连接的接口

也就是分为了三个方向，基本实现，连接池，事务

[![image_5c4aa662_28ee](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140251803-1388696431.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140251617-382381111.png)

对于ConnectionPoolDataSource的使用方案应该是下面所示

对于Connection Pool的实现，借助于ConnectionPoolDataSource，进而获取PooledConnection ，然后获取连接，这是一种标准做法

[![image_5c4aa662_1690](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140252306-160796338.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140252094-394247448.png)

但是有的时候 事情的发展或许并不一定如规划的那般发展

很多的工具类仅仅实现DataSource了，也一并实现连接池以及事务的能力，接口就在那里，我直接实现一个强大的实现类，也没什么问题

#### DataSource

这是一个工厂对象，用于提供到此 DataSource 对象所表示的物理数据源的连接。

**作为 DriverManager 工具的替代项，DataSource 对象是获取连接的首选方法。**

**实现 DataSource 接口的对象通常在基于 JavaTM Naming and Directory Interface (JNDI) API 的命名服务中注册。**

 

DataSource 接口由驱动程序供应商实现。共有三种类型的实现：

- 基本实现 - 生成标准的 Connection 对象
- 连接池实现 - 生成自动参与连接池的 Connection 对象。此实现与中间层连接池管理器一起使用。
- 分布式事务实现 - 生成一个 Connection 对象，该对象可用于分布式事务，大多数情况下总是参与连接池。此实现与中间层事务管理器一起使用，大多数情况下总是与连接池管理器一起使用。

 

**DataSource 对象的属性在必要时可以修改。**

**例如，如果将数据源移动到另一个服务器，则可更改与服务器相关的属性。其优点在于，由于可以更改数据源的属性，所以任何访问该数据源的代码都无需更改。**

 

**通过 DataSource 对象访问的驱动程序本身不会向 DriverManager 注册。**

通过lookup操作获取 DataSource 对象，然后使用该对象创建 Connection 对象。

使用基本的实现，通过 DataSource 对象获取的连接与通过 DriverManager 设施获取的连接相同。

 

数据源的实现必须提供public的无参的构造函数。

#### API

DataSource只有两个方法（确切的说是一个方法的两个重载版本），用于建立与此 DataSource 对象所表示的数据源的连接。

- Connection getConnection()
- Connection getConnection(String username, String password)

#### 小结

DriverManager用于管理驱动程序并且提供数据库的直连，频繁的创建和消耗连接增加系统大量开销，并且将数据库连接直接暴露。

数据源的概念就是为了在应用程序和DriverManager创建的数据库直接连接之间插入一个中间层

借助于中间层，应用程序与数据库的连接两者之间完成了解耦，也能够对数据库的真实连接进行隐藏；

一旦解耦，通过中间层间接调用，类似代理模式，就可以添加更多的服务---连接池以及分布式事务。

数据源相关接口有三个，但是很多是仅仅实现了DataSource接口

而对于连接池本质就是一个容器，负责管理创建好的数据库连接。

连接池与数据源逻辑上是两回事，但是在实现层面的代码中DataSource的实现类往往都具有了连接池以及连接池管理方面的功能。

所以有些时候，DataSource到底是理解成数据源？还是javax.sql.DataSource？还是指的一个实现？还是一个实现了数据库连接池的实现？（经常一个实现了DataSource的并且提供了连接池功能的实现，会被叫做数据库连接池）

### 应用

Java作为一种广泛使用的开发语言，自然不需要我们自己实现DataSource，一些大厂已经帮我们实现了

比如：DBCP ，C3P0 ，druid

下面的三张图展示了类继承结构，可以看得出来他们实现的接口

 

[![image_5c4aa662_1ad3](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140252818-645880110.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140252515-1725848757.png)

 

[![image_5c4aa662_814](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140253562-525209370.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140253250-270353877.png)

 

[![image_5c4aa662_7dc8](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140254397-1609066633.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140253968-1037926461.png)

**目前推荐使用ALI的Druid，http://druid.io/**

maven中央仓库: http://central.maven.org/maven2/com/alibaba/druid/ 

Druid是一个开源项目，源码托管在github上，源代码仓库地址是 https://github.com/alibaba/druid。

Wiki首页：

[https://github.com/alibaba/druid/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98](https://github.com/alibaba/druid/wiki/常见问题)

与其他主流对比

https://github.com/alibaba/druid/wiki/%E5%90%84%E7%A7%8D%E6%95%B0%E6%8D%AE%E5%BA%93%E8%BF%9E%E6%8E%A5%E6%B1%A0%E5%AF%B9%E6%AF%94

[![image_5c4aa662_4bf9](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140254953-1869596252.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140254627-2026325635.png)

#### 数据库连接池示例

如下一个简单的演示

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
package jdbc;
import com.alibaba.druid.pool.DruidDataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.commons.dbcp2.BasicDataSource;
public class MyDataSource {
  public static void main(String[] args) throws Exception {
      String user = "root";
      String password = "123456";
      String url = "jdbc:mysql://localhost:3306/sampledb?useUnicode=true&characterEncoding=utf-8";
      //1.获取连接
      // Connection conn = getDHCPConnection(user,password,url);
      //Connection conn = getC3P0Connection(user,password,url);
      Connection conn = getDruidConnection(user, password, url);
      String sql = "select * from student limit 0,10";
      //2、获得sql语句执行对象
      Statement stmt = conn.createStatement();
      //3、执行并保存结果集
      ResultSet rs = stmt.executeQuery(sql);
      //4、处理结果集
      while (rs.next()) {
      System.out.print("id:" + rs.getInt(1));
      System.out.print(",姓名:" + rs.getString(2));
      System.out.print(",年龄:" + rs.getInt(3));
      System.out.println(",性别:" + rs.getString(4));
      }
      conn.close();
      stmt.close();
      rs.close();
}
public static Connection getDruidConnection(String user, String password, String url)
throws Exception {
    DruidDataSource ds = new DruidDataSource();
    ds.setUsername(user);
    ds.setPassword(password);
    ds.setUrl(url);
    ds.setDriverClassName("com.mysql.jdbc.Driver");
    return ds.getConnection();
    }
public static Connection getC3P0Connection(String user, String password, String url)
throws Exception {
    ComboPooledDataSource cpds = new ComboPooledDataSource();
    cpds.setUser(user);
    cpds.setPassword(password);
    cpds.setJdbcUrl(url);
    cpds.setDriverClass("com.mysql.jdbc.Driver");
    return cpds.getConnection();
    }
public static Connection getDHCPConnection(String user, String password, String url)
throws Exception {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setUsername(user);
        dataSource.setPassword(password);
        dataSource.setUrl(url);
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        Connection connection = dataSource.getConnection();
        return connection;
    }
}
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

[![image_5c4aa663_5c6d](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140255828-1295609380.png)](https://img2018.cnblogs.com/blog/897393/201901/897393-20190125140255292-138338156.png)

### 总结

**数据源作为DriverManager的替代者，用于获取数据库连接，你应该总是使用DataSource**

**DataSource是应用程序与数据库连接的一个抽象的中间层，是一个接口**

**对于DataSource已经有了很多优秀的实现，其中较为突出的为Druid，建议使用，Druid不仅仅提供了连接池的功能还提供了其他比如监控等功能，非常强大。**

对于数据源的应用，除了用户名密码url还有其他的一些属性信息，比如最大连接数，建立连接的最大等待时间等，不同的连接池略微有出入，可以查看手册。

对于DataSource的一些实现，经常被叫做数据库连接池，比如Druid官方文档中说“Druid是Java语言中最好的数据库连接池“，本质核心就是DataSource的一个实现类，作为中间层使用，并且基本上都提供了附带的其他的服务，也就是说不仅仅实现了核心建筑，也基于核心之上构建了很多的外围建设。

原文地址:[Data Source与数据库连接池简介 JDBC简介（八）](https://www.cnblogs.com/noteless/p/10319296.html)