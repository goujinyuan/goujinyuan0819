# AGENTS.md

## 项目概述

"高级网页设计"课堂练习合集，作者苟津源。每个练习页面都是独立的 HTML 文件，
使用**原生 HTML/CSS/JS** 构建，无框架、无打包器、无包管理器、无测试套件、无 lint 步骤。

## 本地运行

- 使用项目自带的 UTF-8 服务器启动：`python _serve.py` → http://localhost:8000
  （它会强制 HTML 响应头为 `charset=utf-8`，避免中文乱码）。
- 也可以直接双击打开 HTML 文件，但通过服务器访问时，相对路径和 `data.js` 的加载更可靠。

## 目录结构

- `index.html` — 首页 / 课堂目录（手动维护的链接列表，顶部 hero + 练习卡片网格）。
- `*.html` + 配对的 `*.css` — 单个练习（例如 `layout004.html` + `layout004.css`）。
  部分练习把所有 CSS 写在 `<style>` 标签里，没有独立的 CSS 文件。
- 练习页面包括：`html_basic`、`about`、`pic_above_text`、`layout004`、
  `layout_homework`、`css3004`、`dataType004`、`form`、`grid004`、`stack`、`svg004`、
  `JS_obj_fun`、`iconfont-1`–`iconfont-4`。
- `starter-level1-0819gjy.html`、`starter-level2-0819gjy.html` — 学生成绩分析面板练习
  （Level 1 基础版，Level 2 完整仪表盘版）。两者的 JS 已完成，从 `data.js` 读取数据；
  目标效果在 Netlify 上（`target.html` 未提交到仓库），需要 1:1 还原。
- `data.js` — 共享数据源；定义 `SUBJECTS` / `STUDENTS`，并暴露到 `window.SUBJECTS` / `window.STUDENTS`。
- `data.sql` — 简历/求职演示的 MySQL 建表语句。
- `cdn/` — 本地化的第三方库（`fa-all.min.css`、`lucide.min.js`、`webfonts/`）。
- `img/img/` — 照片、精灵图（`dot.gif`、`spirit.gif`）和中文命名的演示图片。
- `img/font/` — iconfont 字体包（`iconfont.css/js/woff2/ttf/json`、`demo_index.html`）。
- `skills/frontend-design/SKILL.md` — 做视觉设计时要遵循的设计指南。
- `gjy_prompt.md` — 提示词追加日志（见下方工作流规则）。
- `.screenshots/` — 临时视觉审查产物。

## 约定

- **仅用原生技术 / 不引入外部 CDN**。不要添加 `<script src="https://...">` 或远程字体/CSS 链接。
  如果需要某个库，下载到 `cdn/` 目录后本地引用。
- **新代码命名前缀**：新增的 CSS 类名、ID 和 JS 变量必须以 `wy_` 开头
  （来自 `gjy_prompt.md` 记录 1；此规则之后写的代码生效，旧文件不受影响）。
- **返回首页链接**：每个新建的 HTML 页面必须有指向 `index.html` 的链接（通常是"返回首页 / 返回课堂目录"）。
- **更新首页**：新增练习页面后，必须在 `index.html` 的卡片网格里加入对应的卡片/链接。
- **语言**：界面文案统一用中文；HTML 根标签使用 `lang="zh-CN"`。保持与现有页面一致的语气和视觉风格。
- **数据源**：复用 `data.js`（`STUDENTS` / `SUBJECTS`），不要把成绩数据直接写死到 HTML 里。
- **编码**：所有文件保持 UTF-8 无 BOM。自带服务器会强制 `charset=utf-8`，否则中文会乱码。
- **文件头注释（新建 HTML 文件时必填）**：每个新建的 HTML 文件，在 `<html>` 标签之前必须加入一段 HTML 注释，
  包含以下四项信息：作者（苟津源）、建立时间（YYYY-MM-DD）、使用模型、功能名称及简介。模板如下：

  ```html
  <!--
  作者: 苟津源
  建立时间: 2026-11-02
  使用模型: Trae (proprietary model from Trae team)
  功能: 页面功能名称 —— 一句话简介这个页面做什么
  -->
  ```

- **JS 函数注释（新建 HTML 文件中的内联/外链 JS 均适用）**：每个自定义函数上方必须加 JSDoc 风格的注释，
  说明函数功能、参数、返回值。模板如下：

  ```javascript
  /**
   * 函数功能：一句话描述这个函数做什么
   * @param {类型} 参数名 - 参数说明
   * @returns {类型} 返回值说明（无返回值可省略）
   */
  function exampleFunction(param1) { ... }
  ```

  对于非函数的关键逻辑块（如事件绑定、数据转换），也应用行内或块注释说明意图。

## 文档语言约定（全局）

**所有说明文字、检查条目、注释内容统一使用简体中文；文件路径、HTML/CSS/JS 标识符、命令、配置键名保留英文。**
后续在本项目里生成的文档、检查清单、注释都必须遵守这条约定。

## 提示词日志工作流（必须遵守）

每次响应用户请求之前，先向 `gjy_prompt.md` 追加一条记录。永远不要覆盖之前的条目。
每条记录包含：时间戳、使用的模型、提示词内容，沿用现有的 `## 记录 N` 格式。

## 设计工作

做新页面或改版时，先读 `skills/frontend-design/SKILL.md`，按其流程执行
（设计方案 → 对照需求评审 → 构建 → 自我评审）。优先选择有辨识度、贴合主题的设计，而不是套模板。

## 验证方式

- 没有自动化测试和 lint。通过本地服务器打开页面、用浏览器检查来验证。
- `starter-level` 系列练习，把渲染结果与 Netlify 上的 `target.html` 对比（该文件未提交到仓库），确保 1:1 还原。
