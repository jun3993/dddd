local autobondUrl = "https://raw.githubusercontent.com/thiennrb7/Script/main/autobond"
-- 외부 스크립트 실행 함수local function executeAutobond()    local success, err = pcall(function()        loadstring(game:HttpGet(autobondUrl, true))()    end)    if not success then        warn("Autobond failed:", err)    endend
-- 예약 함수local function queueWrapper()    local code = ("loadstring(game:HttpGet('%s', true))()"):format(game:GetService("HttpService"):UrlEncode(autobondUrl))    if syn and syn.queue_on_teleport then        syn.queue_on_teleport(code)    elseif queue_on_teleport then        queue_on_teleport(code)    endend
-- 텔레포트 이벤트 바인딩local function bindTeleportListener()    local Players = game:GetService("Players")    local player = Players.LocalPlayer    if player then        player.OnTeleport:Connect(function(state)            if state == Enum.TeleportState.Started then                queueWrapper() -- 텔레포트 시작 시 다시 예약            end        end)    endend
-- 초기 실행executeAutobond()
-- 30초 후 추가 실행task.delay(30, function()    executeAutobond()end)
-- 텔레포트 예약 및 이벤트 연결queueWrapper()bindTeleportListener()
