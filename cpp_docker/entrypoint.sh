#!/bin/bash
set -e

# 允许生成无限大小的 core dump 文件
ulimit -c unlimited

# # 设置 core dump 文件生成在当前工作目录，文件名格式 core.<exe>.<pid>
# sudo sh -c "echo './core.%e.%p' > /proc/sys/kernel/core_pattern"

echo "Core pattern set to:"
cat /proc/sys/kernel/core_pattern

while true
do
   sleep 10
done