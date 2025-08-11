local M = {}

M.g = {
    mapleader = " ",
}

M.opt = {
    autoread = true, -- 自动加载
    autowrite = true, -- 开启自动保存
    backup = false, -- 禁止备份
    clipboard = 'unnamedplus', -- 和系统剪贴板同步
    completeopt = "menu,menuone,noselect", -- 补全菜单行为
    cursorline = true, -- 高亮所在行
    colorcolumn = '80', -- 右侧参考线
    encoding = 'UTF-8', -- 编码格式
    expandtab = true, -- 使用空格替换tab
    ignorecase = true, -- 搜索忽略大小写
    incsearch = true, -- 边输入边搜索
    list = true, -- 显示不可见字符
    listchars = "tab:→ ,space:·", -- 空格使用·显示
    mouse = 'a', -- 开启鼠标
    number = true, -- 显示行号
    pumblend = 10, -- 弹出菜单透明度
    pumheight = 10, -- 弹出菜单中显示最大条目数
    relativenumber = true, -- 显示相对行号
    scrolloff = 6, -- 移动时上方保留6行
    showmode = false, -- 禁用模式显示器
    shiftround = true, -- 自动缩进
    shiftwidth = 4, -- 4个空格
    sidescrolloff = 8, -- 移动时下方保留8行
    signcolumn = 'yes', -- 左侧图标列
    smartcase = true, -- 有大写则搜索不忽略大小写
    smartindent = true, -- 自动插入缩进
    spelllang = { "en" }, -- 拼写检查
    splitbelow = true, -- 新窗口位于当前窗口下方
    splitright = true, -- 新窗口位于当前窗口右方
    swapfile = false, -- 禁止创建swap文件
    tabstop = 4, -- 4个空格
    termguicolors = true, -- 真彩色支持
    wildmode = "longest:full,full", -- 命令行补全模式
    wrap = false, -- 禁用自动拆行
}

for prefix, tbl in pairs(M) do
    for key, value in pairs(tbl) do
        vim[prefix][key] = value
    end
end

vim.opt.whichwrap:append "<>[]hl" -- 行尾行首切换

return M
