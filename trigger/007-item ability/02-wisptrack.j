scope wisptrack initializer init

    private function period takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local unit d = LoadUnitHandle(ht, GetHandleId(z), 2)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 10)
        local real a = Angle(GetUnitX(d), GetUnitY(d), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(d), GetUnitY(d), GetUnitX(t), GetUnitY(t))
        local real x = PolarX(GetUnitX(d), 700 / 50, a)
        local real y = PolarY(GetUnitY(d), 700 / 50, a)

        call SetUnitXY(d, x, y, 0)
        if IsUnitAlive(t) then
            if dist <= 100 then
                call lockUnit(t, 1.5, false)
                call RemoveUnit(d)
                call GroupRemoveUnit(g, t)
                if GroupGetCount(g) == 0 then
                    call DestroyGroup(g)
                endif
                call FlushChildHashtable(ht, GetHandleId(z))
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        else
            call GroupRemoveUnit(g, t)
            set t = GetClosestUnitGroup(GetUnitX(d), GetUnitY(d), g)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            if t == null then
                call RemoveUnit(d)
                call DestroyGroup(g)
                call FlushChildHashtable(ht, GetHandleId(z))
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        endif

        set z = null
        set u = null
        set t = null
        set d = null
        set g = null
    endfunction

    private function spawn takes group g, unit u, unit t returns nothing
        local timer z = CreateTimer()

        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveGroupHandle(ht, GetHandleId(z), 10, g)
        set bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(u), 'h00L', GetUnitX(u), GetUnitY(u), 0)
        call SetUnitScale(bj_lastCreatedUnit, 1.5, 1.5, 1.5)
        call SaveUnitHandle(ht, GetHandleId(z), 2, bj_lastCreatedUnit)
        call TimerStart(z, 0.02, true, function period)

        set z = null
    endfunction

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local group g

        if GetSpellAbilityId() == 'A0BL' then
            set g = CreateGroup()
            call GroupEnumUnitsInRect(gGroup, bj_mapInitialPlayableArea, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitEnemy(gUnit, GetOwningPlayer(u)) and IsUnitAlive(gUnit) and IsUnitHero(gUnit) and UserPlayer(GetOwningPlayer(gUnit)) then 
                    call spawn(g, u, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
        endif

        set u = null
        set g = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope