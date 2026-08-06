# WinUI3 / C++/winRT
### Index  
[核心特性对比清单，将传统C++的痛点与C++11的改进进行直观对比](#核心特性对比清单将传统c的痛点与c11的改进进行直观对比-sec0)  
[c++/WinRT头文件包含清单速查表](#cwinrt头文件包含清单速查表--sec00)  
[XAML核心知识](#xaml核心知识--sec01)  
[XAML资源定义及使用](#xaml资源定义及使用-sec02)  
[创建并显示新窗口](#创建并显示新窗口-sec021)  
[怎么知道控件的某个属性是什么类型？](#怎么知道控件的某个属性是什么类型-sec03)  

  
--------------------------------------------------------------------------------------------------------------  


[常用的命名空间](#cwinrt开发winui-3应用程序时常用的命名空间--sec1)  
[生成应用程序](#アプリ生成-sec2)  
[TextBlock](#textblock-sec3)  
[メモリデータ　→　UI bind](#メモリデータui-sec4)  
[debug文言出力 / hstring型生成→伝統文字列への変換](#debug文言出力--hstring型生成伝統文字列への変換-sec5)  
[ラジオボタン](#ラジオボタン-sec6)  
[Borderの色設定](#borderの色設定-solidcolorbrush--colors-sec7)  
[テキストボックス　＆　ボタン](#テキストボックスボタン-sec8)  
[コンテントダイヤログ(modal)](#コンテントダイヤログmodal-sec9)  
[コンポボックス](#コンポボックス-sec10)  
[MainWindow.idl](#mainwindowidl-sec11)  
[取得HWND](#取得hwnd-sec12)  
[窗体大小设定，移动，获取工作区大小，窗体居中](#窗体大小设定移动获取工作区大小窗体居中-sec13)  
 
  
    
--------------------------------------------------------------------------------------------------------------  


#### Win2D
[Win2D安装](#win2d安装-sec201)  
[xaml使用指定命名空间(Win2D CanvasControl的使用)](#xaml使用指定命名空间win2d-canvascontrol的使用sec202)  
[Win2D Draw()画图方法](#win2d-draw画图方法-sec203)  
  
--------------------------------------------------------------------------------------------------------------

  
## ■核心特性对比清单，将传统C++的痛点与C++11的改进进行直观对比 {#sec0}  
|特性           |传统C++(C++98/03)          | C++11改进                | 优势/说明
|---           |---                        |---                      |---
|变量初始化      |int a+ 10;或int a(10);     | int a{ 10 };            | 统一初始化语法，防止隐式类型变窄转换
|类型推导       | 必须显示写出类型 std::vector<int>::iterator it = ...   | auto it = ... | 编译器自动推导类型，代码更简洁，特别是处理复杂模板时  
|空指针         |使用 NULL (本质是宏定义 0 )  | 使用 nullptr             | 彻底解决 NULL 在函数重载时引发的二义性问题  
|常量定义       | 是用 #define MAX 100      | 使用 constexpr int MAX = 100; | 支持编译器计算，具有明确的作用域和类型安全  
  
### ■面向对象与类设计  
|特性           |传统C++(C++98/03)          | C++11改进                | 优势/说明
|---           |---                        |---                      |---
|构造函数       | 容易触发“最令人头痛的解析”    | 支持 {}列表初始化         | 明确对象构造，支持委托构造函数和继承构造函数
|成员默认值     | 只能在构造函数中赋值          | 支持类内直接初始化 int x = 0;| 减少构造函数代码冗余，逻辑更清晰
|虚函数重写     | 容易因拼写错误导致隐藏而非重写 | 使用 override 关键字      | 编译器强制检查，避免意外错误
|禁止重写/继承   | 无法在语法层面限制           | 使用 final 关键字        | 明确表达设计意图，有助于编译器优化  
  
### ■现代编程范式（核心亮点）  
|特性           |传统C++(C++98/03)          | C++11改进                | 优势/说明
|---           |---                        |---                      |---
|右值引用        | 只有左值引用 T&            | 引入右值引用 T&&          | 配合移动语义（Move Semantics)避免了深拷贝，极大提升性能
|智能指针        | 手动 new/delete，极易内存泄漏| std::unique_ptr, std::shared_ptr| 自动管理内存生命周期，RAII思想的最佳实践
|Lambda表达式   | 需要单独定义仿函数 (Functor) | [](int x){ return x+1; }| 支持匿名函数，极大地方便了STL算法的使用
|范围for循环    | for(int i=0; i<vec.size(); i++){} | for( auto& x : vec){} | 语法机器简洁，杜绝越界访问  
  
### ■标准库增强  
|特性           |传统C++(C++98/03)          | C++11改进                | 优势/说明
|---           |---                        |---                      |---
|哈希表         | 没有标准哈希容器            | std::unordered_map / set | 查找时间复杂度从 O(log n)降至平均O(1)
|多线程支持     | 依赖平台API（如pthread, Win32) | std::thread, std::mutex | 原生跨平台多线程支持
|并发辅助       | 手动管理线程同步            | std::future, std::promise | 简化异步编程和线程间数据传递
  
--------------------------------------------------------------------------------------------------------------  
  
  
# c++/WinRT头文件包含清单速查表  {#sec00}
在C++/WinRT开发中，准确包含头文件时避免编译错误的关键。  
C++/WinRT采用“投影”机制，将Windows运行时类型映射为标准的C++类型。  
一下清单按命名空间分类，列出了常用API对应的头文件及核心注意事项。  


#### ■常用命名空间头文件对照表  

|Windows运行时命名控件          |C++/WinRT投影头文件                             |典型用途
|---                          |---                                           |---
|Windows::Foundation          | <winrt/Windows.Foundation.h>                  | URI, IAsyncAction, IAsyncOperation, HString, Guid等基础类型
|Windows::Foundation::Collections | <winrt/Windows.Foundation.Collections.h> | PropertySet, IVector, IMap等集合接口
|Windows::UI::Core            | <winrt/Windows.UI.Core.h>                    | CoreWindow, CoreDispatcher等UI线程调度
|Windows::UI::Xaml            | <winrt/Windows.UI.Xaml.h>                    | XAML框架基础类型（如 DependencyObject)
|Windows::UI::Xaml::Controls  | <winrt/Windows.UI.Xaml.Controls.h>           | Button, TextBlock, ListView等UI控件
|Windows::UI::Xaml::Data      | <winrt/Windows.UI.Xaml.Data.h>               | 数据绑定相关（如 INotifyPropertyChanged)
|Windows::Storage             | <winrt/Windows.Storage.h>                    | 文件系统访问（如 StorageFile, StorageFolder)
|Windows::Storage::Streams    | <winrt/Windows.Storage.Streams.h>            | 数据流操作（如 IBuffer, DataReader, DataWriter)
|Windows::Web::Syndication    | <winrt/Windows.Web.Syndication.h>            | RSS/Atom订阅解析
|Windows::Security::Cryptography| <winrt/Windows.Security.Cryptography.h>    | 加密基础类型
|Windows::Security::Cryptography::Certificates | <winrt/Windows.Security.Cryptography.Certificates.h> | 证书管理
|Microsoft::UI::Windowing     | <winrt/Microsoft.UI.Windowing.h>             | AppWindow, 窗口管理（WinUI 3）
|Microsoft::UI::Xaml          | <winrt/Microsoft.UI.Xaml.h>                  | WinUI 3框架基础
|Microsoft::UI::Xaml::Controls | <winrt/Microsoft.UI.Xaml.Controls.h>        | WinUI 3控件
|Microsoft::UI::Composition   | <winrt/Microsoft.UI.Composition.h>           | 视觉层合成（WinUI 3)
  

#### ■核心使用原则
1. 显式包含，拒绝隐式依赖  
   尽管某些头文件（如 Windows.Foundation.Collections.h）可能隐式包含 Windows.Foundation.h， 但这属于实现细节，会随SDK版本变化。  
   **必须显式包含代码中直接使用的每一个命名控件对用的头文件。**  
   例如， 若方法返回 IBuffer，即使当前文件未直接使用 Windows::Storage::Streams 中的其他类型，也必须包含 <winrt/Windows.Storage.Streams.h>  


2. 头文件命名规则  
   C++/WinRT投影头文件的命名与Windows运行时命名空间完全一致，仅将 :: 替换为 /，并添加 .h 后缀。  
   例如：  
   - Windows::Foundation::Collections::PropertySet     ->    <winrt/Windows.Foundation.Collections.h>
   - Microsoft::UI::Windowing::AppWindow              ->     <winrt/Microsoft.UI.Windowing.h>  

3. 预编译头文件优化  
   将常用的C++/WinRT头文件（如 Windows.Foundation.h, Windows.UI.Xaml.h)添加到预编译头文件（pch.h）中，可显著减少增量编译时间。  
   但需注意：  
     预编译头文件仅用于提升构建效率，**不能替代源文件中对特定命名控件头文件的显式包含。**  
     
4. 区分投影类型与实现类型  
   - 消费API： 操作Windows运行时对象（如 AppWindow，StorageFile）时，只需包含对应的 winrt/ 投影文件。  
   - 实现API： 自定义运行时类时，需使用 cppwinrt.exe 生成实现头文件（如 MyClass.h)， 并包含 <winrt/base.h> 或 <winrt/Windows.Foundation.h> 作为基础依赖。  

5. 命名控件使用规范  
   - using namespace winrt; 和 using namespace Windows::Foundation; 等指令时可选的， 但能简化代码。  
   - 避免在 winrt::impl 命名空间中定义任何内容，该命名空间为C++/WinRT内部保留。  
   - 在 winrt 子命名空间中，以大写字母开头的名称可供应用定义和使用； 以小写字母开头的名称属于C++/WinRT内部实现，应用不应定义但可使用（如 winrt::is_guid_of）  

6. 混合编程注意事项  
   若项目同时使用C++/WinRT与C++/CX， 需安装 Microsoft.Windows.CppWinRT NuGet包，并在预编译头文件中包含 <winrt/Windows.Foundation.h> （会自动包含 winrt/base.h）。  
   为避免命名冲突，建议使用命名空间别名（如 namespace cx = Windows::Foundation; namespace winrt = winrt::Windows::Foundation;)  

#### ■头文件查找路径  
C++/WinRT投影头文件默认位于：  
%WindowsSdkDir%\Include\\\<WindowsTargetPlatformVersion>\cppwinrt\winrt\  

  
Visual Studio会自动将该路径添加到 IncludePath 宏中。  
若项目通过 cppwinrt.exe 生成了自定义头文件，它们会被输出到 $(GeneratedFilesDir)文件夹，编译器会优先从该位置加载。  



--------------------------------------------------------------------------------------------------------------  



# XAML核心知识  {#sec01}  
## 1.核心设计理念： UI与逻辑分离  
XAML最大的优势在于实现了“关注点分离”。  
他允许开发者使用XAML来定义界面的外观，布局和交互元素，而将底层的业务逻辑和运行时行为交由C#或VB等后台代码（Code-behind）来实现。  

## 2.基本语法结构  

XAML基于XML规范，因此有效的XAML必须是有效的XML。其文件通常以 .xaml 为扩展名。  
 - 对象元素： XAML中的每个标签通常对应一个 .NET类的实例化。例如， \<Button />会在运行时创建一个Button类的对象。  
 - 属性设置： 可以通过属性语法（如 Background="Blue")直接为对象赋值，也可以使用属性元素语法（如 \<Button.Background>\<SolidColorBrush Color="Blue"/></Button.Background>)  
 - 命名空间： 通过 xmlns 属性引入不同的命名空间，以区分内置控件，自定义控件以及XAML语言本身的关键字（通常使用 x:前缀，如 x:Class）。  

## 3.运行机制  
XAML本身并不是用来执行复杂计算或逻辑判断的编程语言，而是一种描述性语言。  
当应用程序运行时，XAML解析器会读取这些标记文件，将其转换为对应的 .NET对象树（元素树），并自动设置相应的属性值。  
同时，通过 x:Class 属性和 InitializeComponent()方法，XAML定义的UI会与后台的C#代码紧密绑定在一起，实现事件（如 按钮点击）的相应。  

## 4.核心功能与特性  
除了基础的界面搭建，XAML还提供了一系列强大的功能来构建丰富的应用：  
  
 - 数据绑定（Data Binding）：  
     支持将UI元素与数据源动态绑定，当底层数据发生变化时，界面会自动更新，这也是 MVVM架构的基础。  

 - 样式与模板（Style & Teplates）:  
     允许集中定义控件的外观，实现全局主题的统一，并能深度自定义控件的内部结构。  

 - 资源管理（Resources）：   
     支持将画刷，样式等可复用对象提取为资源，在应用的不同位置重复使用，减少代码冗余。  

 - 动画与变换（Animations & Transformations）：  
     内置了强大的动画系统，可以通过纯标记语言实现平滑的视觉过渡效果。  

 - 丰富的布局系统：  
    提供如 Grid，StackPanel等布局容器，帮助开发者以结构化，响应式的方式排列UI元素。  
  

## 5.开发工具支持  
通常使用Viasual Studio等IDE。  
这些工具提供了可视化的XAML设计器，代码自动完成（Intellisense）以及实现预览功能，使得编写和调试XAML变得更加只管和高效。

--------------------------------------------------------------------------------------------------------------  
  
# XAML资源定义及使用 {#sec02}  

### 1. 外部资源文件 Styles/MyStyles.xaml
```xml
<!-- MyStyles.xaml -->

<?xml version="1.0" encoding="utf-8"?>
<ResourceDictionary
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:JDRDemo">

    <!-- 资源定义集中在此文件里定义，然后在 app.xaml里引用，从而成为APP级别资源 -->

    <x:Double x:Key="MarginFromMyStyles">32</x:Double>
</ResourceDictionary>
```  
  
### 2. 全局资源 App.xaml
```xml
<!-- App.xaml -->

<?xml version="1.0" encoding="utf-8"?>
<Application
    x:Class="JDRDemo.App"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:JDRDemo">
    
    <Application.Resources>
        <ResourceDictionary>
            
            <!-- 合并系统默认控件资源（WinUI 3必须） -->
            <ResourceDictionary.MergedDictionaries>
                <XamlControlsResources xmlns="using:Microsoft.UI.Xaml.Controls" />
                <!-- Other merged dictionaries here -->
                
                <!-- 进阶技巧：合并外部资源字典
                       当资源非常多时，建议将资源拆分到独立的XAML文件中（e.g. Styles/MyStyles.xaml)，
                       然后在 App 或 Window 中通过 MergedDictionaries 引入，以保持代码整洁。
                     
                     ※资源查找优先级： 
                         WinUI3会按照  当前控件 -> 父级控件 -> Window根容器 -> App.xaml 的顺序向上查找资源。
                         如果同名资源在不同层级存在，距离当前控件最近的资源会优先生效。
                -->
                <!-- 引入自定义的外部资源 -->
                <ResourceDictionary Source="ms-appx:///Styles/MyStyles.xaml" />
            </ResourceDictionary.MergedDictionaries>
            
            <!-- Other app resources here -->
            
            <!-- 自定义全局资源 -->
            <SolidColorBrush x:Key="PrimaryBrush" Color="#0078D4" />
            <x:Double x:Key="StandardMargin">16</x:Double>
        </ResourceDictionary>
    </Application.Resources>
    
</Application>
```  

### 3. Window级别资源 - 定义在自己 xaml文件的根容器中
```xml
<!-- MainWindow.xaml -->

<?xml version="1.0" encoding="utf-8"?>
<Window
    x:Class="JDRDemo.MainWindow"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:JDRDemo"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:canvas="using:Microsoft.Graphics.Canvas.UI.Xaml"
    mc:Ignorable="d"
    Title="JDRDemo">

    <Grid x:Name="rootGrid">

        <!-- 将资源放在 Window内部的根容器中 -->
        <Grid.Resources>
            <ResourceDictionary>
                <SolidColorBrush x:Key="LocalAccentBrush" Color="#FF0000" />
            </ResourceDictionary>
        </Grid.Resources>
        
        <!-- 使用资源 -->
        <!--
          如何使用这些资源： 配置好资源后，可以通过以下方式在XAML中引用它们：
          使用 ThemeResource
            适用于需要 在运行时动态响应系统主题切换（如浅色/深色模式切换）的资源。
            WinUI3强烈建议对 前景色，背景色等使用此标记扩展。
        -->
        <StackPanel Orientation="Vertical">
            <!-- 使用app.xaml中定义的 StandardMargin -->
            <Button Margin="{ThemeResource StandardMargin}" Content="My Button1" />
            <Button Margin="{ThemeResource MarginFromMyStyles}" Content="My Button2" />
            
            <!-- 使用app.xaml中定义的 PrimaryBrush -->
            <TextBlock Text="TextBlock1" Foreground="{ThemeResource PrimaryBrush}" />
        
            <!-- 使用本地定义的 LocalAccentBrush -->
            <TextBlock Text="TextBlock2" Foreground="{ThemeResource LocalAccentBrush}" />

            <Button x:Name="myBtn3" Content="My Button3"/>
        </StackPanel>

    </Grid>
</Window>

```  

### 4. 在C++代码中获取资源（Window级别，App级别，外部资源文件）
```C++
// MainWindow.xaml.cpp

namespace winrt::JDRDemo::implementation
{
    MainWindow::MainWindow()
    {
        InitializeComponent();  // 必须

        // 获取资源
        /*
        * 1. 获取 Window 级别的资源
        *    Window 级别的资源定义在根布局容器（如 Grid）中。要访问它们，需要先获取该容器的引用，然后调用 Resources().Lookup()方法。
        */

        // Grid在XAML中定义为 <Grid x:Name="rootGrid">
        auto resourceDict = rootGrid().Resources();
        auto value = resourceDict.Lookup(winrt::box_value(L"LocalAccentBrush"));      // 查找资源
        auto brush = value.as<winrt::Microsoft::UI::Xaml::Media::SolidColorBrush>();  // 转换为期望的类型

        myBtn3().Foreground(brush);  // 动态设置前景色

        /*
        * 2. 获取 App 级别（全局）的资源
        *    App 级别的资源定义在 App.xaml 中。通过 Application::Current().Resources() 直接访问。
        */
        auto appResources = winrt::Microsoft::UI::Xaml::Application::Current().Resources();
        auto stdMargin = appResources.Lookup(winrt::box_value(L"StandardMargin"));               // 查找全局资源

        // 拆箱并转换为具体类型（如 x:Double)
        // 注：不是double类型时会抛出异常。如果不确定资源是否存在或类型，建议使用更安全的 unbox_value_or
        //     e.g.:
        //       double margin = winrt::unbox_value_or<double>(stdMargin, 0.0);  // 如果转换失败，返回默认值 0.0
        double margin = winrt::unbox_value<double>(stdMargin);

        myBtn3().Content(winrt::box_value(margin));

        /*
        * ※关键注意事项
        *   1. 处理键不存在的情况：
        *        Lookup()方法在找不到指定的 Key 时，不会抛出异常， 而是返回一个空的 IInspectable。
        *        如果直接对空值进行 as<> / unbox_value<> 会导致运行时崩溃。建议先检查返回值是否为空。
        *
        *        auto value = appResources.Lookup(winrt::box_value(L"SomeKey"));
        *        if (value) {}
        * 
        *   2. 合并字典的查找：
        *        如果资源是通过 MergedDictionaries 引入的，直接在主 ResourceDictionary 上调用 Lookup 依然可以正常找到它们。
        *        WinUI3的运行时字典查找机制会自动遍历合并的字典。
        * 
        *   3. 运行时修改的局限性：
        *        在运行时通过代码向 ResourceDictionary 中添加或修改的资源，不会 自动触发已经加载的XAML元素的UI更新。
        *        XAML的资源解析 仅在 页面首次加载 或 主题切换时 发生。
        * 
        */

    }

}
```  

# 创建并显示新窗口 {#sec021}  
  
弹出一个新的独立窗体（Window）需要“添加XAML项”，“编写后台代码”，“在主页触发”三个步骤。  
### 1. 添加新的Window项
右键项目 -> 添加 -> 新建项 -> WinUI -> 空白窗口（Blank Window, WinUI 3)。  
  
```xml
<!-- JDRSettings.xaml -->

<?xml version="1.0" encoding="utf-8"?>
<Window
    x:Class="JDRDemo.JDRSettings"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:JDRDemo"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    Title="JDRSettings">

    <Grid>

    </Grid>
</Window>
```  

### 2. 编写后台代码
```C++
// MainWindow.xaml.cpp

#include "JDRSettings.xaml.h"  // 引入新窗口的头文件

void winrt::JDRDemo::implementation::MainWindow::OpenSettingsBtn_Click(winrt::Windows::Foundation::IInspectable const& sender, 
                                                                       winrt::Microsoft::UI::Xaml::RoutedEventArgs const& e)
{
    /* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    * 打开 非模态窗口（可以同时操作原窗口和新窗口）。 
    */

    // 1. 创建新窗口的实例
    auto settingsWindow = winrt::make<JDRSettings>();

    // 2. 绑定窗口的 Closed 事件
    //auto mainWindow = App::MainWindow();
    //if (mainWindow)
    //{
    //    auto appWindow = mainWindow.AppWindow();
    //    appWindow.Show();
    //    appWindow.MoveInZOrderAtTop();
    //    mainWindow.Activate();
    //}

    // 3. 激活并显示窗口（必须）
    settingsWindow.Activate();  // 进入激活状态(Z-Order不变）操作Z-Order使用 AppWindow#MoveInZOrderAtTop()

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    /*
    *  进阶： 打开 模态窗口 （必须先关闭新窗口才能操作主窗口）
    *  
    *    ※WinUI3桌面应用目前没有 ShowDialog()方法。
    *      通常的做法是使用 ContentDialog 替代新窗口， 或者如果必须使用独立窗口，可以通过禁用主窗口来模拟模态。
    * 
    *    注意： WinUI3桌面应用一般建议设置页使用 ContentDialog 或 NavigationView 侧边栏，而不是独立 Window。
    * 
    *    轻量级的页面，推荐做法是 不要使用独立Window， 而是将其作为一个 Page， 放在主窗口的 Frame中通过 Navigate 进行切换。
    */
    this->Close();  // 关闭主窗口（MainWindow)  返回时，重新 Activate()就可以回到主窗口
}
```  


--------------------------------------------------------------------------------------------------------------  

# 怎么知道控件的某个属性是什么类型？ {#sec03}  

(用 winrt::Microsoft::UI::Xaml::Controls 检索)  
https://learn.microsoft.com/ja-jp/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.controls.button?view=windows-app-sdk-1.7

## C++/WinRT开发WinUI 3应用程序时，常用的命名空间  {#sec1}
```C++
C++/WinRT开发WinUI 3应用程序时，常用的命名空间包括：

*   `winrt`:                         这是C++/WinRT的根命名空间，包含了WinRT类型和接口的定义，例如`winrt::hstring`、`winrt::IInspectable`等。
*   `Windows::UI::Xaml`:             包含XAML相关的类型和接口。
*   `Windows::UI::Xaml::Controls`:   包含WinUI 3控件的类型和接口，例如`Button`、`TextBox`等。
*   `Windows::UI::Xaml::Media`:      包含XAML中使用的媒体类型和接口，例如`Brush`、`Image`等。
*   `Windows::UI::Xaml::Navigation`: 包含XAML中使用的导航类型和接口，例如`Frame`、`Page`等。
*   `Windows::UI::Xaml::Input`:      包含XAML中使用的输入类型和接口，例如`TextBox`、`Button`等。
*   `Windows::UI::Core`:             包含WinUI 3核心类型和接口，例如`Application`、`Window`等。
*   `winrt::Windows::Storage`:       包含存储类型和接口，例如`winrt::Windows::Storage::StorageFile`、`winrt::Windows::Storage::StorageFolder`等。
*   `winrt::Windows::Networking`:    包含网络类型和接口，例如`winrt::Windows::Networking::Sockets::Socket`、`winrt::Windows::Networking::Connectivity::NetworkInterface`等。
*   `winrt::Windows::Security`:      包含安全类型和接口，例如`winrt::Windows::Security::Credentials::PasswordCredential`、`winrt::Windows::Security::Authentication::AuthenticationBroker`等。

不可以用的命名空间包括：

*   `System`:                  这是WPF开发中使用的命名空间，不能直接在C++/WinRT中使用。
*   `System.Windows`:          这是WPF开发中使用的命名空间，不能直接在C++/WinRT中使用。
*   `System.Windows.Controls`: 这是WPF开发中使用的命名空间，不能直接在C++/WinRT中使用。
*   `System.Windows.Media`:    这是WPF开发中使用的命名空间，不能直接在C++/WinRT中使用。
*   `System.Windows.Input`:    这是WPF开发中使用的命名空间，不能直接在C++/WinRT中使用。

注意：虽然不能直接使用WPF的命名空间，但在某些情况下，可以使用WPF的类型和接口，但需要使用`Windows::UI::Xaml::Interop`命名空间中的类型和接口来转换和使用。

例如，  
`System.Windows.Controls.Button`可以使用  
`Windows::UI::Xaml::Interop::Button`类型来转换和使用。
```
  
--------------------------------------------------------------------------------------------------------------  


# アプリ生成 {#sec2}
## 1. xxx.vcproj
```xml
<AppxPackage>false</AppxPackage>
<WindowsPackageType>None</WindowsPackageType>
```
## 2. Tools > NuGet Package Manager > Manage NuGet Packages for solution
Updates配下のすべてを最新版に

## 3. download Windows App SDK 1.6xxx (Option)
https://learn.microsoft.com/ja-jp/windows/apps/windows-app-sdk/downloads

# Window type
runtimeclass MainWindow : Microsoft.UI.Xaml.Window
  
--------------------------------------------------------------------------------------------------------------  


# TextBlock {#sec3}
```xml
<TextBlock Text="{x:Bind MyProperty}" />
```

# ボタン文言設定
```c++
myButton().Content(box_value(L"Clicked"));
```
### *remember: XAML name is "colorPanel" -> ソース上では"colorPanel()"で取得する。 
  
--------------------------------------------------------------------------------------------------------------  


# メモリデータ　→　UI {#sec4}
·xaml
```xml
<TextBlock Text="{x:Bind MyProperty}" />
```

```C++
void MainWindow::MyProperty(int32_t value)
{
    this->propertyValue = value;
    this->Bindings->Update();
}
```
  
--------------------------------------------------------------------------------------------------------------  


# debug文言出力 / hstring型生成→伝統文字列への変換 {#sec5}
```C++
OutputDebugString(L"Property value updated to: ");
OutputDebugString(winrt::to_hstring(propertyValue).c_str());
OutputDebugString(L"\r\n");
``` 
  
--------------------------------------------------------------------------------------------------------------  


# ラジオボタン {#sec6}
# Border / RadioButton
```xml 
<!-- Epsode2 -->
<StackPanel Orientation="Vertical">
    <Border x:Name="colorPanel" Width="64" Height="64" CornerRadius="32" />
    <RadioButton x:Name="yellowButton" Content="Yellow" Checked="yellowButton_Checked" />
    <RadioButton x:Name="blueButton" Content="Blue" Checked="blueButton_Checked" />
    <RadioButton x:Name="redButton" Content="Red" Checked="redButton_Checked" />
</StackPanel>
```
  
--------------------------------------------------------------------------------------------------------------  


# Borderの色設定 SolidColorBrush / Colors {#sec7}
```C++ 
colorPanel().Background(Microsoft::UI::Xaml::Media::SolidColorBrush{ Microsoft::UI::Colors::Yellow() });
```
### * SolidColorBrush - winrt::Microsoft::UI::Xaml::Media::SolidColorBrush
### * Colors - winrt::Microsoft::UI::Colors

# テキストボックス　＆　ボタン {#sec8}
# TextBox / Button
```xml 
<StackPanel Orientation="Vertical" Margin="20,0,0,0">
    <TextBox x:Name="nameBox" Header="Enter your name" Width="200" />
    <Button x:Name="sayHiButton" Content="Say Hi!" Click="sayHiButton_Click" />
</StackPanel>
```
  
--------------------------------------------------------------------------------------------------------------  


# コンテントダイヤログ(modal) {#sec9}
![コンテントダイヤログ](./img/epsode1/2024-11-18_124715.jpg)
# dialog: Microsoft::UI::Xaml::Controls::ContentDialog

```C++
private:
    winrt::fire_and_forget showMessage(hstring message);


winrt::fire_and_forget MainWindow::showMessage(hstring message)
{
    Microsoft::UI::Xaml::Controls::ContentDialog dlg{};

    /*
    * 注意事项：
    *   · 必须设置 XamlRoot： 在WinUI3桌面应用中，不设置XamlRoot会导致运行时异常。
    *                       从 Page 中显示时用 this->XamlRoot(); 
    *                       从Windows中显示时用 this->Content().XamlRoot()或给根元素命名后使用 rootPanel().XamlRoot()。
    *   · 同一窗口只能打开一个 ContentDialog： 尝试同时打开两个会抛出异常。
    *   · 确保至少有一个安全按钮： 如 “取消” 或 “关闭”，保证用户始终可以安全关闭对话框。
    *   · ShowAsync() 返回 ContentDialogResult： 枚举值包括 Primary, Secondary, None（点击关闭按钮或按ESC） 
    */
    dlg.XamlRoot(this->Content().XamlRoot());  // 現在WindowのContent Root

    dlg.Title(box_value(L"Greetings"));        // box_value(): c string to IInspectable type
    dlg.Content(box_value(message));
    dlg.CloseButtonText(L"Close");

    co_await dlg.ShowAsync(); // 最後にco_awaitを付ける
}

void MainWindow::sayHiButton_Click(winrt::Windows::Foundation::IInspectable const& sender, winrt::Microsoft::UI::Xaml::RoutedEventArgs const& e)
{
    if (nameBox().Text().empty()) {
        showMessage(L"Enter your name!");
        return;
    }//endif

    showMessage(hstring{ L"Hi, " + nameBox().Text() });
}

```
  
--------------------------------------------------------------------------------------------------------------  


# コンポボックス {#sec10}
```xml
<ComboBox x:Name="manualList" />
```
###### 値追加
```c++ 
int32_t manualIndex = 0;

manualIndex++;
manualList().Items().Append(box_value(hstring{ L"Item " + to_hstring(manualIndex) }));
```

### vectorでコンボボックス値管理
```xml 
<ComboBox x:Name="sourceList" Header="ItemsSource List" Width="200" />
<Button x:Name="addSourceItemBtn" Content="Add Item" Click="addSourceItemBtn_Click" />
```
```C++ 
int32_t sourceIndex = 0;
winrt::Windows::Foundation::Collections::IObservableVector<hstring> sourceArray{ winrt::single_threaded_observable_vector<hstring>() };

/// <summary>
/// constructorかLoadedイベントでvectorをコンボボックスにバインド
/// </summary>
MainWindow::MainWindow() {
    InitializeComponent();  // important!!!

    sourceList().ItemsSource(sourceArray);
}

void MainWindow::addSourceItemBtn_Click(winrt::Windows::Foundation::IInspectable const& sender, winrt::Microsoft::UI::Xaml::RoutedEventArgs const& e)
{
    sourceIndex++;

    sourceArray.Append(hstring{ L"Item " + to_hstring(sourceIndex) });
    if (sourceList().SelectedItem() == nullptr)
        sourceList().SelectedIndex(0);
}

### bindでコンボボックスに値追加

```xml 
<ComboBox x:Name="boundList" Header="Bound List" Width="200" ItemsSource="{x:Bind collection}"/>
<Button x:Name="addBoundItemBtn" Content="Add Item" Click="addBoundItemBtn_Click" />
```


```C++
private: 
    int32_t boundIndex = 0;
    winrt::Windows::Foundation::Collections::IObservableVector<hstring> boundArray{ winrt::single_threaded_observable_vector<hstring>() };

public:
    winrt::Windows::Foundation::Collections::IObservableVector<hstring> collection();

// ------------------- cpp
void MainWindow::addBoundItemBtn_Click(winrt::Windows::Foundation::IInspectable const& sender, winrt::Microsoft::UI::Xaml::RoutedEventArgs const& e)
{
    boundIndex++;
    boundArray.Append(hstring{ L"Item " + to_hstring(boundIndex) });

    if (boundList().SelectedItem() == nullptr)
        boundList().SelectedIndex(0);
}

///
/// collection()でboundArrayを返す
///
winrt::Windows::Foundation::Collections::IObservableVector<hstring> MainWindow::collection() {
    return boundArray;
}

```  
  
--------------------------------------------------------------------------------------------------------------  


### MainWindow.idl {#sec11}
```C++ 
namespace Epsode1
{
    [default_interface]
    runtimeclass MainWindow : Microsoft.UI.Xaml.Window
    {
        MainWindow();
        Int32 MyProperty;

        // XAMLのx:Bindで指定するgetter関数（public)
        Windows.Foundation.Collections.IObservableVector<String> collection{ get; };
    }
}
```
  
--------------------------------------------------------------------------------------------------------------  


## 取得HWND {#sec12}  
```C++
#include <microsoft.ui.xaml.window.h>

namespace winrt::PicViewer::implementation
{
    HWND MainWindow::getHwnd()
    {
        auto windowNative{ this->m_inner.as<::IWindowNative>() };

        HWND hWnd{ nullptr };
        windowNative->get_WindowHandle(&hWnd);

        return hWnd;
    }
}

void winrt::PicViewer::implementation::MainWindow::Open_Click(winrt::Windows::Foundation::IInspectable const& sender, 
                                                              winrt::Microsoft::UI::Xaml::RoutedEventArgs const& e)
{
    std::wostringstream ss;
    //ss << std::hex << this->getHwnd();                    // 0000000000320C3A
    ss << L"0x" << std::hex << (uintptr_t)this->getHwnd();  // 0x170ba0

    std::wstring wstr = ss.str();
    LPCWSTR hWndStr = wstr.c_str();

    OutputDebugString(L"\n\n\n\n");
    OutputDebugString(hWndStr);
}

```  
  
  
--------------------------------------------------------------------------------------------------------------  


## 窗体大小设定，移动，获取工作区大小，窗体居中 {#sec13}  
```c++
#include <winrt/Microsoft.UI.Windowing.h>

namespace winrt::PicViewer::implementation
{
    MainWindow::MainWindow()
    {
        InitializeComponent();  // 必须首先调用此函数，否则后面的代码不生效

        this->Title(L"PicViewer - JDR");  // 设置标题

        //winrt::Microsoft::UI::Windowing::AppWindow
        // 当前窗口的AppWindow对象
        auto appWindow = this->AppWindow();

        // 方式一： 设置窗口整体外部尺寸为 800x600
        appWindow.Resize({ 800,600 });  // OK

        // 方式二： 精确设置客户区（内容区域）尺寸为 800x600
        appWindow.ResizeClient({ 400,600 });  // OK

        // 设置窗口左上角在屏幕上的绝对坐标 （x, y) 
        appWindow.Move({ 500,300 });

        // 同时移动到(100,100)，并将客户区大小设置为 800x600
        appWindow.MoveAndResize({ 100, 100, 800, 600 });  // x,y,w

        // 获取当前显示器的工作区大小（排除了任务栏等系统占用区域）
        auto dispArea = Microsoft::UI::Windowing::DisplayArea::GetFromWindowId(appWindow.Id(),
                                                                               Microsoft::UI::Windowing::DisplayAreaFallback::Primary);

        int32_t width = 900;
        int32_t height = 600;
        
        // 计算居中坐标
        int32_t posx = (dispArea.WorkArea().Width - width) / 2;
        int32_t posy = (dispArea.WorkArea().Height - height) / 2;

        // 居中显示
        appWindow.MoveAndResize({ posx, posy, width, height });

    }
}
```  
  
  
--------------------------------------------------------------------------------------------------------------  



# Win2D
## Win2D安装 {#sec201}
用NuGet安装：  
  
Tools > NuGet Package Manager > Manage NuGet Package for Solution...  
  
Browse下选择 **Microsoft.Graphics.Win2D**  
  
它会在项目的packages目录下生成**Microsoft.Graphics.Win2D.1.4.0**目录。  
                              |_ include / x86 / Microsoft.Graphics.Canvas.h  
  
  
--------------------------------------------------------------------------------------------------------------  


## xaml使用指定命名空间(Win2D CanvasControl的使用){#sec202}  
```xml
<!-- xaml -->
<Window
    x:Class="JDRDemo.MainWindow"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:JDRDemo"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:canvas="using:Microsoft.Graphics.Canvas.UI.Xaml"                  <!-- 导入Win2D命名空间 -->
    mc:Ignorable="d"
    Title="JDRDemo">

    <Grid>
        <canvas:CanvasControl x:Name="canvas"                               <!-- 生成CanvasControl类实例： canvas -->
                              ClearColor="CornflowerBlue"
                              CreateResources="canvas_CreateResources"      <!-- CreateResources事件函数 -->
                              Draw="canvas_Draw" />                         <!-- Draw事件函数(画图) -->
    </Grid>
</Window>
```  
  
    
--------------------------------------------------------------------------------------------------------------  


## Win2D Draw()画图方法 {#sec203}  
```C++
void winrt::JDRDemo::implementation::MainWindow::canvas_Draw(
    winrt::Microsoft::Graphics::Canvas::UI::Xaml::CanvasControl const& sender, 
    winrt::Microsoft::Graphics::Canvas::UI::Xaml::CanvasDrawEventArgs const& args)
{
    auto ds = args.DrawingSession();

    // 绘制椭圆
    ds.DrawEllipse(155, 115, 80, 30,
        winrt::Microsoft::UI::Colors::Black(), 3);

    // 绘制文本
    ds.DrawText(L"Hello, Win2# World! 中文测试", 100, 100,
        winrt::Microsoft::UI::Colors::Yellow());

    // 绘制矩形
    ds.DrawRectangle(50, 50, 200, 100,
        winrt::Microsoft::UI::Colors::Red(), 2);

    // 绘制线条
    ds.DrawLine(10, 10, 300, 200,
        winrt::Microsoft::UI::Colors::Green(), 2);

    if (this->m_bitmap)
    {
        // 在指定位置绘制图片（左上角坐标 x=0, y=0)
        ds.DrawImage(this->m_bitmap, 300, 300);
    }//end if
}
```

  
--------------------------------------------------------------------------------------------------------------  








.end.
