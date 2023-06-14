scope loweff initializer init
    globals
        boolean array LowEffect
    endglobals
    
    private function action takes nothing returns nothing
        local integer pid = GetPlayerId(GetTriggerPlayer())
        set LowEffect[pid] = not LowEffect[pid]
        call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 10, "LowEffect: " + B2S(LowEffect[pid]))
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-loweff", false)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-loweff", false)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope