scope DamageEvent initializer init

    globals
        private ability abil1 = null
    endglobals

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetEventDamageSource()
        local unit t = GetTriggerUnit()
        local real r = GetEventDamage()
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local integer userid = GetUnitUserData(u)
        local integer userid2 = GetUnitUserData(t)
        local unit d
        local real dmg
        local item it
        local real r1

        if r > 0 and UnitHasItemOfTypeBJ(u, 'I06N') and not IsUnitTower(t) then
            if r > GetUnitCurrentLife(t) then
                set dmg = GetUnitCurrentLife(t) * OmniVamp[userid]
            else
                set dmg = r * OmniVamp[userid]
            endif
            call SetUnitCurrentLife(u, GetUnitCurrentLife(u) + dmg)
        endif
        if r > 0 and HaveSavedReal(ht, StringHash("EmiyaE") , GetHandleId(t)) then
            if r <= LoadReal(ht, StringHash("EmiyaE") , GetHandleId(t)) then
                call SaveReal(ht, StringHash("EmiyaE") , GetHandleId(t) , LoadReal(ht, StringHash("EmiyaE") , GetHandleId(t)) - r)
                call SetEventDamage(0)
                set r = GetEventDamage()
            else
                call SetEventDamage(r - LoadReal(ht, StringHash("EmiyaE") , GetHandleId(t)))
                call RemoveSavedReal(ht, StringHash("EmiyaE") , GetHandleId(t))
                set r = GetEventDamage()
            endif
        endif
        if(not GetEventIsAttack() and not GetEventIsRanged()) then
            if IsUnitHero(t) then
                call SetEventDamage(r * 0.75)
                set r = GetEventDamage()
            endif
            if r > 230 and UnitHasItemOfTypeBJ(t, 'I00P') then
                set it = GetItemOfTypeFromUnitBJ(t, 'I00P')
                if GetItemRemainingCooldown(it) == 0 then
                    call StartItemCooldown(t, it, 20)
                    set dmg = r - 0.08 * GetUnitMaxLife(t)
                    if dmg < 0 then
                        set dmg = 0
                    endif
                    call SetEventDamage(dmg)
                    set r = GetEventDamage()
                endif
            endif
            if r > 0 and UnitHasItemOfTypeBJ(t, 'I00R') then
                set dmg = r * 0.1
                if dmg > 170 then
                    set dmg = 170
                endif
                call SetEventDamage(r - dmg)
                set r = GetEventDamage()
            endif
            if r > 60 and UnitHasItemOfTypeBJ(u, 'I02T') then
                set it = GetItemOfTypeFromUnitBJ(u, 'I02T')
                if GetItemRemainingCooldown(it) == 0 then
                    call StartItemCooldown(u, it, 3)
                    set dmg = r + 0.65 * GetHeroPrimaryStat(u, true) * 0.75
                    call SetEventDamage(dmg)
                    set r = GetEventDamage()
                endif
            endif
            if r > 90 and UnitHasItemOfTypeBJ(u, 'I01Q') and not echosabre[pid] then
                set it = GetItemOfTypeFromUnitBJ(u, 'I01Q')
                if GetItemRemainingCooldown(it) == 0 then
                    call StartItemCooldown(u, it, 3)
                    set d = DummyCall(GetOwningPlayer(u) , GetUnitX(t) , GetUnitY(t))
                    call UnitAddAbility(d, 'A018')
                    set abil1 = GetUnitAbility(d, 'A018')
                    call CastAbilityTarget(abil1 , t)
                    call UnitRemoveAbility(d, 'A018')
                    call DummyRecycle(d)
                    if not HaveSavedInteger(ht, StringHash("Echosabre_" + I2S(pid)) , GetHandleId(t)) then
                        call SaveInteger(ht, StringHash("Echosabre_" + I2S(pid)) , GetHandleId(t) , 1)
                        set z = CreateTimer()
                        call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
                        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
                        call SaveInteger(ht, GetHandleId(z) , 0, 0)
                        call TimerStart(z, 0.5, true, function EchoSabre)
                    endif
                endif
            endif
            if r > 0 and CritRATE[userid] != 0 then
                set r1 = CritRATE[userid]
                if r1 > 60 then
                    set r1 = 60
                endif
                if GetRandomInt(1, 100) <= r1 then
                    set dmg = r * (CritDMG[userid] - CritResist[userid2])
                    call SetEventDamage(dmg)
                    set r = GetEventDamage()
                endif
            endif
            set d = LoadUnitHandle(ht, StringHash("AizenD") , GetHandleId(u))
            if r > GetHeroPrimaryStat(u, true) * 2 and GetUnitAbilityLevel(u, 'B016') > 0 and IsUnitEnemy(u, GetOwningPlayer(d)) and IsUnitType(u, UNIT_TYPE_HERO) and GetUnitTypeId(u) != 'H046' and IsUnitAlive(u) then
                call UnitRemoveAbility(u, 'A07Q')
                call UnitRemoveAbility(u, 'B016')
                call AizenD_Func1(t, u)
            endif
            set d = LoadUnitHandle(ht, StringHash("AizenD") , GetHandleId(t))
            if r > GetHeroPrimaryStat(u, true) * 2 and GetUnitAbilityLevel(t, 'B016') > 0 and IsUnitEnemy(u, GetOwningPlayer(d)) and IsUnitType(u, UNIT_TYPE_HERO) and GetUnitTypeId(u) != 'H046' and IsUnitAlive(u) then
                call UnitRemoveAbility(t, 'A07Q')
                call UnitRemoveAbility(t, 'B016')
                call AizenD_Func1(t, u)
            endif
            if r > GetHeroPrimaryStat(u, true) * 2 and GetUnitAbilityLevel(t, 'B00U') > 0 and IsUnitEnemy(u, GetOwningPlayer(t)) and IsUnitType(u, UNIT_TYPE_HERO) and GetUnitTypeId(u) != 'H011' and IsUnitAlive(u) then
                call RemoveSavedBoolean(ht, StringHash("AliceF") , GetHandleId(t))
                call UnitRemoveAbility(t, 'A0IA')
                call UnitRemoveAbility(t, 'B00U')
                call AliceF_Func1(t, u)
            endif
        endif

        set z = null
        set u = null
        set t = null
        set d = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DAMAGED, function action)
    endfunction
endscope