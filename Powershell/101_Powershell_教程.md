
# CMD vs Powershell

| CMD       | PowerShell                         | 描述
|--         | ---                                |--
|  gcm      | Get-Command                        |
|||
|  gal      | Get-Alias                          |
|||
|  gl       | Get-Location                       |
|  pwd      | Get-Location                       |
|||
|  %        | ForEach-Object                     |
|  foreach  | ForEach-Object                     |
|  ?        | Where-Object                       |
|  where    | Where-Object                       |
|  clear    | Clear-Host                         |
|  cls      | Clear-Host                         |
|  cd       | Set-Location                       |
|  chdir    | Set-Location                       |
|  sl       | Set-Location                       |
|  man      | help                               |
|  md       | mkdir                              |
| | |
|  dir      | Get-ChildItem                      |
|  ls       | Get-ChildItem                      |
|  gci      | Get-ChildItem                      |
|||
|  echo     | Write-Output                       |
|  write    | Write-Output                       |
|||
|  type     | Get-Content file -wait             |
|  cat      | Get-Content                        |
|  gc       | Get-Content                        |
|||
|  copy     | Copy-Item                          |
|  cp       | Copy-Item                          |
|  cpi      | Copy-Item                          |
|||
|  move     | Move-Item                          |
|  mv       | Move-Item                          |
|  mi       | Move-Item                          |
|||
|  compare  | Compare-Object                     |
|  diff     | Compare-Object                     |
|||
|  curl     | Invoke-WebRequest                  |
|  wget     | Invoke-WebRequest                  |
|  iwr      | Invoke-WebRequest                  |
|||
|  del      | Remove-Item                        |
|  erase    | Remove-Item                        |
|  rm       | Remove-Item                        |
|  rmdir    | Remove-Item                        |
|  rd       | Remove-Item                        |
|  ri       | Remove-Item                        |
|||
|  epcsv    | Export-Csv                         |
|  ipcsv    | Import-Csv                         |
|||
|  ps       | Get-Process                        |
|||
|  sleep    | Start-Sleep                        |
|||
|  vi       | vim.bat                            |
|||
|  ac       | Add-Content                        |
|  asnp     | Add-PSSnapin                       |
|  CFS      | ConvertFrom-String                 |
|  clc      | Clear-Content                      |
|  clhy     | Clear-History                      |
|  cli      | Clear-Item                         |
|  clp      | Clear-ItemProperty                 |
|  clv      | Clear-Variable                     |
|  cnsn     | Connect-PSSession                  |
|  dnsn     | Disconnect-PSSession               |
|  cpp      | Copy-ItemProperty                  |
|  cvpa     | Convert-Path                       |
|  dbp      | Disable-PSBreakpoint               |
|  rp       | Remove-ItemProperty                |
|  ebp      | Enable-PSBreakpoint                |
|  epal     | Export-Alias                       |
|  epsn     | Export-PSSession                   |
|  etsn     | Enter-PSSession                    |
|  exsn     | Exit-PSSession                     |
|  fc       | Format-Custom                      |
|  fhx      | Format-Hex                         |
|  fl       | Format-List                        |
|  ft       | Format-Table                       |
|  fw       | Format-Wide                        |
|  gbp      | Get-PSBreakpoint                   |
|  gcb      | Get-Clipboard                      |
|  gcs      | Get-PSCallStack                    |
|  gdr      | Get-PSDrive                        |
|  ghy      | Get-History                        |
|  h        | Get-History                        |
|  history  | Get-History                        |
|  gi       | Get-Item                           |
|  gin      | Get-ComputerInfo                   |
|  gjb      | Get-Job                            |
|  gm       | Get-Member                         |
|  gmo      | Get-Module                         |
|  gp       | Get-ItemProperty                   |
|  gps      | Get-Process                        |
|  gpv      | Get-ItemPropertyValue              |
|  group    | Group-Object                       |
|  gsn      | Get-PSSession                      |
|  gsnp     | Get-PSSnapin                       |
|  gsv      | Get-Service                        |
|  gtz      | Get-TimeZone                       |
|  gu       | Get-Unique                         |
|  gv       | Get-Variable                       |
|  gwmi     | Get-WmiObject                      |
|  icm      | Invoke-Command                     |
|  iex      | Invoke-Expression                  |
|  ihy      | Invoke-History                     |
|  r        | Invoke-History                     |
|  ii       | Invoke-Item                        |
|  ipal     | Import-Alias                       |
|  ipmo     | Import-Module                      |
|  ipsn     | Import-PSSession                   |
|  irm      | Invoke-RestMethod                  |
|  ise      | powershell_ise.exe                 |
|  iwmi     | Invoke-WmiMethod                   |
|  kill     | Stop-Process                       |
|  spps     | Stop-Process                       |
|  lp       | Out-Printer                        |
|  measure  | Measure-Object                     |
|  mount    | New-PSDrive                        |
|  ndr      | New-PSDrive                        |
|  mp       | Move-ItemProperty                  |
|  nal      | New-Alias                          |
|  ni       | New-Item                           |
|  nmo      | New-Module                         |
|  npssc    | New-PSSessionConfigurationFile     |
|  nsn      | New-PSSession                      |
|  nv       | New-Variable                       |
|  ogv      | Out-GridView                       |
|  oh       | Out-Host                           |
|  popd     | Pop-Location                       |
|  pushd    | Push-Location                      |
|  rbp      | Remove-PSBreakpoint                |
|  rcjb     | Receive-Job                        |
|  rcsn     | Receive-PSSession                  |
|  rdr      | Remove-PSDrive                     |
|  ren      | Rename-Item                        |
|  rni      | Rename-Item                        |
|  rjb      | Remove-Job                         |
|  rmo      | Remove-Module                      |
|  rnp      | Rename-ItemProperty                |
|  rsn      | Remove-PSSession                   |
|  rsnp     | Remove-PSSnapin                    |
|  rujb     | Resume-Job                         |
|  rv       | Remove-Variable                    |
|  rvpa     | Resolve-Path                       |
|  rwmi     | Remove-WmiObject                   |
|  sajb     | Start-Job                          |
|  sal      | Set-Alias                          |
|  saps     | Start-Process                      |
|  start    | Start-Process                      |
|  sasv     | Start-Service                      |
|  sbp      | Set-PSBreakpoint                   |
|  sc       | Set-Content                        |
|  scb      | Set-Clipboard                      |
|  select   | Select-Object                      |
|  set      | Set-Variable                       |
|  sv       | Set-Variable                       |
|  shcm     | Show-Command                       |
|  si       | Set-Item                           |
|  sls      | Select-String                      |
|  sort     | Sort-Object                        |
|  sp       | Set-ItemProperty                   |
|  spjb     | Stop-Job                           |
|  spsv     | Stop-Service                       |
|  stz      | Set-TimeZone                       |
|  sujb     | Suspend-Job                        |
|  swmi     | Set-WmiInstance                    |
|  tee      | Tee-Object                         |
|  trcm     | Trace-Command                      |
|  wjb      | Wait-Job                           |

# 常用命令
 - get-process | sort-object CPU -Descending | Select-Object -First 5  
 - Get-Process -Name "notepad" | Select-Object Name,CPU,WorkingSet
 - get-childItem $env:windir -Filter *.exe | Measure-Object -Sum Length
 - Import-CSV data.csv | where-object {$_.Age -gt 30} | ConvertTo-Html | Out-File output.html
 - 

##### CMD不允许if嵌套，PS可以。
```powershell
$var1 = 1
$var2 = 2

if ($var1 -eq 1) {

    Write-Output "First level condition met"

    if ($var -eq 2) {
        Write-Output "Second level conditiong met"
    }

}
```

# PowerShell 的核心特点
 - 面向对象：不同于传统命令行工具处理文本，PowerShell 直接处理 .NET 对象
 - 强大的管道功能：可以轻松地将一个命令的输出传递给另一个命令
 - 可扩展性：可以创建自定义 cmdlet（命令）和模块
 - 跨平台支持：PowerShell Core 可在 Windows、Linux 和 macOS 上运行

https://www.runoob.com/powershell/powershell-intro.html


# 什么人员适合学习？
 - 系统管理员：批量管理服务器、自动化部署、配置控制
 - 开发人员：构建 DevOps 流程、脚本工具、测试工具链
 - 数据分析师：自动处理日志、提取数据、系统集成
 - 初学者：学习命令行编程、了解操作系统底层机制
   
PowerShell 不只是一个命令行工具，它更像是一种高级自动化平台。不论你是运维人员、开发者，还是想精通
Windows 系统的普通用户，PowerShell 都值得你深入了解和掌握。

它比 cmd 灵活，比 bash 强大，最关键的是——它正在以跨平台的姿态，成为新时代的自动化基础设施工具。


# 查询环境变量
```powershell
Get-ChildItem env:    // 查看所有环境变量
$env:JAVA_HOME        // 查看单个环境变量

$env:PATH             // 查看所有PATH,紧凑拼接表示
$env:PATH -split ';'  // 查看所有PATH,一行一个
```

# 增/删/改环境变量
```powershell
// 仅在当前console生效,其他console读不到,关闭console后失效
$env:JAVA_HOME="D:\java9\bin"

// 永久生效
// 用户环境变量: 'User'    (本质上是枚举[EnvironmentVariableTarget]::User 太长)
// 系统环境变量: 'Machine' (本质上是枚举[EnvironmentVariableTarget]::Machine)

// 新增或修改
[Environment]::SetEnvironmentVariable('IGNORE_CASE', 'false', 'User')

// 删除
[Environment]::SetEnvironmentVariable('IGNORE_CASE', $null, 'Machine')

// 顺便说一下cmd管理环境变量
set JAVA_HOME="D:\java9\bin"     // 当前console临时环境变量
setx JAVA_HOME "D:\java9\bin"    // 永久设置环境变量(用户)

```

# PATH环境变量
PATH环境变量比较特殊，其中的值包含多个路径，使用“;”隔开（Linux用“:”隔开）。
一般这些路径指向一个bin目录，里面存放二进制可执行文件，在console执行一个命令相当于就会遍历这些目录，找到对应的二进制文件并执行。

没有办法单对$env:PATH操作就可以让新的PATH永久生效，
需要结合[Environment]::SetEnvironmentVariable()函数。

这时候就可以提现出环境变量临时生效的好处，先临时修改$env:PATH，确保对之后再用[Environment]::SetEnvironmentVariable()覆盖原有PATH实现永久生效。

也不用害怕把$env:PATH改错（如果覆盖为空值是一个很麻烦的事情），见势不妙立马关掉console，只要最后不提交[Environment]::SetEnvironmentVariable()就OK。


## 追加PATH
$env:USER_PATH=[Environment]::GetEnvironmentVariable("PATH", "User")
// ↓勿直接使用$env:PATH，会触发问题2，用临时变量$env:USER_PATH来过渡一下
$env:USER_PATH += ";D:\java8\bin" // 现在console中临时追加(注意看情况加;分割)
[Environment]::SetEnvironmentVariable("PATH", $env:USER_PATH, 'User') // 使临时追加永久生效

## 替换PATH
$env:USER_PATH=[Environment]::GetEnvironmentVariable("PATH", "User") 
// ↓勿直接使用$env:PATH，会触发问题2，用临时变量$env:USER_PATH来过渡一下
$env:USER_PATH=$env:USER_PATH -replace "D:\\java8\\bin;", "D:\java9\bin;" // 先在console中临时替换
[Environment]::SetEnvironmentVariable("PATH", $env:USER_PATH, 'User')     // 使临时替换永久生效
(删除PATH中的某一个路径替换为""即可)


## 注意点：

1） $env:USER_PATH=$env:USER_PATH -replace "D:\\java8\\bin;", "D:\java9\bin;"
为什么前面写“\\”后面不写？ 因为第一个参数是一个正则表达式，如果写\则会认为是匹配开头。（有的正则表达式是以^开头以$结尾来匹配）
当然，如果后面写\\也不会有问题，到时候值会以"D:\\java9\\bin;"这种形式展示（正常只有一个\），不影响使用。

2）不要忘记开头或结尾的分号
-replace "D:\\java8\\bin;", "D:\java9\bin;" 最后要不要带分号？ → 看情况，就是普通的字符串替换，先使用$env:USER_PATH查出来自己判断要不要替换这个分号。
如果原有值结尾有分号则追加的时候最前面可不加分号，规矩是死的，脑子是活的。



最后，执行操作后环境变量在当前console不会生效，再新开一个console。

问题
$env:PATH = $env:PATH -replace "%JAVA_HOME%\bin", "" 涉及%怎么都替换不了（求解）
$env:PATH是用户与系统变量的并集，提交会生成很多相同值造成字符串过长
（最长2047个字符）（✔️已解，使用$env:USER_PATH过渡一下）











