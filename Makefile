

# 获取当前文件夹下所有 .dot 文件
# 使用 wildcard 函数获取当前文件夹下所有以 .dot 结尾的文件，并将其保存到 DOT_FILES 变量中
DOT_FILES := $(wildcard *.dot)

# 将 .dot 文件转换为 .png 文件
# 使用 patsubst 函数将 DOT_FILES 中的文件名后缀从 .dot 替换为 .png，并将结果保存到 PNG_FILES 变量中
PNG_FILES := $(patsubst %.dot,%.png,$(DOT_FILES))
SVG_FILES := $(patsubst %.dot,%.svg,$(DOT_FILES))

# 默认目标（生成所有 .png 文件）
# 声明一个名为 all 的默认目标，它依赖于 PNG_FILES 中的所有文件
all: $(PNG_FILES)

# 生成 .png 文件的规则
# 定义一个规则，指示如何将 .dot 文件转换为 .png 文件。
# $< 表示规则的第一个依赖项，即输入的 .dot 文件名；$@ 表示规则的目标，即输出的 .png 文件名。此规则使用 dot 命令将输入的 .dot 文件转换为输出的 .png 文件
%.png: %.dot
	dot $< -T png -o $@

%.svg: %.dot
	dot $< -T svg -o $@

# 清理生成的文件
clean:
	rm -f $(PNG_FILES)
