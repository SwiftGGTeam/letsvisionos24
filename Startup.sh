#!/bin/bash

# 定义第一个要替换的字符串及其替换内容
OLD_STRING_1="My Framer Site"
NEW_STRING_1="Let's visionOS 2024"

# 定义第二个要替换的字符串及其替换内容
OLD_STRING_2="swiftgg24.framer.ai"
NEW_STRING_2="letsvisionos24.swiftgg.team"

# 定义第三个要替换的字符串及其替换内容
OLD_STRING_3="swiftgg24.framer.ai/home-zh"
NEW_STRING_3="letsvisionos24.swiftgg.team/cn"

# 定义要搜索的文件类型
FILE_TYPES=("html" "css" "js" "mjs" "xml")

# 遍历每种文件类型
for type in "${FILE_TYPES[@]}"; do
    # 使用 find 查找所有匹配的文件，忽略 .git 目录和 .gitignore 文件以及当前目录下的 index.html 文件
    # 然后使用 sed 进行字符串替换
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_1}#${NEW_STRING_1}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_2}#${NEW_STRING_2}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_3}#${NEW_STRING_3}#g" {} +
done

echo "String replacement completed."
