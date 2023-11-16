scope music initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        local integer musId = S2I(SubString(GetEventPlayerChatString(), 5, StringLength(GetEventPlayerChatString())))
        if musId > 0 and musId <= 8 then
            if GetLocalPlayer() == p then
                call PlayMusic("Music\\" + I2S(musId) + ".mp3")
            endif
        endif
        if musId == 0 then
            if GetLocalPlayer() == p then
                call PlayMusic("Music\\1.mp3;Music\\2.mp3;Music\\3.mp3;Music\\4.mp3;Music\\5.mp3;Music\\6.mp3;Music\\7.mp3;Music\\8.mp3")
            endif
        endif
        set p = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterPlayerChatEvent(t, Player(1), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(6), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "-mus", false)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "-mus", false)
        call TriggerAddAction(t, function action)
        set t = null
    endfunction
endscope