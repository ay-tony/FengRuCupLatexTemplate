% 北京航空航天大学 冯如杯格式模板
% 使用 XeLaTeX 编译
% aytony

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buaa_fengru}[Templates of Fengru Report for Beihang University]

% ctexart
% 小四号，行距 1.5 倍
\LoadClass[zihao=-4,linespread=1.5,UTF8]{ctexart}

% 包导入
\RequirePackage{amsmath,amssymb,amsfonts,amsthm} % 数学环境
\RequirePackage{esint} % 积分号优化
\RequirePackage{extarrows} % 扩展箭头
\RequirePackage{enumitem} % 扩展列表环境
\RequirePackage{color} % 颜色
\RequirePackage[
    pagebackref,
    hidelinks,
    colorlinks=true,
    citecolor=blue,
    linkcolor=black
]{hyperref} % 交叉引用链接
\RequirePackage{geometry} % 页面设置
\RequirePackage{fancyhdr}
\RequirePackage{graphicx} % 插入图片
\RequirePackage{multirow} % 分栏
\RequirePackage{array}
\RequirePackage[version=4]{mhchem} % 有机化学作图
\RequirePackage{siunitx} % 物理化学带单位量
\RequirePackage{enumitem} % 自定义列表格式
\RequirePackage{caption} % 自定义浮动窗口标题格式
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e} % 伪代码
\RequirePackage{booktabs}
\RequirePackage{listings} % 源码插入
\RequirePackage{fontspec} % 字体设置
\RequirePackage{gbt7714} % 引用文献格式
\RequirePackage{floatrow} % 浮动体格式设置
\RequirePackage{ifthen} % LaTeX 逻辑判断

\zhnumsetup{arabicsep=\,}

% siunitx
% 设置物理化学单位格式
\sisetup{
    separate-uncertainty = true,
    inter-unit-product = \ensuremath{{}\cdot{}}
}

% geometry
% 页边距设置：左 3cm, 右 2cm, 上下 2.5cm
\geometry{a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm}

% 设置页眉页脚
% 目录页面风格
\fancypagestyle{toc}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[C]{\zihao{5}\thepage} % 五号页码
    \renewcommand{\headrulewidth}{0pt}
}
% 正文页面风格
\fancypagestyle{main}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{}
    \fancyhead[C]{\zihao{-5}\songti 北京航空航天大学第三十四届“冯如杯”竞赛创意赛道参赛作品}
    \fancyfoot[C]{\zihao{5}\thepage} % 五号页码
    \renewcommand{\headrulewidth}{0.4pt}
}
\pagestyle{main}

% 传递参数
\newcommand{\@subtitle}{} % 副标题
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@abstractzh}{} % 摘要（中）
\newcommand{\abstractzh}[1]{\renewcommand{\@abstractzh}{#1}}
\newcommand{\@abstracten}{} % 摘要（英）
\newcommand{\abstracten}[1]{\renewcommand{\@abstracten}{#1}}
\newcommand{\@wordszh}{} % 关键词（中）
\newcommand{\wordszh}[1]{\renewcommand{\@wordszh}{#1}}
\newcommand{\@wordsen}{} % 关键词（英）
\newcommand{\wordsen}[1]{\renewcommand{\@wordsen}{#1}}

% 设置字体
% 宋体及其粗体
\setCJKfamilyfont{mzhsong}[AutoFakeBold = {2.17}]{SimSun}
\renewcommand*{\songti}{\CJKfamily{mzhsong}}
% 黑体及其粗体
\setCJKfamilyfont{mzhhei}[AutoFakeBold = {2.17}]{SimHei}
\renewcommand*{\heiti}{\CJKfamily{mzhhei}}
% 华文中宋及其粗体
\setCJKfamilyfont{zhongsong}[AutoFakeBold = {2.17}]{STZhongsong}
\newcommand*{\hwzs}{\CJKfamily{zhongsong}}
% 华文新魏及其粗体
\setCJKfamilyfont{xinwei}[AutoFakeBold = {2.17}]{STXinwei}
\newcommand*{\hwxw}{\CJKfamily{xinwei}}

% 标题设置
\renewcommand{\maketitle}{
    \SetAlgorithmName{算法}{算法}{算法}
    {
        % 封面页
        \pagestyle{empty} % 无页眉页脚
        \pagenumbering{gobble} % 页码不编号

        \includegraphics[width = 0.2\textwidth]{buaamark.png}

        \begin{center}
            \vspace{1cm}
            \includegraphics[width = 0.7\textwidth]{buaachar.png}

            \vspace{4cm}
            \zihao{2}\bfseries\hwzs\@title
        \end{center}

        \begin{flushright}
            \zihao{3}\hwxw\@subtitle
        \end{flushright}

        \newpage

        % 摘要页（中）

        \begin{center}
            {\zihao{3}\heiti{摘要}}
        \end{center}

        \mdseries\zihao{-4}\songti\@abstractzh

        \noindent\bfseries\heiti{关键词}\quad\mdseries\songti\@wordszh

        \newpage

        % 摘要页（英）

        \ifthenelse{\equal{\@abstracten}{}}{}{
            \begin{center}
                {\zihao{3}\textbf{Abstract}}
            \end{center}

            \mdseries\zihao{-4}\songti\@abstracten

            \noindent\bfseries\heiti{Keywords}\quad\mdseries\songti\@wordsen

            \newpage
        }
        
        % 目录页
        \pagenumbering{roman}
        \pagestyle{toc} % 目录风格页面

        \tableofcontents

        \newpage

        % 以下正文

        \pagenumbering{arabic}
        \pagestyle{main} % 正文风格页面
    }
}

% 中文定理环境
\theoremstyle{definition}
\newtheorem{theorem}{\indent\heiti 定理}
\newtheorem*{theorem*}{\indent\heiti 定理}
\newtheorem{lemma}{\indent\heiti 引理}
\newtheorem*{lemma*}{\indent\heiti 引理}
\newtheorem{proposition}{\indent\heiti 命题}
\newtheorem*{proposition*}{\indent\heiti 命题}
\newtheorem*{corollary}{\indent\heiti 推论}
\newtheorem{definition}{\indent\heiti 定义}
\newtheorem*{definition*}{\indent\heiti 定义}
\newtheorem{example}{\indent\heiti\mdseries 例}
\newtheorem*{example*}{\indent\heiti\mdseries 例}
\newtheorem{remark}{\indent\heiti 注}
\newtheorem*{remark*}{\indent\heiti 注}
\newenvironment{solution}{\begin{proof}[\indent\heiti\textbf{解}]}{\end{proof}}
\renewcommand{\proofname}{\indent\heiti\textbf{证}}

% autoref
% 引用名称中文化
\newcommand{\propositionautorefname}{命题}
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}
\renewcommand{\equationautorefname}{式}
\renewcommand{\subsectionautorefname}{节}
\renewcommand{\subsubsectionautorefname}{节}
\renewcommand{\lstlistingname}{代码}

% enumitem
% 自定义列表计数器
\AddEnumerateCounter{\chinese}{\chinese}{}

% 使用 \upcite{} 来使用上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% ctex
% 各级标题格式设置
\ctexset{
    section = {
        name = {,、},
        number = \chinese{section},
        format = {\zihao{3}\heiti\centering},
        aftername = {}
    },
    subsection = {
        name = {（,）},
        format = {\zihao{4}\heiti},
        number = \chinese{subsection},
        aftername = {}
    },
    subsubsection = {
        name = {,.},
        format = {\zihao{-4}\heiti},
        number = \arabic{subsubsection},
        tocline = {\CTEXthesubsubsection\hspace{.5em} #2}
    },
    appendix = {
        name = {,\hspace{.7em}}
    }
}

% listings
% 代码插入
\lstset{
    basicstyle          =   \zihao{5}\ttfamily,         % 基本代码样式
    keywordstyle        =   \color{blue},               % 关键字样式
    commentstyle        =   \color[RGB]{110,139,61},    % 注释的样式
    stringstyle         =   \color[RGB]{165,42,42},     % 字符串样式
    numbers             =   left,                       % 行号的位置在左边
    showspaces          =   false,                      % 是否显示空格
    numberstyle         =   ,                           % 行号样式
    showstringspaces    =   false,
    captionpos          =   t,                          % 标题位置，t 指的是 top
    frame               =   leftline,                   % 边框样式
    language            =   [11]c++,                    % 默认语言为 c++11
    breaklines          =   true,                       % 自动换行
    columns             =   fixed,                      % 固定字宽
    basewidth           =   0.5em
}

% 大写罗马数字（页面编码用）
\newcommand*{\Rom}[1]{\uppercase\expandafter{\romannumeral #1}}
\newcommand*{\rom}[1]{\romannumeral #1}

% caption
% 设置浮动体标题
\DeclareCaptionFont{zhbf}{\zihao{5}\bfseries\songti} % 五号宋体加粗
\DeclareCaptionLabelSeparator{space}{\ \ } % 半角两格
\captionsetup{font = zhbf, labelsep=space}

% fontspec
% 默认英文字体设置为 Times New Roman
\setmainfont{Times New Roman}

% floatrow
% 设置表格字体为五号
\DeclareFloatFont{tabfont}{\zihao{5}}
\floatsetup[table]{font=tabfont,capposition=top}

% hyperref
% 设置 pagebackref 中页码显示
\renewcommand*\backref[1]{\ifx#1\relax \else （第 #1 页） \fi}
