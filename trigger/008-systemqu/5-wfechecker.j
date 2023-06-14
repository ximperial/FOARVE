scope wfechecker initializer init
    globals
        boolean WFECHECK = false
    endglobals
    
    private function action takes nothing returns nothing
        local framehandle pFrame
        
        if playerCount > 1 and not WFECHECK then
            set pFrame = GetFrameByName("WFEHPTextFrame", 0)
            if pFrame != null then
                set WFECHECK = true
                call CustomDefeatBJ(GetLocalPlayer(), "WFE Detected")
            endif
        endif
        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "WFE Checker: Activated!")
        
        set pFrame = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-WFECHECK", true)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-WFECHECK", true)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope