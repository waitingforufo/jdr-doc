# BootStrap引用

## CSSのフレームワーク。

特徴：

- デザイン性が統一。
- 知識無しで大体使える。
- レスポンシブ

デメリット：

- 色やデザインが固定されている
- バットみたとき大体分かる
- カスタマイズが難易度高い



## 注意！

　**Vue.jsやAngularなどは既にデザイン用のCSSがあるため最近は使用しない。**



## Bootstrapを使わない場合

- モダンなWebサイトを作成する場合

　　　　－　見た目も重要なwebシステム　　例：任天堂site等

- フロントエンドのFWを使用している場合
- デザイン注視されている場合



※BootStrap使うとデザインが難しい場合がある



```html
<html>
    <header>
        <link rel="stylesheet" type="text/css" href="path/to/bootstrap.min.css" />
        
        <script src="path/to/jquery.min.js"></script>
        <script src="path/to/bootstrap.min.js"></script>
    </header>
    
    <body>
        
        
    </body>
</html>
```

## 1. 流体容器 container-fluid



```html
<div class="container-fluid">
    //幅は100%
</div>
```

**width: auto**

両側に**15px padding**



## 2. 固定容器 container

```html
<div class="container">
    //幅の閾値あり
                         width (margin:30px含)
        幅>=1200(lg)      1170                   大型画面PC
        992    (md)       970                    中型PC
        768    (sm)       750                    タブレット
        xxx    (xs)       auto                   スマホ
</div>
```

両側に**15px padding**



## 3. グリッド bootstrapで一番重要

```html
<div class="container">
    <div class="row">
        <div class="col-lg-10"></div>
        <div class="col-lg-2"></div>
    </div>
    
    <div class="row">
        <div class="col-lg-6"></div>
        <div class="col-lg-6"></div>
    </div>
</div>
```

※1行は**12列**とする。

![image-20200719164550534](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719164550534.png)



## 4. 行、列

### 行

**class: row**

  margin-left: -15px;

 margin-right: -15px;



### 列

.col-**xs**-1, .col-xs-2, .col-xs-3, ...          .col-xs-12

.col-**sm**-1, .co.-sm-2, .col-sm-3, ...     .col-sm-12

.col-**md**-1, .col-md-2, .col-md-3, ...    .col-md-12

.col-**lg**-1, col-lg-2, .col-lg-3, ...              .col-lg-12



**共通様式**

position: relative;

min-height: 1px;

**padding-left: 15px;**

**padding-right: 15px;**



- float
- width

　　　１～12

- left

- right

  　　　０～12

  　　　0 : auto

- margin-left 

 　　　０～12

　　lg.　class="col-lg-4  col-lg-**offset**-4"   : 右へ4単位移動（全体１２格で、要素の幅が４各のばあい：中寄の効果）



### 使い方

■１．

```html
<div class="row">
    <div class="col-lg-XX"></div>
</div>
```

■2.  大画面(lg)字は 10 , 2の幅； 画面がmdになると6, 6の幅になる。

```
<div class="container">
    <div class="row">
        <div class="col-lg-10 col-md-6">AAAA</div>
        <div class="col-lg-2  dol-md-6">BBBB</div>
    </div>
</div>
```



## 5. 列排序 & 列偏移　→へ:push / 左へ:pull

■col-lg-**pull**-xx    /    col-lg-**push**-xx

```
<div class="col-lg-3 col-lg-pull-9 col-md-4 col-sm-6">

    <div class="thumbnail"></div>
    
    <div class="caption">
        ...
    </div>
</div>
```

※ col-lg-pull-9 ： lg（幅）の幅で9単位左へ。

※push : 右へ移動 →；    pull：左へ移動 ←



```html
<div class="col-lg-3 col-lg-push-3 col-md-4 col-md-pull-0 col-sm-6 col-sm-pull-6">
    
</div>
```

※ 「col-lg-3 **col-lg-push-3** col-md-4 **col-md-pull-0** col-sm-6 **col-sm-pull-6**」

push/pullがある場合は、**必ず lg, md , sm全てに書くべき**。 そうじゃないとレイアウトが崩れる。



## 6. 响应式工具 （显示/不显示）

スクリーン幅の大きさに合わせて表示・非表示制御

- **.visible-xs**              :  xsでのみ表示、他の幅は非表示
- **.visible-sm**
- **.visible-md**
- **.visible-lg**



- **.visible-xs-block**
- **.visible-xs-inline**
- **.visible--xs-inline-block**
- **.visible-sm-block**
- **...**



- **.hidden-xs**
- **.hidden-sm**
- **.hidden-md**
- **.hidden-lg**

# BootStrap clearfix

**.clearfix**





# 練習１



```html
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>...</p>
                        <p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
```

![image-20200719214306917](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719214306917.png)

# 練習２

![image-20200720210759559](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200720210759559.png)

**BootStrap使ったソース**

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <!-- 上記３つは必ず先頭に置くこと！ -->
        
        <title>excercise 1</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    </head>
    <body>
        
        <div class="container">
            
            <!-- 行定義 Bgn>>>>>>>>>> -->
            <div class="row">
                
                <!-- 1列目 Bgn>>>>>>>>>> -->
                <!-- col-lg-3なので、1行に４つ配置可能 -->
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>...</p>
                        <p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </p>
                    </div>
                </div>
                <!-- 1列目 End<<<<<<<<<< -->
                
                <!-- 2列目 Bgn>>>>>>>>>> -->
                <!-- col-lg-3なので、1行に４つ配置可能 -->
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>...</p>
                        <p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </p>
                    </div>
                </div>
                <!-- 2列目 End<<<<<<<<<< -->
                
                <!-- 3列目 Bgn>>>>>>>>>> -->
                <!-- col-lg-3なので、1行に４つ配置可能 -->
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>...</p>
                        <p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </p>
                    </div>
                </div>
                <!-- 3列目 End<<<<<<<<<< -->
                
                <!-- 4列目 Bgn>>>>>>>>>> -->
                <!-- col-lg-3なので、1行に４つ配置可能 -->
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <img src="..." alt="...">
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>...</p>
                        <p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </p>
                    </div>
                </div>
                <!-- 4列目 End<<<<<<<<<< -->
                
            </div>
            <!-- 行定義 End<<<<<<<<<< -->
            
        </div>
        
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</html>
```





# クラス

## 1. アラインメント

```
.text-left     Left aligned text.
.text-center   Center aligned text.
.text-right    Right aligned text.
.text-justify  Justified text.
.text-nowrap   No wrap text.
```





# BootStrapのカスタマイズ

１．**daum.less**を**自作**     

```less
@import "path/to/bootstrap.less";
@grid-gutter-width:200px;              <- variables.lessから変更したい値を上書き
```

２．daum.lessをコンパイル

　　　→ **daum.css**が作成される。

注：

CSS中の**@import**は性能悪いので使わない。

lessの@importは読み込む。