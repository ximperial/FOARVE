scope advancedstreak initializer init
    
    globals
        private timer array timer1
        private integer array killContinue
        private integer array killStreak
        private boolean array bossKiller
        private boolean array firstBlood
    endglobals
    
    private function text1 takes player p, integer continue, integer streak returns string
        if continue == 0 and streak == 0 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF0000This is the power of Devil|r"
        endif
        if continue == 3 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff80ff80It's about time, but I'm ready|r"
        elseif continue == 4 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff4B0082I was still thinking about saying it. I am very grateful that I met you|r"
        elseif continue == 5 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF00FFWeevil please do something about it|r"
        elseif continue == 6 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF8C00I'm planning something|r"
        elseif continue == 7 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffB8860BAbsolute Absolute Absolute|r"
        elseif continue == 8 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF00FFwhat are you doing today|r"
        elseif continue == 9 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF0000Ha, Hahaha|r"
        elseif continue == 10 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF0000The fun continues|r"
        elseif continue == 11 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cffFF8C00Why should i stop|r"
        endif
        if streak == 2 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff0000CDI can afford it|r"
        elseif streak == 3 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff80ff80Let's play the final game there. The final game of hope and despair|r"
        elseif streak == 4 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff1E90FFI like all my favorite things more|r"
        elseif streak == 5 then
            return COLOR[GetPlayerId(p)] + playerName[GetPlayerId(p)] + "|r |cff4169E1Your grudge is amazing|r"
        endif
        return ""
    endfunction

    private function KillstreakEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local real duration = LoadReal(ht, GetHandleId(z) , 0)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        if not IsUnitInvulnerable(u) then
            set duration = duration - 0.02
            call SaveReal(ht, GetHandleId(z) , 0, duration)
        endif
        if duration <= 0 or not IsUnitAlive(u) then
            set killStreak[pid] = 0
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set u = null
    endfunction

    private function KillSystem takes nothing returns nothing
        local timer z
        local unit u = GetKillingUnit()
        local unit t = GetTriggerUnit()
        local player p1 = GetOwningPlayer(u)
        local player p2 = GetOwningPlayer(t)
        local string s1 = ""
        local string s2 = ""
        local string s3 = ""
        local integer pid1 = GetPlayerId(p1)
        local integer pid2 = GetPlayerId(p2)
        local integer gold
        local integer i

        if IsUnitHero(t) and not IsUnitIllusion(t) then
            set scoredeath[pid2] = scoredeath[pid2] + 1
            if u != null then
                if UserPlayer(p1) or p1 == Player(0) or p1 == Player(6) then
                    set scorekill[pid1] = scorekill[pid1] + 1
                    set gold = 30 + (killContinue[pid2] * 30) + (killStreak[pid1] * 30)
                    if IsUnitAlly(u, Player(0)) then
                        set i = 1
                        loop
                            exitwhen i > 5
                            if HaveSavedReal(ht, StringHash("Assist_" + I2S(pid2)) , i) and p1 != Player(i) then
                                set scoreassist[i] = scoreassist[i] + 1
                                set s1 = s1 + COLOR[i] + playerName[i] + "|r "
                                set s2 = s2 + playerName[i] + " "
                                call AdjustPlayerStateBJ(gold, Player(i) , PLAYER_STATE_RESOURCE_GOLD)
                            endif
                            set i = i + 1
                        endloop
                    elseif IsUnitAlly(u, Player(6)) then
                        set i = 7
                        loop
                            exitwhen i > 11
                            if HaveSavedReal(ht, StringHash("Assist_" + I2S(pid2)) , i) and p1 != Player(i) then
                                set scoreassist[i] = scoreassist[i] + 1
                                set s1 = s1 + COLOR[i] + playerName[i] + "|r "
                                set s2 = s2 + playerName[i] + " "
                                call AdjustPlayerStateBJ(gold, Player(i) , PLAYER_STATE_RESOURCE_GOLD)
                            endif
                            set i = i + 1
                        endloop
                    endif
                    call FlushChildHashtable(ht, StringHash("Assist_" + I2S(pid2)))
                    if UserPlayer(p1) then
                        set z = timer1[pid1]
                        if z != null then
                            call FlushChildHashtable(ht, GetHandleId(z))
                            call PauseTimer(z)
                            call DestroyTimer(z)
                        endif
                        set z = CreateTimer()
                        call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
                        call SaveReal(ht, GetHandleId(z) , 0, 15)
                        call TimerStart(z, 0.02, true, function KillstreakEnd)
                        set timer1[pid1] = z
                        set gold = 90 + (killContinue[pid2] * 90) + (killStreak[pid1] * 90)
                        set s3 = COLOR[pid1] + playerName[pid1] + "|r has killed " + COLOR[pid2] + playerName[pid2] + "|r"
                        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, s3)
                        if firstBlood[pid1] then
                            call AdjustPlayerStateBJ(gold, p1, PLAYER_STATE_RESOURCE_GOLD)
                            set s3 = COLOR[pid1] + playerName[pid1] + "|r pwned " + COLOR[pid2] + playerName[pid2] + "|r head for |cffffcc00" + I2S(gold) + "|r gold\nAssisted By " + s1
                            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, s3)
                            set killContinue[pid2] = 0
                            if killContinue[pid1] < 11 then
                                set killContinue[pid1] = killContinue[pid1] + 1
                            endif
                            if killContinue[pid1] >= 3 then
                                set s3 = "war3mapImported\\SoundKill" + I2S(killContinue[pid1]) + ".mp3"
                                call SoundStart(s3)
                                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, text1(p1, killContinue[pid1] , 0))
                            endif
                            set killStreak[pid2] = 0
                            if killStreak[pid1] < 5 then
                                set killStreak[pid1] = killStreak[pid1] + 1
                            endif
                            call PolledWaitEx(1.0)
                            if killStreak[pid1] >= 2 then
                                set s3 = "war3mapImported\\KillContinue" + I2S(killStreak[pid1]) + ".mp3"
                                call SoundStart(s3)
                                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, text1(p1, 0, killStreak[pid1]))
                            endif
                        else
                            set firstBlood[pid1] = true
                            set gold = 300
                            call SoundStart("war3mapImported\\firstblood.mp3")
                            call AdjustPlayerStateBJ(gold, p1, PLAYER_STATE_RESOURCE_GOLD)
                            set s3 = COLOR[pid1] + playerName[pid1] + "|r pwned " + COLOR[pid2] + playerName[pid2] + "|r head for |cffffcc00" + I2S(gold) + "|r gold\nAssisted By " + s1
                            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, s3)
                            call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, text1(p1, 0, 0))
                        endif
                    endif
                endif
            else
                set s3 = COLOR[pid2] + playerName[pid2] + "|r has just killed himself"
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, s3)
            endif
        endif

        set z = null
        set u = null
        set t = null
        set p1 = null
        set p2 = null
    endfunction

    globals
        private timer array timer2
    endglobals

    private function destroyAssist takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local integer pid = GetPlayerId(GetOwningPlayer(t))
        local real duration = LoadReal(ht, GetHandleId(z) , 0)

        if not IsUnitInvulnerable(t) then
            set duration = duration - 0.02
            call SaveReal(ht, GetHandleId(z) , 0, duration)
        endif
        if duration <= 0 or not IsUnitAlive(t) then
            if IsUnitAlive(t) then
                call FlushChildHashtable(ht, StringHash("Assist_" + I2S(pid)))
            endif
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
        endif

        set z = null
        set t = null
    endfunction

    private function Assist takes nothing returns nothing
        local timer z
        local unit u = GetEventDamageSource()
        local unit t = GetTriggerUnit()
        local player p1 = GetOwningPlayer(u)
        local player p2 = GetOwningPlayer(t)
        local integer pid1 = GetPlayerId(p1)
        local integer pid2 = GetPlayerId(p2)
        local integer i

        if GetEventDamage() > 0 and UserPlayer(p1) then
            if not HaveSavedReal(ht, StringHash("Assist_" + I2S(pid2)) , pid1) then
                call SaveReal(ht, StringHash("Assist_" + I2S(pid2)) , pid1, 0)
            endif
            if timer2[pid2] == null then
                set timer2[pid2] = CreateTimer()
            endif
            set z = timer2[pid2]
            call SaveUnitHandle(ht, GetHandleId(z) , 0, t)
            call SaveReal(ht, GetHandleId(z) , 0, 10)
            call TimerStart(z, 0.02, true, function destroyAssist)
        endif

        set z = null
        set u = null
        set t = null
        set p1 = null
        set p2 = null
    endfunction

    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function KillSystem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DAMAGED, function Assist)
        
        set t = null
    endfunction
endscope