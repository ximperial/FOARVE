scope widescreen initializer init
    globals
        boolean array isWideScreen
    endglobals
    
    private function action takes nothing returns nothing
        local integer pid = GetPlayerId(GetTriggerPlayer())
        set isWideScreen[pid] = not isWideScreen[pid]
        if GetLocalPlayer() == GetTriggerPlayer() then
            call SetWidescreenState(isWideScreen[pid])
        endif
        call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 10, "WideScreen: " + B2S(isWideScreen[pid]))
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-widescreen", true)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-widescreen", true)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope