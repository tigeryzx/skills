# mt-skill - 快捷安装工具

## 简介

`mt-skill` 是一个快捷脚本，用于简化从本地仓库安装 Matt Pocock 的 agent skills 的过程。

## 文件说明

| 文件 | 说明 |
|------|------|
| `install-mt-skill.bat` | 安装脚本，运行后会自动配置 `mt-skill` 命令 |
| `mt-skill.bat` | 参考模板，展示生成的脚本结构 |

## 安装步骤

### 首次安装（在任何新电脑上）

```bash
# 1. 克隆仓库
git clone https://github.com/mattpocock/skills.git
cd skills

# 2. 运行安装脚本
scripts\install-mt-skill.bat
```

安装成功后，`mt-skill` 命令会在全局可用。

### 日常使用

```bash
# 在任意项目目录下安装 skills
cd your-project
mt-skill

# 更新本地 skills 仓库
mt-skill update
```

## 工作原理

1. `install-mt-skill.bat` 检测当前仓库的路径
2. 动态生成 `mt-skill.bat`，写入正确的仓库路径
3. 将生成的脚本复制到 npm 全局目录 (`%APPDATA%\npm\`)
4. 之后即可在任意位置调用 `mt-skill` 命令

## 路径处理

- 每台电脑的仓库路径可能不同
- 路径在安装时自动检测，无需手动配置
- 安装脚本会读取当前仓库位置，确保路径正确

## 故障排除

### "npm global directory not found" 错误

确保已安装 npm，并且 `%APPDATA%\npm` 目录存在。

### 命令无权限

尝试以管理员身份运行安装脚本。

### 命令未找到

确保 `%APPDATA%\npm` 在系统 PATH 环境变量中。

## 卸载

删除以下文件即可卸载：

```bash
del %APPDATA%\npm\mt-skill.bat
```
