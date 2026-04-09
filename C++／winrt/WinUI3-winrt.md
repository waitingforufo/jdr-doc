# WinUI3 / C++/winRT

## C++/WinRT开发WinUI 3应用程序时，常用的命名空间
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

# アプリ生成
## 1. xxx.vcproj
```xml
<AppxPackage>false</AppxPackage>
<WindowsPackageType>None</WindowsPackageType>
```
## 2. Tools > NuGet Package Manager > Manage NuGet Packages for solution
Updates配下のすべてを最新版に

## 3. download Windows App SDK 1.6xxx
https://learn.microsoft.com/ja-jp/windows/apps/windows-app-sdk/downloads

# Window type
runtimeclass MainWindow : Microsoft.UI.Xaml.Window

# TextBlock
```xml
<TextBlock Text="{x:Bind MyProperty}" />
```

# ボタン文言設定
```c++
myButton().Content(box_value(L"Clicked"));
```
### *remember: XAML name is "colorPanel" -> ソース上では"colorPanel()"で取得する。 

# メモリデータ　→　UI
```C++
void MainWindow::MyProperty(int32_t value)
{
    this->propertyValue = value;
    this->Bindings->Update();
}
```

# debug文言出力 / hstring型生成→伝統文字列への変換
```C++
OutputDebugString(L"Property value updated to: ");
OutputDebugString(winrt::to_hstring(propertyValue).c_str());
OutputDebugString(L"\r\n");
``` 

# ラジオボタン
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

# Border の色設定 SolidColorBrush / Colors
```C++ 
colorPanel().Background(Microsoft::UI::Xaml::Media::SolidColorBrush{ Microsoft::UI::Colors::Yellow() });
```
### * SolidColorBrush - winrt::Microsoft::UI::Xaml::Media::SolidColorBrush
### * Colors - winrt::Microsoft::UI::Colors

# テキストボックス　＆　ボタン
# TextBox / Button
```xml 
<StackPanel Orientation="Vertical" Margin="20,0,0,0">
    <TextBox x:Name="nameBox" Header="Enter your name" Width="200" />
    <Button x:Name="sayHiButton" Content="Say Hi!" Click="sayHiButton_Click" />
</StackPanel>
```

# コンテントダイヤログ(modal)
![コンテントダイヤログ](./img/epsode1/2024-11-18_124715.jpg)
# dialog: Microsoft::UI::Xaml::Controls::ContentDialog

```C++
private:
    winrt::fire_and_forget showMessage(hstring message);


winrt::fire_and_forget MainWindow::showMessage(hstring message)
{
    Microsoft::UI::Xaml::Controls::ContentDialog dlg{};

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

# コンポボックス
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
### MainWindow.idl
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








.end.
