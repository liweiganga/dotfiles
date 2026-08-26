local Config = require('config')
-- 注册事件回调（events/ 下的 wezterm.on 为全局副作用）
require('events.right_status')


return Config:init()
    :append(require('config.appearance'))
    :append(require('config.fonts'))
    :append(require('config.general'))
    :append(require('config.keys')).options
