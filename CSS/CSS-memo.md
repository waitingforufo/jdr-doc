# HTML5 + CSS3

# HTML5は基本的に最終バージョン

# ■ selector

※詳しくは MDNドキュメントを参照

[MDN developer.mozilla.org/ja/docs/Web/CSS/CSS_Selectors](https://developer.mozilla.org/ja/docs/Web/CSS/CSS_Selectors)





**CSS セレクター**は、一連の CSS の規則が適用される要素を定義します。

**メモ**: 親のアイテム、親の兄弟、親の兄弟の子を選択するセレクターや結合子はありません。

## 基本セレクター

- [全称セレクター](https://developer.mozilla.org/ja/docs/Web/CSS/Universal_selectors)

  すべての要素を選択します。任意で、特定の名前空間に限定したり、すべての名前空間を対象にしたりすることができます。 **構文:** `*` `ns|*` `*|*` **例:** `*` は文書のすべての要素を選択します。

- [要素型セレクター](https://developer.mozilla.org/ja/docs/Web/CSS/Type_selectors)

  指定されたノード名を持つすべての要素を選択します。 **構文:** `elementname` **例:** `input` はあらゆる [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/input) 要素を選択します。

- [クラスセレクター](https://developer.mozilla.org/ja/docs/Web/CSS/Class_selectors)

  指定された `class` 属性を持つすべての要素を選択します。 **構文:** `.classname` **例:** `.index` は "index" クラスを持つあらゆる要素を選択します。

- [ID セレクター](https://developer.mozilla.org/ja/docs/Web/CSS/ID_selectors)

  `id` 属性の値に基づいて要素を選択します。文書中に指定された ID を持つ要素は1つしかないはずです。 **構文:** `#idname` **例:** `#toc` は "toc" という ID を持つ要素を選択します。

- [属性セレクター](https://developer.mozilla.org/ja/docs/Web/CSS/Attribute_selectors)

  指定された属性を持つ要素をすべて選択します。 **構文:** `[attr]` `[attr=value]` `[attr~=value]` `[attr|=value]` `[attr^=value]` `[attr$=value]` `[attr*=value]` **例:** `[autoplay]` は `autoplay` 属性が（どんな値でも）設定されているすべての要素を選択します。

## グループ化セレクター

- [セレクターリスト](https://developer.mozilla.org/ja/docs/Web/CSS/Selector_list)

  `,` はグループ化の手段であり、一致するすべてのノードを選択します。 **構文:** `A, B` **例:** `div, span` は [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/span) と [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/div) の両要素に一致します。

## 結合子

- [子孫結合子](https://developer.mozilla.org/ja/docs/Web/CSS/Descendant_combinator)

  ` ` (空白) 結合子は、第1の要素の子孫にあたるノードを選択します。 **構文:** `A B` **例:** `div span` は [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/div) 要素の中にある [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/span) 要素をすべて選択します。

- [子結合子](https://developer.mozilla.org/ja/docs/Web/CSS/Child_combinator)

  `>` 結合子は、第1の要素の直接の子に当たるノードを選択します。 **構文:** `A > B` **例:** `ul > li` は [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/ul) 要素の内側に直接ネストされた [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/li) 要素をすべて選択します。

- [一般兄弟結合子](https://developer.mozilla.org/ja/docs/Web/CSS/General_sibling_combinator)

  `~` 結合子は兄弟を選択します。つまり、第2の要素が第1の要素の後にあり（ただし直後でなくても構わない）、両者が同じ親を持つ場合です。 **構文:** `A ~ B` **例:** `p ~ span` は [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/p) 要素の後にある [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/span) 要素をすべて選択します。

- [隣接兄弟結合子](https://developer.mozilla.org/ja/docs/Web/CSS/Adjacent_sibling_combinator)

  `+` 結合子は隣接する兄弟を選択します。つまり、第2の要素が第1の要素の直後にあり、両者が同じ親を持つ場合です。 **構文:** `A + B` **例:** `h2 + p` は [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/h2) 要素の後にすぐに続く [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/p) 要素をすべて選択します。

- [列結合子](https://developer.mozilla.org/ja/docs/Web/CSS/Column_combinator) 

  `||` 結合子は列に所属するノードを選択します。 **構文:** `A || B` **例:** `col || td` は 要素のスコープに所属するすべての `](https://developer.mozilla.org/ja/docs/Web/HTML/Element/td) 要素を選択します。

## 擬似表記

- [擬似クラス](https://developer.mozilla.org/ja/docs/Web/CSS/Pseudo-classes)

  `:` 表記により、文書ツリーの中に含まれない状態情報によって要素を選択することができます。 **例:** `a:visited` はユーザーが訪問済みの [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/a) 要素をすべて選択します。

- [疑似要素](https://developer.mozilla.org/ja/docs/Web/CSS/Pseudo-elements)

- `::` 表記は、 HTML に含まれていないエンティティを表現します。

  **例:** `p::first-line` はすべての [``](https://developer.mozilla.org/ja/docs/Web/HTML/Element/p) 要素の先頭行を選択します。

## 仕様書

| 仕様書                                                       | 状態 | 備考                                                         |
| :----------------------------------------------------------- | :--- | :----------------------------------------------------------- |
| [Selectors Level 4](https://drafts.csswg.org/selectors-4/)   | 草案 | `||` 列結合子、グリッド構造セレクター、論理結合子、位置、時系列、リソース状態、言語、 UI の疑似クラス、属性値の選択における ASCII 文字の大文字小文字の区別の有無を示す修飾子を追加。 |
| [Selectors Level 3](https://drafts.csswg.org/selectors-3/)   | 勧告 | `~` 一般兄弟結合子、およびツリー構造の疑似クラスを追加。 疑似要素に二重コロン `::` の接頭辞を用いるようにした。追加の属性セレクター。 |
| [CSS Level 2 (Revision 1)](https://www.w3.org/TR/CSS2/selector.html) | 勧告 | 子結合子 `>` および隣接兄弟結合子 `+` を追加。 **全称セレクター**と**属性セレクター**を追加。 |
| [CSS Level 1](https://www.w3.org/TR/CSS1/)                   | 勧告 | 初回定義                                                     |



# 伪类， 伪元素

![image-20200718114151979](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718114151979.png)



**伪类： 不存在的类**

**伪元素：不存在的元素**



# スタイルの継承

**样式的继承：为一个元素设置的样式同时也会应用到它的后代元素上。**

**可以将一些通用样式共通设置到祖先标签上，即可让所有元素都具有该样式。**



```html
<p>
    aaaabbbbb
    <span>ccccdddd</span>
</p>

<div>
    kkkkkk
    <span>eeeee fffff</span>
</div>

※ p に設定した様式が spanにも継承される
※ divに設定した様式が内部のspanにも継承される。
```



**※ bodyに設定した様式が内部の全てのタグに継承される。**

**注：すべての様式が継承されるのではない。**

　　背景関連、レイアウト関連は継承されない。

　　- background-color
　　- a
　　- b
　　- c
　　- c

**デフォルトの背景は transparent（透明）**



# 単位：em , rem

**■　1em =  1フォントサイズ**

**フォントサイズ**：　デフォルトは **16px**

※フォントサイズの変更によって長さが変わる



■　**rem：root(html)要素のフォントサイズ単位**



# 色単位   rgb(), rgba() , HSL

**■ HSL：あんまり使わない**

H：色相      : 色円盤  0 - 360

S：饱和度   : 濃度      0% - 100%

L：亮度       :               0% - 100%   (50%：正確が色)



# box模型

![image-20200718131501838](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718131501838.png)



![image-20200718131726457](D:\JDR_PRJ\PRJ-Bitbucket\HUILING.Tech\Study_Memo\image-20200718131726457.png)

![image-20200718132353223](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718132353223.png)



![image-20200718132525117](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718132525117.png)



![image-20200718132656629](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718132656629.png)



![image-20200718133612265](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718133612265.png)



# ブラウザデフォルトの様式を排除 reset.css 

```css
※基本的には下記のような感じ。
*{
    margin: 0px;
    padding: 0px;
}
ul{
    list-style: none;
}

```

※ただ、デフォルト様式排除の共通的な様式を使う

**reset.css**

<link rel="stylesheet" href="path/to/reset.css">

```html
<link rel="stylesheet" href="path/to/reset.css">

```

![image-20200718134858070](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718134858070.png)



# normalize.css



![image-20200718135137404](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718135137404.png)



**※　推奨： reset.css**



# ナビの制作

![image-20200718141126845](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718141126845.png)



# clearfix

```css
.clearfix::before,
.clearfix::after{
    content: '';
    display: table;     //同时解决高度塌陷，外边距重叠的问题
    clear: both;
}
```



# フォント・ファミリー

![image-20200718153544591](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718153544591.png)



![image-20200718153639213](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718153639213.png)

種類だけ指定したら、ブラウザによって使うフォントが違うので、ブラウザによってそれぞれ違う可能性がある。

UI的によくない。



```html
font-family: 'Courier New', Courier, monospace;
※順番的に優先

```

![image-20200718154051699](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718154051699.png)

※   serif, sans-serif, monospaceは一般的に最後に指定する。



www.jd.com

font-family: arial,**Microsoft YaHei**,Hiragino Sans GB,"\u5b8b\u4f53",**sans-serif**



**サーバにあるフォントを使わせることができる**。

![image-20200718155203316](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718155203316.png)

※フォントをDLするので、インターネット速度が遅い時ばれることあり。

※著作権問題もある。



# アイコンフォント icon font

## 1. Font Awesome 無料あり

![image-20200718160306514](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718160306514.png)

**※フリーバージョンあり**

![image-20200718160510477](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718160510477.png)

![image-20200718160809475](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718160809475.png)

※必要なのは **css, webfonts２つのディレクトリのみ**。

※**使い方**

all.css           圧縮無し

all.min.css   圧縮済み

```html

<i class="fas fa-bell"></i>
※必ず class="fas  xxxx" /   class="fab  xxxx "  固定   この２つがフリー
```

![image-20200718161454528](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718161454528.png)



※ xxx**::before　で使う場合**

![image-20200718162751792](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718162751792.png)



※他のタグでも使えるし、　HTML本文としても指定できる。    &#x**f0f3** 等

![image-20200718163028085](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718163028085.png)



## 2. iconfont  推奨 -   alibabaの　有料か無料かは確認必要

※ユーザがUPしたものなので、ライセンスはよく分からない

![image-20200718164731796](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718164731796.png)

![image-20200718165039618](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718165039618.png)

![image-20200718165329982](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718165329982.png)



# 文字の行の高さ

![image-20200718165707134](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718165707134.png)

![image-20200718170004700](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718170004700.png)



# 文字の水平、垂直アラインメント

## 水平 alignment

![image-20200718170711137](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718170711137.png)



## 垂直　alignment

![image-20200718170953161](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718170953161.png)

※厳密には、 middleが真ん中寄せではない。

px値指定も可能

![image-20200718171152970](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718171152970.png)



![image-20200718171708388](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718171708388.png)



![image-20200718171658484](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718171658484.png)



# 文字の様式



![image-20200718172007549](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718172007549.png)



# 背景

![image-20200718173929544](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718173929544.png)



## background-position

**■ background-position**

![image-20200718174051975](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718174051975.png)



![image-20200718174212473](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718174212473.png)



## offset

```css
background-position: 100px 100px;
```

![image-20200718174600900](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718174600900.png)



![image-20200718175021343](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718175021343.png)

![image-20200718175052728](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718175052728.png)



![image-20200718175511848](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718175511848.png)



## 背景用画像　CSS-sprite 1画像ファイルにたくさんの画像があるケース



![image-20200718175823085](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718175823085.png)



![image-20200718180024795](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718180024795.png)



![image-20200718180124871](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718180124871.png)

![image-20200718180223728](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718180223728.png)

:hover 時は、背景画像を左へ移動する必要がある。

![image-20200718180413626](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718180413626.png)



![image-20200718180902773](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718180902773.png)



### CSS-Spriteの使い方

![image-20200718181705466](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718181705466.png)



![image-20200718181341936](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718181341936.png)



# table

## tableタグ

![image-20200718182249273](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718182249273.png)

![image-20200718182359620](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718182359620.png)

![image-20200718182555058](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718182555058.png)



![image-20200718182731669](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718182731669.png)

```css
table{
    margin: 0 auto;      //水平中寄
}
```



![image-20200718183113703](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718183113703.png)



```css
table > tr:nth-child(add){
    //NG
}

tbody > tr:nth-chile(add){
    //OK
}
※　<tr>はtableの子要素じゃない

※tableの子要素は theader / tbody / tfooterである。

```

![image-20200718183534939](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718183534939.png)

## display: table-cell

![image-20200718183832236](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718183832236.png)



# box-shadow

![image-20200718184518474](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718184518474.png)



# 过渡效果 慢慢展开效果 transition

**transition**

```css
transition: height 0.3s;
※上→下へ移動

```



![image-20200718185544368](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718185544368.png)



## 1. 初期作成

```css
*{
    margin: 0;
    padding: 0;
}

.box1{
    width: 800px;
    height: 800px;
    background-color: silver;
    overflow: hidden;
}

.box div{
    width: 100px;
    height: 100px;
    margin-bottom: 100px;
}

.box2{
    background-color: #bfa;
    transition: all 2s;
}

.box1:hover .box2{
    width: 200px;
    height: 200px;
}
```

![image-20200719092712618](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719092712618.png)

![image-20200719094132626](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719094132626.png)



```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>过渡练习</title>

        <style>
            *{
                margin: 0px;
                padding: 0px;
            }

            .box1{
                width: 800px;
                height: 800px;
                background-color: silver;
                overflow: hidden;
            }

            .box1 div{
                width: 100px;
                height: 100px;
                margin-bottom: 100px;
            }

            .box2{
                background-color: #bfa;

                /*
                * transition
                *   - 属性が変化される場合の切替方式
                *   - 動画が実現可能
                */
                /* transition-property: ; */
                /* transition-duration: ; */
                /* transition-delay: ; */

                /* transition: height 2s; */
                /* transition: all 2s;  */

                /*全ては all*/
                /* transition-property: width, height;*/
                transition-property: all;
                transition-duration: 2s;
            }

            /*
            * .box1にマウスが入る時、 .box2の様式
            */
            .box1:hover .box2{
                width: 200px;
                height: 200px;
                background-color: orange;
            }
        </style>
    </head>
    <body>

        <div class="box1">
            <div class="box2"></div>
        </div>
    </body>
</html>
```

実行結果

![image-20200719095407503](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719095407503.png)

マウスが入る場合

![image-20200719095331980](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719095331980.png)



![image-20200719095527038](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719095527038.png)



![image-20200719100659087](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719100659087.png)



[Bezier曲線調べ https://cubic-bezier.com/#.3,1.24,.86,-0.36](https://cubic-bezier.com/#.3,1.24,.86,-0.36)

![image-20200719101029107](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719101029107.png)





# 動画

## 動画　vs transition

■ transition  ：　なんかの属性が変更する場合の切り替え効果（必ずプロパーティの変化が必要）

■動画：　自動的に動く



## 1. key frame設定

```css


/*
 動画：
　動画もtransitionと似ている、要素の動的効果の実現ができる。
　違い：transitionは必ずあるプロパーティの値が変化する場合にのみ発生；
　　　　動画は、自動的に動的効果を発生することが可能

　動画効果を実現するには、先ずキーフレームを設定すべき。キーフレームは動画の手順の定め
*/
@keyframes test{
    /* 開始位置。 0%も指定可*/
    from{
        margin-left: 0px;
    }
    
    /* 終了位置. 100%も指定可*/
    to{
        margin-left: 700px;
    }
}



```



## 2. 動画をdivに指定

![image-20200719111231248](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719111231248.png)

```html
<!DOCTYPE html>
<html lang="en">
<header>
    <title>盒子旋转</title>
    <style>

        .box1{
            width: 800px;
            height: 800px;
            background-color: silver;
        }

        .box1 div{
            width: 100px;
            height: 100px;
        }

        .box2{
            background-color: #bfa;

            /*
            设置box2的动画
            animation-name：设置当前元素生效的关键帧的名字
            */
            animation-name: test;
            
            animation-duration: 4s;

            /*动画延时 （过多长时间之后才开始）*/
            /* animation-delay: 2s; */

            /**/
            /* animation-timing-function: ; */
            /* animation-timing-function: ease-in-out; */

            /*动画执行的次数
                可选值：   次数， infinite：无限执行
            */
            /* animation-iteration-count: 2; */
            animation-iteration-count: 2;

            /* animation-direction: normal; 
                执行动画运行的方向
                  normal    默认值 from->to
                  reverse   反向   to->from
                  alternate from->to 重复执行时是反向执行（to->from)
                  alternate-reverse  to->from 重复执行时反向执行(from->to)
            */
            animation-direction: alternate;

            /* animation-play-state: running; */
            animation-play-state: running;

            /* animation-fill-mode: none; 
                动画的填充模式
                  none    动画执行完毕元素回到原来位置
                  forwards 动画执行完毕元素会停止在动画结束的位置
            */
            animation-fill-mode: forwards;
        }

        .box1:hover div{
            animation-play-state: paused;
        }


        /*
        动画
          动画和过渡类似，都是可以实现一些动态效果
            不同点：
              过渡 - 需要在某个属性发生变化时才会触发
              动画 - 可以自动触发动态效果

          设置动画效果，必须先要设置一个关键帧，关键帧设置了动画执行的每一个步骤
        */
        @keyframes test{
            /*动画开始位置 也可以用0%表示*/
            from{
                margin-left: 0px;
            }

            /*动画结束位置 也可以用100%表示*/
            to{
                margin-left: 700px;
            }
        }
    </style>
</header>

<body>

    <div class="box1">
        <div class="box2"></div>
    </div>
</body>
</html>
```

![image-20200719112840220](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719112840220.png)



■　練習 



**sprite animation**

![image-20200719113055533](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719113055533.png)



<img src="C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719113448284.png" alt="image-20200719113448284" style="zoom: 150%;" />

![image-20200719113720903](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719113720903.png)



![](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200718191813165.png)

![image-20200719114353710](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719114353710.png)

![image-20200719114459414](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719114459414.png)



### キーフレーム

![image-20200719114808877](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719114808877.png)

![image-20200719115004016](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719115004016.png)

**ボールが下落する動画を作成**

※ animation-xxx 追加

![image-20200719115230201](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719115230201.png)

![image-20200719115340255](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719115340255.png)



![image-20200719115512826](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719115512826.png)



**弾力を実現**

![image-20200719115854934](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719115854934.png)

![image-20200719120119710](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719120119710.png)

![image-20200719120203368](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719120203368.png)

![image-20200719120352321](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719120352321.png)



複数のボール

![image-20200719120713807](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719120713807.png)

![image-20200719120910851](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719120910851.png)

![image-20200719121033294](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719121033294.png)

![image-20200719121108350](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719121108350.png)





## 3. x軸・y軸平移 transform  



![image-20200719121353132](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719121353132.png)

![image-20200719121411994](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719121411994.png)

※変形　DIVの形を変化させる。

![image-20200719122558199](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719122558199.png)



**変形**：　

- CSSで要素の形状や位置を変えること。
- 画面のレイアウトには影響無し。

```css
transform: xxx;
```

![image-20200719122314296](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719122314296.png)

![image-20200719122328526](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719122328526.png)



![image-20200719122752061](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719122752061.png)



![image-20200719123157407](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123157407.png)

![image-20200719123352033](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123352033.png)

![image-20200719123430507](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123430507.png)



![image-20200719123638929](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123638929.png)

![image-20200719123722382](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123722382.png)

![image-20200719123824019](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719123824019.png)



![image-20200719124115578](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719124115578.png)



![image-20200719124226030](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719124226030.png)



## 4. Z軸平移

![image-20200719124851346](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719124851346.png)

![image-20200719124905378](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719124905378.png)

※Z軸は**perspective環境**じゃないと効果発揮されない

![image-20200719125719976](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719125719976.png)

![image-20200719125743196](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719125743196.png)

※マウスがbody上にくると、矩形が大きくなったように見える。

実は大きくなったのではなく、近くなったので、大きく見える。



デフォルトで軸が回転されてない場合、上記の効果。

軸が回転されたら、それぞれの方向へ向かう。



## 5. 回転 rotation

```css
transform: rotateX() rotateY() rotateZ();

```

![image-20200719130330053](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719130330053.png)

![image-20200719130347483](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719130347483.png)

※Z軸を中心に回転



```css
transform: rotateZ(45deg);   // 45度
transform: rotateZ(.5turn);  // 半回転

```

![image-20200719130712682](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719130712682.png)

![image-20200719130731369](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719130731369.png)



![image-20200719131021847](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719131021847.png)

**rotateY(180deg)：Y軸を中心に180度回転。 Z軸は一緒に方向が変わる**

![image-20200719131239470](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719131239470.png)

※順番関係あり。



![image-20200719131545275](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719131545275.png)

```css
backface-visibility: hidden;   //背面は見せない。　180度回転すると、背面が見えないのでなくなる
```

### 練習　時計

![image-20200719132323517](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719132323517.png)

![image-20200719132342015](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719132342015.png)



![image-20200719132712294](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719132712294.png)

![image-20200719132734107](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719132734107.png)

※回転するのは秒針ではなく、コンテナーのdivである。

コンテナーdivが回転すると、中の要素は一緒に回転する。

## 6. 盒子旋转动画

![image-20200719133900402](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719133900402.png)

![image-20200719133918432](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719133918432.png)

![image-20200719134007923](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134007923.png)

![image-20200719134021893](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134021893.png)



![image-20200719134106296](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134106296.png)

![image-20200719134126438](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134126438.png)

![image-20200719134225131](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134225131.png)

![image-20200719134237395](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134237395.png)

![image-20200719134347131](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134347131.png)

![image-20200719134359118](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134359118.png)

![image-20200719134520963](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134520963.png)

![image-20200719134534129](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134534129.png)

![image-20200719134749838](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134749838.png)

![image-20200719134802303](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719134802303.png)

![image-20200719135119835](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135119835.png)

box3 : 上    box4: 下の面

![image-20200719135300330](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135300330.png)

![image-20200719135318777](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135318777.png)

![image-20200719135449685](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135449685.png)

![image-20200719135504293](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135504293.png)

box5: 手前     box6: 背面



![image-20200719135624644](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135624644.png)



![image-20200719135640481](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135640481.png)

![image-20200719135905753](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135905753.png)

![image-20200719135919903](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719135919903.png)



![image-20200719140312107](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140312107.png)

![image-20200719140326571](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140326571.png)

![image-20200719140428053](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140428053.png)

![image-20200719140455021](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140455021.png)



親に動画を作成

```css
@keyframes rotate{
    from{
        transform: rotateX(0) rotateZ(0)
    }
    from{
        transform: rotateX(1turn) rotateZ(1turn)
    }
}
```



![image-20200719140733200](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140733200.png)

![image-20200719140747901](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140747901.png)

![image-20200719140844432](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719140844432.png)

↑ ずっと平均速度で回転する効果。



## 7. 缩放

![image-20200719141301991](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719141301991.png)

![image-20200719141318341](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719141318341.png)

```css
transform: scaleX(.2);    /* 縮小 */
※ scaleX() / scaleY() / scale()
```

![image-20200719141505481](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719141505481.png)



![image-20200719141950678](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719141950678.png)

![image-20200719142007257](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719142007257.png)

![image-20200719142219364](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719142219364.png)

![image-20200719142311723](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719142311723.png)



![image-20200719142427775](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719142427775.png)

![image-20200719145934636](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719145934636.png)

![image-20200719150019837](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719150019837.png)

![image-20200719150047021](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719150047021.png)









# @media 媒体查询

```css
/*
* @media xxx {}
*     all / print / screen / speech
*/
@media all{
    body{
        background-color: #bfa;
    }
}

@media only screen{
    /* screenのみ。     onlyあってもなくてもOK。　古いバージョンのブラウザ用 */
}
```

![image-20200719084412532](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719084412532.png)



![image-20200719085820478](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719085820478.png)

![image-20200719090117489](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719090117489.png)



## 練習

![image-20200719091204803](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719091204803.png)



※先にモバイル用CSSを作成し、少しずつPC用を作成するか、　先にPC用CSS作成し、少しずつモバイル用を作成するか、どっちでもOK。

※ただ、モバイルで利用するユーザが多いので、モバイル優先にした方がいいかも。







# ↑ CSS   vs  ↓ less

# less : CSSのプレー処理言語

■ CSS的预处理语言

■ less：CSS的增强版，通过less编写更少的代码实现更强大的样式。

​              添加了很多新特性，例如变量支持，对mixin的支持。。。

​              语法大体和CSS语法一样， 但是扩展了很多CSS，所以浏览器无法直接识别，需要预处理

![image-20200719081944096](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719081944096.png)



## 1. CSSの弱点

**CSSも変数サポート  IE11では非サポート**

![image-20200719080804299](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719080804299.png)

※ IE11でもサポートされてない(2020.07.19時点)



```css
.box1{
    width: calc(200px/2);    // 自動的に計算
}

※IE11では非サポート
```

![image-20200719081248349](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719081248349.png)



**※CSSでも協力な機能はあるが、今の時点ではまだ良いサポートがない。**

## 2. 使い方

### Easy less

![image-20200719082138918](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719082138918.png)



![image-20200719082625252](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719082625252.png)



![image-20200719082943209](C:\Users\jdr-torutori\AppData\Roaming\Typora\typora-user-images\image-20200719082943209.png)



※　**xxx.lessを記述　→保存→　CSSに変換してくれる。**



## 3. less: 変数定義







## less復習

### 1. lessの継承

```less
#test{
    &:extend(.father)
}

#test:extend(.father){
    
}

继承实质上将.father选择器和#test组合成一个选择器，声明块使用.father的
all:继承所有和.father相关的声明块
切记父类不能定义成混合器（继承不灵活性能高 混合灵活性低）


```

### 2. less的避免编译

~"不会编译的内容"

变量在less中属于块级作用域，延迟加载
