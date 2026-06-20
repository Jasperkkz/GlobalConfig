-- ====================== 配置区 ======================
local HYPER = { "cmd", "alt", "ctrl", "shift" }
local MAX_SLOT = 9

local windowSlots = {}
local inBindMode = false

-- 窗口关闭自动解绑
local function clearSlotByWin(win)
    local wid = win:id()
    for slot, w in pairs(windowSlots) do
        if w:id() == wid then
            windowSlots[slot] = nil
            hs.alert.show("槽" .. slot .. "窗口已关闭，绑定释放")
            break
        end
    end
end
hs.window
    .filter
    .new()
    :subscribe(hs.window.filter.windowDestroyed, clearSlotByWin)

-- Hyper+` 切换绑定模式
hs.hotkey.bind(HYPER, "`", function ()
    inBindMode = not inBindMode
    if inBindMode then
        hs.alert.show("绑定模式开启：Hyper+1~9 绑定窗口 | Hyper+` 退出")
    else
        hs.alert.show("已退出绑定模式")
    end
end)

-- Hyper+1~9：绑定模式 → 绑定；普通模式 → 切换窗口
for i = 1, MAX_SLOT do
    local num = tostring(i)
    hs.hotkey.bind(HYPER, num, function ()
        if inBindMode then
            local currWin = hs.window.focusedWindow()
            if not currWin then
                hs.alert.show("未选中窗口")
            else
                windowSlots[num] = currWin
                hs.alert.show("成功绑定 Hyper+" .. num)
            end
            inBindMode = false
        else
            local targetWin = windowSlots[num]
            if not targetWin then
                hs.alert.show("槽" .. num .. "无绑定窗口")
                return
            end
            local frontWin = hs.window.focusedWindow()
            if frontWin and frontWin:id() == targetWin:id() then
                targetWin:minimize()
            else
                targetWin:unminimize()
                targetWin:focus()
                targetWin:bringToFront()
            end
        end
    end)
end

hs.alert.show("加载完成：Hyper+` 绑定模式，Hyper+1~9 切换窗口")
