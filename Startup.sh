#!/bin/bash

# 定义第一个要替换的字符串及其替换内容
OLD_STRING_1="My Framer Site"
NEW_STRING_1="Let's visionOS 2024"

# 定义第二个要替换的字符串及其替换内容
OLD_STRING_2="swiftgg24.framer.ai"
NEW_STRING_2="letsvisionos24.swiftgg.team"

# 定义第三个要替换的字符串及其替换内容
OLD_STRING_3="home-zh"
NEW_STRING_3="cn"

# 定义第四个要替换的字符串及其替换内容
OLD_STRING_4="Made with Framer"
NEW_STRING_4="Made with love - SwiftGG"

# 定义要删除的标签
OLD_TAG="<div id=\"__framer-badge-container\"></div>"
NEW_TAG=""

# 定义要搜索的文件类型
FILE_TYPES=("html" "css" "js" "mjs" "xml")

# 遍历每种文件类型
for type in "${FILE_TYPES[@]}"; do
    # 使用 find 查找所有匹配的文件，忽略 .git 目录和 .gitignore 文件以及当前目录下的 index.html 文件
    # 然后使用 sed 进行字符串替换
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_1}#${NEW_STRING_1}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_2}#${NEW_STRING_2}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_3}#${NEW_STRING_3}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_4}#${NEW_STRING_4}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_TAG}#${NEW_TAG}#g" {} +
done

# 检查是否存在 cn 目录以及 cn 目录下的 home-zh.html 文件
if [ -d "cn" ] && [ -f "cn/home-zh.html" ]; then
    mv "cn/home-zh.html" "cn/index.html"
    echo "Renamed 'cn/home-zh.html' to 'cn/index.html'"
fi

# 检查并替换 favicon 文件
SOURCE_FAVICON="default-favicon.v3.png"
TARGET_FAVICON="framerusercontent.com/sites/icons/default-favicon.v3.png"

if [ -f "$SOURCE_FAVICON" ] && [ -f "$TARGET_FAVICON" ]; then
    if ! cmp -s "$SOURCE_FAVICON" "$TARGET_FAVICON"; then
        cp "$SOURCE_FAVICON" "$TARGET_FAVICON"
        echo "Replaced favicon file."
    fi
fi

echo "String replacement completed."
