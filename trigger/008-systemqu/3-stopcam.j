scope stopcam initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        call StopCameraForPlayerBJ(p)
        set p = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-stopcam", true)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-stopcam", true)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope