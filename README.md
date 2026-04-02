# luci-app-oc-traffic

OpenClash Traffic Monitor LuCI Plugin for ImmortalWrt/OpenWrt.

## 功能特性

- 📊 OpenClash 流量实时监控
- 📈 RRD 图表展示历史流量
- 🔄 自动数据采集
- 📱 响应式 Web 界面

## 系统要求

- ImmortalWrt 24.10 或 OpenWrt 23.05+
- LuCI 2.0+
- OpenClash 已安装
- curl, jq, Python 3

## 安装

### 方法 1: 从 Releases 下载

1. 访问 [Releases](https://github.com/xihu19870706/luci-app-oc-traffic/releases)
2. 下载对应架构的 `.ipk` 文件
3. 上传到路由器并安装：

```bash
opkg install luci-app-oc-traffic_*.ipk
```

### 方法 2: 手动编译

```bash
# 克隆源码
git clone https://github.com/xihu19870706/luci-app-oc-traffic.git

# 复制到 OpenWrt SDK
cp -r luci-app-oc-traffic /path/to/openwrt/package/

# 编译
cd /path/to/openwrt
make package/luci-app-oc-traffic/compile V=s
```

## 使用说明

1. 安装后进入 LuCI 界面
2. 导航到 `服务` → `OpenClash Traffic`
3. 查看实时流量监控和历史图表

## 自动编译

本仓库使用 GitHub Actions 自动编译：

- 每次推送到 `main` 分支自动触发
- 编译产物发布到 [Releases](https://github.com/xihu19870706/luci-app-oc-traffic/releases)
- 支持 x86-64 架构 (可配置更多)

## 文件结构

```
luci-app-oc-traffic/
├── .github/workflows/      # GitHub Actions 配置
├── luasrc/                 # LuCI 前端代码
│   ├── controller/         # 控制器
│   ├── model/              # 数据模型
│   └── view/               # 视图模板
├── root/                   # 根文件系统
│   ├── etc/config/         # 配置文件
│   └── usr/bin/            # 可执行脚本
├── po/                     # 翻译文件
└── Makefile                # 编译配置
```

## 开发

### 调试

查看日志：

```bash
logread | grep oc_traffic
```

手动运行数据采集：

```bash
/usr/bin/oc_traffic_collect.sh
```

### 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License

## 致谢

- ImmortalWrt 团队
- OpenClash 项目
- LuCI 社区
