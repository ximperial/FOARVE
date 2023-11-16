scope killme initializer init

    globals
        private boolean array killself
    endglobals

    private function endKillMe takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer duration = LoadInteger(ht, GetHandleId(z), 0)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        
        if not IsUnitInvulnerable(u) then
            set duration = duration - 1
            call SaveInteger(ht, GetHandleId(z), 0, duration)
            call DisplayTextToPlayer(GetOwningPlayer(u), 0, 0, "Killme: " + I2S(duration))
        endif

        if duration <= 0 or not IsUnitAlive(u) then
            set killself[pid] = false
            if IsUnitAlive(u) then
                call KillUnit(u)
            endif
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function runKillMe takes nothing returns nothing
        local timer z
        local integer pid = GetPlayerId(GetTriggerPlayer())
        local unit u = MainHero[pid]

        if IsUnitAlive(u) and u != null and not killself[pid] then
            set killself[pid] = true
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 30)
            call TimerStart(z, 1, true, function endKillMe)
        endif

        set z = null
        set u = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()

        call TriggerRegisterPlayerChatEvent(t, Player(1), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(2), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(3), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(4), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(5), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(7), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(8), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(9), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(10), "killme", true)
        call TriggerRegisterPlayerChatEvent(t, Player(11), "killme", true)
        call TriggerAddAction(t, function runKillMe)

        set t = null
    endfunction
endscope