scope antihack initializer init
    globals
        boolean AHCHECK = false
    endglobals
    
    private function action takes nothing returns nothing
        local framehandle pFrame
        local integer pid = GetPlayerId(GetTriggerPlayer())
        
        if playerCount >= 1 and not AHCHECK then
            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, COLOR[pid] + playerName[pid] + "|r activated AntiHack!!!")
            set pFrame = GetFrameByName("WFEHPTextFrame", 0)
            if pFrame != null then
                set AHCHECK = true
                call CustomDefeatBJ(GetLocalPlayer(), "WFE Detected")
            endif
        endif
        
        
        set pFrame = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-AH", true)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-AH", true)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope