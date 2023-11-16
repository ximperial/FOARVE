scope Misc initializer init

    globals
        private timer array tmr
        real array OmniVamp
        real array AbilityHaste
        integer array CritRATE
        real array CritDMG
        real array CritResist
    endglobals

    private function SetUnitBound takes unit u returns nothing
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local real x2 
        local real y2
        local integer i

        if IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) or not IsTerrainWalkable(x, y) then
            set i = 1 
            loop
                exitwhen i > 32
                set x2 = x + 128 * i
                set y2 = y + 128 * i
                if IsTerrainWalkable(x2, y2) then
                    call SetUnitPosition(u, x2, y2)
                    exitwhen true
                else
                    set x2 = x - 128 * i
                    set y2 = y - 128 * i
                    if IsTerrainWalkable(x2, y2) then
                        call SetUnitPosition(u, x2, y2)
                        exitwhen true
                    else
                        set x2 = x + 128 * i
                        set y2 = y - 128 * i
                        if IsTerrainWalkable(x2, y2) then
                            call SetUnitPosition(u, x2, y2)
                            exitwhen true
                        else
                            set x2 = x - 128 * i
                            set y2 = y + 128 * i
                            if IsTerrainWalkable(x2, y2) then
                                call SetUnitPosition(u, x2, y2)
                                exitwhen true
                            endif
                        endif
                    endif
                endif
                set i = i + 1
            endloop
        endif
    endfunction

    private function active takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer userid = GetUnitUserData(u)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local framehandle frame1
        local real reg
        local real dur
        local integer i

        if IsUnitAlive(u) then
            set reg = hpreg[userid] * hpreg2[userid] / 10
            if reg > 0 and GetUnitCurrentLife(u) != GetUnitMaxLife(u) then
                call SetUnitCurrentLife(u, GetUnitCurrentLife(u) + reg)
            endif

            set reg = mpreg[userid] * mpreg2[userid] / 10
            if reg > 0 and GetUnitCurrentMana(u) != GetUnitMaxMana(u) then
                call SetUnitCurrentMana(u, GetUnitCurrentMana(u) + reg)
            endif

            if u == MainHero[pid] then
                if not IsUnitInvulnerable(u) and not IsUnitPaused(u) then
                    call SetUnitBound(u)
                endif
                call EnumUnitAbilities(u, null, function DynamicAbility)
            endif
        endif

        set z = null
        set u = null
        set frame1 = null
    endfunction

    private function action takes nothing returns nothing
        local unit u = GetIndexUnit()
        local integer userid = GetUnitUserData(u)
        
        set OmniVamp[userid] = 0
        set AbilityHaste[userid] = 0
        set CritRATE[userid] = 0
        set CritDMG[userid] = 1
        set CritResist[userid] = 0
        set hpreg[userid] = 0
        set mpreg[userid] = 0
        set hpreg2[userid] = 1
        set mpreg2[userid] = 1
        set tmr[userid] = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(tmr[userid]) , 0, u)
        call TimerStart(tmr[userid] , 0.1, true, function active)

        set u = null
    endfunction

    private function action2 takes nothing returns nothing
        local unit u = GetIndexUnit()
        local integer userid = GetUnitUserData(u)

        call FlushChildHashtable(ht, GetHandleId(tmr[userid]))
        call PauseTimer(tmr[userid])
        call DestroyTimer(tmr[userid])

        set u = null
    endfunction

    private function buffed takes nothing returns nothing
        local timer z
        local unit u = GetTriggerBuffSourceUnit()
        local unit t = GetTriggerBuffTarget()
        local buff buf = GetTriggerBuff()
        local integer bid = GetBuffTypeId(buf)
        local integer userid = GetUnitUserData(u)
        local integer userid2 = GetUnitUserData(t)
        local real reg

        if bid == 'B00N' then
            set reg = GetUnitMaxLife(t) * 0.09
            set hpreg[userid2] = hpreg[userid2] + reg
            call SaveReal(ht, StringHash("fountainhp") , userid2, reg)
            set reg = GetUnitMaxMana(t) * 0.09
            set mpreg[userid2] = mpreg[userid2] + reg
            call SaveReal(ht, StringHash("fountainmp") , userid2, reg)
        elseif bid == 'B01C' then
            set hpreg[userid2] = hpreg[userid2] + 20 + 3 * GetHeroLevel(t)
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, t)
            call SaveInteger(ht, GetHandleId(z) , 0, GetHeroLevel(t))
            call TimerStart(z, 0.1, true, function healpot)
        elseif bid == 'B01K' then
            set mpreg[userid] = mpreg[userid] + 15 + 2 * GetHeroLevel(u)
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, GetHeroLevel(u))
            call TimerStart(z, 0.1, true, function manapot)
        elseif bid == 'B00B' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call TimerStart(z, 0.1, true, function satomiE)
        elseif bid == 'B01H' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call TimerStart(z, 0.1, true, function arthurE)
        elseif bid == 'B01D' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call TimerStart(z, 0.1, true, function salterE) 
        elseif bid == 'B00T' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call TimerStart(z, 0.1, true, function vegetaE)
        endif

        set z = null
        set u = null
        set t = null
        set buf = null
    endfunction

    private function debuffed takes nothing returns nothing
        local unit u = GetTriggerBuffSourceUnit()
        local unit t = GetTriggerBuffTarget()
        local buff buf = GetTriggerBuff()
        local integer bid = GetBuffTypeId(buf)
        local integer userid = GetUnitUserData(u)
        local integer userid2 = GetUnitUserData(t)
        local real reg

        if bid == 'B00N' then
            set reg = LoadReal(ht, StringHash("fountainhp") , userid2)
            set hpreg[userid2] = hpreg[userid2] - reg
            set reg = LoadReal(ht, StringHash("fountainmp") , userid2)
            set mpreg[userid2] = mpreg[userid2] - reg
        endif

        set u = null
        set t = null
        set buf = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterUnitIndexEvent(function action)
        call RegisterUnitDeindexEvent(function action2)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_BUFF_RECEIVED, function buffed)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_BUFF_ENDED, function debuffed)
    endfunction
endscope