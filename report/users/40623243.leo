<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1" a="E"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean 40623243.md</vh>
<v t="leo.20180107232106.1"><vh>加減運算</vh></v>
<v t="yen.20170429214838.3"><vh>心得</vh></v>
</v>
<v t="yen.20170429215041.1"><vh>@clean operating_system.md</vh>
<v t="yen.20170429215130.1"><vh>Windows</vh></v>
<v t="yen.20170429215205.1"><vh>Ubuntu</vh></v>
</v>
<v t="yen.20170429215252.1"><vh>@clean computer_network.md</vh>
<v t="yen.20170429215308.1"><vh>IPv4</vh></v>
<v t="yen.20170429215316.1"><vh>IPv6</vh></v>
</v>
<v t="yen.20170429215416.1"><vh>@clean computer_programming.md</vh>
<v t="yen.20170429215446.2"><vh>C</vh></v>
<v t="yen.20170429215446.3"><vh>Python</vh></v>
<v t="yen.20170429215446.4"><vh>Brython</vh></v>
<v t="yen.20170429215446.5"><vh>PyQt</vh></v>
</v>
<v t="yen.20170429215617.1"><vh>@clean computer_aided_design.md</vh>
<v t="yen.20170429215851.1"><vh>自動控制</vh></v>
<v t="yen.20170429215830.1"><vh>機械系統模擬</vh></v>
<v t="yen.20170429215802.1"><vh>演化運算</vh></v>
</v>
<v t="yen.20170429215922.1"><vh>@clean leo_editor.md</vh>
<v t="yen.20170429220001.1"><vh>Scripting</vh></v>
</v>
<v t="yen.20170429220128.1"><vh>@clean github.md</vh>
<v t="yen.20170429220137.1"><vh>Github</vh></v>
</v>
<v t="yen.20170429220231.1"><vh>@clean fossil.md</vh>
<v t="yen.20170429220231.2"><vh>Fossil commands</vh></v>
</v>
<v t="yen.20170429220335.1"><vh>@clean onshape.md</vh>
<v t="yen.20170429220335.2"><vh>FeatureScript</vh></v>
</v>
</v>
</v>
</v>
</v>
<v t="leo.20180107232444.1" a="E"><vh>Recovered Nodes</vh>
<v t="leo.20180107232444.2"><vh>Recovered node "摘要" from @clean cover_and_abstract.md</vh>
<v t="leo.20180107232444.3"><vh>old:摘要</vh></v>
<v t="leo.20180107232444.4"><vh>new:摘要</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
import chapter
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"computer_hardware.md",
"40623242.md", 
"computer_network.md", 
"40623245.md", 
"computer_aided_design.md", 
"memory_and_calculate.md", 
#"github.md", 
#"fossil.md", 
#"onshape.md", 
#"cmsimfly.md", 
#"pygrouf.md", 
#"pyslvs.md", 
#"pylinkage.md", 
#"pyduino.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '計算機程式 bg8 期末報告'
title_zh: 'PyQt5 事件導向計算器'
title_en: 'PyQt5 Event-Driven Calculator Project'
author:
- 設計一乙 40623244 林俊鎧
- 設計一乙 40623240 何冠均
- 設計一乙 40623241 郭祐齊
- 設計一乙 40623242 高宇辰
- 設計一乙 40623243 盧逸誠
- 設計一乙 40623245 練峪愷
advisor_zh: '嚴家銘'
date: '2017.12.15'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    這是第八組的計算機概要，利用各自的leo檔分工合作，用協同的方式來做出計算機
    
    + 以老師原本user.leo為底。
    + 另存為 學號.leo 來進行編輯
    + 使用 github協同。
    + Q&amp;A用報告SciTE來做文字檔編輯，進行討論    
    
    本研究的重點在於 練習計算機編排、python練習、pyqt5練習
---


</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20180107232106.1">加減運算
---

確定運算為加或減, 在按下運算之前在display的數字為運算數
納入乘除後的先乘除後加減, 且連續按下可累計運算

運算式 :

if self.pendingMultiplicativeOperator:
            if not self.calculate(operand, self.pendingMultiplicativeOperator):
                self.abortOperation()
                return
 
            self.display.setText(str(self.factorSoFar))
            operand = self.factorSoFar
            self.factorSoFar = 0.0
            self.pendingMultiplicativeOperator = ' '
 
納入連續按下加減, 可以目前的運算數及運算子累計運算

運算式 :

if self.pendingAdditiveOperator:
            if not self.calculate(operand, self.pendingAdditiveOperator):
                self.abortOperation()
                return
顯示運算結果
self.display.setText(str(self.sumSoFar))                            </t>
<t tx="leo.20180107232444.1"></t>
<t tx="leo.20180107232444.2">(uncached) ahshoe.20170317115820.1
Diff...
  ---
  abstract: |
-     這是第八組的計算機概要，利用各自的leo檔分工合作，用協同的方式來做出計算機
+     這裡是摘要內容。A pipe character, followed by an indented block of text is treated as a literal block, in which newlines are preserved throughout the block, including the final newline.
      
-     + 以老師原本user.leo為底。
-     + 另存為 學號.leo 來進行編輯
-     + 使用 github協同。
-     + Q&amp;A用報告SciTE來做文字檔編輯，進行討論    
+     + 以 YAML 的方式插入。
+     + The '+' indicator says to keep newlines at the end of text blocks.
+     + 使用 Markdown 語法。
+     + 前面使用加號
      
-     本研究的重點在於 練習計算機編排、python練習、pyqt5練習
+     本研究的重點在於 ...
  ---
  
  
</t>
<t tx="leo.20180107232444.3">---
abstract: |
    這裡是摘要內容。A pipe character, followed by an indented block of text is treated as a literal block, in which newlines are preserved throughout the block, including the final newline.
    
    + 以 YAML 的方式插入。
    + The '+' indicator says to keep newlines at the end of text blocks.
    + 使用 Markdown 語法。
    + 前面使用加號
    
    本研究的重點在於 ...
---


</t>
<t tx="leo.20180107232444.4">---
abstract: |
    這是第八組的計算機概要，利用各自的leo檔分工合作，用協同的方式來做出計算機
    
    + 以老師原本user.leo為底。
    + 另存為 學號.leo 來進行編輯
    + 使用 github協同。
    + Q&amp;A用報告SciTE來做文字檔編輯，進行討論    
    
    本研究的重點在於 練習計算機編排、python練習、pyqt5練習
---


</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">加減運算按鍵處理
===





@others</t>
<t tx="yen.20170429214838.3">心得
---

經過這次協同完成計算機程式, 比以前更了解程式, 也透過分組方式來分工合作, 每個人也都有屬於自己的工作及目標, 遇到困難時也互相幫忙, 雖然過程不是很順利, 但也因此學到了如何解決及處理問題, 也知道在寫程式時會遇到的困難, 對於個人來說,也算是接觸了較不一樣的領域, 對於自己也有所提升了</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">操作系統
===

操作系統 的概要

@others</t>
<t tx="yen.20170429215130.1">Windows
---

Windows 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

</t>
<t tx="yen.20170429215205.1">Ubuntu
---

Ubuntu 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

[Kmol]: ./images/operating_system/kmol.png {#fig:駱駝}</t>
<t tx="yen.20170429215252.1">電腦網路
===

電腦網路 的概要

@others</t>
<t tx="yen.20170429215308.1">IPv4
---

IPv4 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

[Kmol]: ./images/computer_network/kmol.png {#fig:駱駝}</t>
<t tx="yen.20170429215316.1">IPv6
---

IPv6 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案 [google]

[google]: http://www.google.com

[google] test</t>
<t tx="yen.20170429215416.1">計算機程式
===

計算機程式 的概要

@others</t>
<t tx="yen.20170429215446.2">C
---

C 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215446.3">Python
---

Python 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215446.4">Brython
---

Brython 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215446.5">PyQt
---

PyQt 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215617.1">電腦輔助設計
===

電腦輔助設計 的概要

@others</t>
<t tx="yen.20170429215802.1">演化運算 (Evolutionary Computation)
---

演化運算 (Evolutionary Computation) 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215830.1">機械系統模擬
---

機械系統模擬 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215851.1">自動控制
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

</t>
<t tx="yen.20170429215922.1">Leo Editor
===

Leo Editor 的概要

@others</t>
<t tx="yen.20170429220001.1">Scripting
---

Scripting 的內容</t>
<t tx="yen.20170429220128.1">40623242 CP
===

Github 的概要

@others
</t>
<t tx="yen.20170429220137.1">Github
---

Github 的內容
</t>
<t tx="yen.20170429220231.1">Fossil SCM
===

Fossil SCM 的概要

@others</t>
<t tx="yen.20170429220231.2">Fossil Commands
---

Fossil Commands 的內容</t>
<t tx="yen.20170429220335.1">OnShape
===

OnShape 的概要

@others</t>
<t tx="yen.20170429220335.2">FeatureScript
---

FeatureScript 的內容</t>
</tnodes>
</leo_file>
