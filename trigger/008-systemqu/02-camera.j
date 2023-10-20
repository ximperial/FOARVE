scope camera initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        set camZ[pid] = S2R(SubString(GetEventPlayerChatString(), 5, StringLength(GetEventPlayerChatString())))
        if camZ[pid] > 4000 then
            set camZ[pid] = 4000
        elseif camZ[pid] < 1650 then
            set camZ[pid] = 1650
        endif
        call ResetToGameCameraForPlayer(p, 0)
        call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, camZ[pid], 0)
        set p = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-cam", false)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-cam", false)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope