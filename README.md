# Let's visionOS 2024

## 流程

- 设计图 https://framer.com 发布 https://swiftgg24.framer.ai
- 把 letsvisionos24subscribe 服务架起来
- SiteSucker.app 的 Settings 启用 Include Supporting Files 和 Always Download HTML and CSS，且 File Replacement 设置为 Always
- SiteSucker.app 下载 https://swiftgg24.framer.ai/home-zh 重命名为 cn
- SiteSucker.app 下载 https://swiftgg24.framer.ai 重命名为 en
- 执行 `Startup.sh`
- 发布到 Vercel