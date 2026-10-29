---
name: git-push-project
description: Commit and push this web design project to GitHub. Use when the user asks to提交 git、push 到 GitHub、同步到远程仓库、或者 commit 并 push.
---

# Git Push Project

将本项目的变更提交并推送到 GitHub。适用于 `c:\Code\网页设计`（高级网页设计课堂实践仓库）。

## 环境信息

- **仓库路径**: `c:\Code\网页设计`
- **Remote origin**: `https://github.com/goujinyuan/goujinyuan0819.git` (HTTPS)
- **分支**: `master`
- **Git 用户**: `goujinyuan <2073476651@qq.com>`
- **凭据管理**: Windows Credential Manager (`credential.helper=manager`)
- **SSH 状态**: port 22 被防火墙阻断，**必须使用 HTTPS**

## 执行流程

### 1. 检查状态

```powershell
git status --short
```

如果没有任何输出（clean working tree），直接告知用户"没有需要提交的变更"，停止。

### 2. 添加文件

```powershell
git add -A
```

然后再次 `git status --short` 确认暂存内容。

### 3. 编写 commit message

**PowerShell 5 环境注意**:
- heredoc (`<<'EOF'`) **不可用**，会报 ParserError
- 用单引号包 commit message：`git commit -m 'message text'`
- message 中不要出现单引号（会截断），如需引用用双引号或改写

Commit message 格式：

```
<type>: <简洁描述>

[type] init | feat | fix | update | refactor | chore | docs
[描述] 10-30 个汉字，概括本次变更
```

示例：
```powershell
git commit -m 'feat: 添加 iconfont-3/4 移动端底部导航'
git commit -m 'fix: 修正 level2 进度条宽度和 Top3 排序'
git commit -m 'init: 首次提交全部 HTML/CSS/JS 练习文件'
```

### 4. Push 到远程

```powershell
git push -u origin master
```

首次 push 后，后续只需 `git push`。

### 5. 如果 push 失败

| 错误信息 | 原因 | 解决 |
|---|---|---|
| `ssh: connect to host github.com port 22: Connection refused` | SSH 被防火墙阻断 | remote 已配置为 HTTPS，不应出现。若出现，执行 `git remote set-url origin https://github.com/goujinyuan/goujinyuan0819.git` |
| `fatal: Authentication failed` | PAT 过期或未配置 | 提示用户：GitHub → Settings → Developer settings → Personal access tokens → Generate new token (scope: repo)，然后执行 `git config --global credential.helper manager` 再 push 时输入 PAT |
| `src refspec master does not match any` | 没有任何 commit | 先执行 step 2-3 |
| `error: failed to push some refs` | 远程有新 commits 本地没有 | `git pull --rebase origin master` 再 `git push` |

## 常用场景

### 场景 A: 用户说"帮我提交一下"

1. `git status` 看有哪些变更
2. 根据变更内容自动生成 commit message
3. add → commit → push

### 场景 B: 用户给了具体 commit message

直接用用户给的 message：`git commit -m '用户的原话'`

### 场景 C: 只有部分文件要提交

```powershell
git add path/to/file1.html path/to/file2.css
git commit -m 'fix: 只提交这两个文件的修复'
```

## 禁忌

- 不要 commit `.screenshots/` 目录（已在 .gitignore）
- 不要 commit 私钥文件（`.ssh/` 不在仓库里，但注意不要误加）
- 不要用 `git push --force`，除非用户明确要求
- 不要修改 `.gitignore` 除非用户明确要求
