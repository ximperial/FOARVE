scope damageevent initializer init

    private function action takes nothing returns nothing
        local timer z
        local unit source = GetEventDamageSource()
        local unit target = GetTriggerUnit()
        local unit d
        local real dmg = GetEventDamage()
        local real vdmg = dmg
        local real vdmg2 
        local integer cid = GetPlayerId(GetOwningPlayer(source))
        local integer tid = GetPlayerId(GetOwningPlayer(target))
        local real a
        local real x
        local real y
        local group g
        local integer alvl
        local real randomA
        
        if dmg > GetHeroPrimaryStat(source, true) * 2 and target == gg_unit_H0DS_0046 and GetRandomInt(1, 100) <= 30 and not LoadBoolean(ht, StringHash("BossF"), 0) and FilterGeneral(target, source) then
            call bossF(target, source)
            call SaveBoolean(ht, StringHash("BossF"), 0, true)
            set z = CreateTimer()
            call TimerStart(z, 40, false, function BossExtraEnd)
        elseif dmg > GetHeroPrimaryStat(source, true) * 2 and target == gg_unit_H0DS_0046 and GetRandomInt(1, 100) <= 30 and not LoadBoolean(ht, StringHash("BossD"), 0) and FilterGeneral(target, source) then
            call bossD(target, source)
            call SaveBoolean(ht, StringHash("BossD"), 0, true)
            set z = CreateTimer()
            call TimerStart(z, 40, false, function BossExtra2End)
        endif
    
        if dmg > 0 and GetUnitAbilityLevel(source, 'A04G') > 0 and FilterGeneral(source, target) and(GetEventIsAttack() or GetEventIsRanged()) then
            set z = CreateTimer()
            set alvl = GetUnitAbilityLevel(source, 'A04G')
            call UnitAddBonus(source, BONUS_ATTACK, 2 + alvl)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, source)
            call SaveInteger(ht, GetHandleId(z) , 0, 2 + alvl)
            call TimerStart(z, 10, false, function HibariE_End)
            set z = null
        endif
    
        if dmg > 0 and GetRandomInt(1, 100) <= 10 + 5 * GetUnitAbilityLevel(source, 'A08N') and GetUnitAbilityLevel(source, 'B01Q') > 0 and FilterGeneral(source, target) and(GetEventIsAttack() or GetEventIsRanged()) then
            set a = Angle(GetUnitX(source) , GetUnitY(source) , GetUnitX(target) , GetUnitY(target))
            call EffectUnitColor(source, "war3mapImported\\huoyantuci.mdl", GetUnitX(target) , GetUnitY(target) , 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(target) , - 100, a)
            set y = PolarY(GetUnitY(target) , - 100, a)
            call EffectUnitColor(source, "war3mapImported\\daoguang.mdl", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set randomA = randomAngle()
            set x = PolarX(GetUnitX(target), 140, randomA)
            set y = PolarY(GetUnitY(target), 140, randomA)
            call SetUnitXY(source, x, y, 1)
            set a = Angle(GetUnitX(source) , GetUnitY(source) , GetUnitX(target) , GetUnitY(target))
            call SetUnitFacingEx(source, a, true)
            call SetEventDamage(dmg + 2 * GetHeroAgi(source, true))
            set dmg = GetEventDamage()
        endif
    
        set d = LoadUnitHandle(ht, StringHash("AizenD"), GetHandleId(target))
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(source, 'B016') > 0 and IsUnitEnemy(source, GetOwningPlayer(d)) and IsUnitType(source, UNIT_TYPE_HERO) and GetUnitTypeId(source) != 'H046' and IsUnitAlive(source) then
            call UnitRemoveAbility(source, 'A07Q')
            call UnitRemoveAbility(source, 'B016')
            call AizenD_Start(target, source)
        elseif dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B016') > 0 and IsUnitEnemy(source, GetOwningPlayer(d)) and IsUnitType(source, UNIT_TYPE_HERO) and GetUnitTypeId(source) != 'H046' and IsUnitAlive(source) then
            call UnitRemoveAbility(target, 'A07Q')
            call UnitRemoveAbility(target, 'B016')
            call AizenD_Start(target, source)
        endif
    
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B00I') > 0 and IsUnitEnemy(source, GetOwningPlayer(target)) and IsUnitType(source, UNIT_TYPE_HERO) and GetUnitTypeId(source) != 'H00Y' and IsUnitAlive(source) then
            call UnitRemoveAbility(target, 'A0HR')
            call UnitRemoveAbility(target, 'B00I')
            call TodoKirinT_Start(target, source)
        endif
    
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B00U') > 0 and IsUnitEnemy(source, GetOwningPlayer(target)) and IsUnitType(source, UNIT_TYPE_HERO) and GetUnitTypeId(source) != 'H011' and IsUnitAlive(source) then
            call RemoveSavedBoolean(ht, AliceFHash, GetHandleId(target))
            call UnitRemoveAbility(target, 'A0IA')
            call UnitRemoveAbility(target, 'B00U')
            call AliceZubergF_Start(target, source)
        endif
    
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B00Q') > 0 and IsUnitEnemy(source, GetOwningPlayer(target)) and IsUnitType(source, UNIT_TYPE_HERO) and GetUnitTypeId(source) != 'H0CA' and IsUnitAlive(source) then
            call UnitRemoveAbility(target, 'A0I1')
            call UnitRemoveAbility(target, 'B00Q')
            call ByakuranR_Start(target, source)
        endif
    
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B00J') > 0 and IsUnitEnemy(source, GetOwningPlayer(target)) and IsUnitType(source, UNIT_TYPE_HERO) then
            call UnitRemoveAbility(target, 'A0BE')
            call UnitRemoveAbility(target, 'B00J')
            call YamajiR_Start(target)
        endif
    
        if dmg > GetHeroPrimaryStat(source, true) * 2 and GetUnitAbilityLevel(target, 'B00K') > 0 and IsUnitEnemy(source, GetOwningPlayer(target)) and IsUnitType(source, UNIT_TYPE_HERO) and IsUnitAlive(source) then
            call UnitRemoveAbility(target, 'A0EW')
            call UnitRemoveAbility(target, 'B00K')
            call AnosD_Start(target, source)
        endif
    
        if dmg > 0 and FilterGeneral(source, target) and(UnitHasItemOfTypeBJ(source, 'I01Q') or UnitHasItemOfTypeBJ(source, 'I01R') or UnitHasItemOfTypeBJ(source, 'I04P')) then
            if GetEventIsAttack() or GetEventIsRanged() then
                if not IsAbilityOnCooldown(GetUnitAbility(source, 'A0BI')) then
                    call StartAbilityCooldown(GetUnitAbility(source, 'A0BI'), 3)
                    call UnitResetAttack(source)
                endif
            endif
        endif
    
        if dmg > 0 and GetUnitAbilityLevel(target, 'B01I') > 0 and FilterGeneral(target, source) and GetUnitTypeId(source) != 'h09C' then
            set vdmg = GetEventPreDamage() * 0.6
            set d = DummyCall(GetOwningPlayer(target), GetUnitX(source), GetUnitY(source))
            if IsUnitInvulnerable(source) then
                call SetUnitInvulnerable(source, false)
                if vdmg > GetUnitCurrentLife(source) then
                    call SetUnitCurrentLife(source, 1)
                else
                    call DamageUnit(d, source, vdmg)
                endif
                call SetUnitInvulnerable(source, true)
            else   
                call DamageUnit(d, source, vdmg)
            endif
            call DummyRecycle(d)
        endif
    
        if dmg > 0 and GetUnitAbilityLevel(source, 'B002') > 0 then
            call SetEventDamage(dmg * 0.5)
            set dmg = GetEventDamage()
        endif
    
        if dmg > 0 and GetUnitAbilityLevel(target, 'B002') > 0 then
            call SaveReal(ht, StringHash("sky") , GetHandleId(target) , LoadReal(ht, StringHash("sky") , GetHandleId(target)) + dmg)
            set d = LoadUnitHandle(ht, StringHash("sky") , GetHandleId(target))
            if d == null then
                call SaveUnitHandle(ht, StringHash("sky") , GetHandleId(target) , source)
            endif
            if source != d then
                call SaveUnitHandle(ht, StringHash("sky") , GetHandleId(target) , source)
            endif
            call SetEventDamage(0)
            set dmg = GetEventDamage()
        endif
    
        if dmg > 0 and HaveSavedReal(ht, StringHash("EmiyaE"), GetHandleId(target)) then
            if dmg <= LoadReal(ht, StringHash("EmiyaE") , GetHandleId(target)) then
                call SaveReal(ht, StringHash("EmiyaE") , GetHandleId(target) , LoadReal(ht, StringHash("EmiyaE") , GetHandleId(target)) - dmg)
                call SetEventDamage(0)
                set dmg = GetEventDamage()
            else
                call SetEventDamage(dmg - LoadReal(ht, StringHash("EmiyaE") , GetHandleId(target)))
                call RemoveSavedReal(ht, StringHash("EmiyaE"), GetHandleId(target))
            endif
        endif
    
        if dmg > 0 and(UnitHasItemOfTypeBJ(source, 'I06N') or UnitHasItemOfTypeBJ(source, 'I06O') or UnitHasItemOfTypeBJ(source, 'I06P')) and not IsUnitTower(target) and(GetEventIsAttack() or GetEventIsRanged()) then
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", source, "origin"))
            if dmg > GetUnitCurrentLife(target) then
                set vdmg = GetUnitCurrentLife(target) * 0.3
            else
                set vdmg = dmg * 0.3
            endif
            call SetUnitCurrentLife(source, GetUnitCurrentLife(source) + vdmg)
        endif

        if dmg > GetUnitCurrentLife(target) and GetUnitAbilityLevel(target, 'B00L') > 0 and GetUnitTypeId(source) != 'h09C' then
            call UnitRemoveAbility(target, 'A0G8')
            call UnitRemoveAbility(target, 'B00L')
            call SetUnitLifePercentBJ(target, 1)
            call SetEventDamage(0)
            set dmg = GetEventDamage()
        endif
    
        if dmg > 0 and GetUnitAbilityLevel(source, 'B018') > 0 then
            call SetEventDamage(dmg * 0.5)
            set dmg = GetEventDamage()
        endif

        set z = null
        set source = null
        set target = null
        set d = null
        set g = null
    endfunction

    private function action2 takes nothing returns nothing
        local timer z
        local unit source = GetEventDamageSource()
        local unit target = GetTriggerUnit()
        local real dmg = GetEventDamage()
        local real vdmg = dmg
        local real vdmg2
        local integer cid = GetPlayerId(GetOwningPlayer(source))
        local integer tid = GetPlayerId(GetOwningPlayer(target))
        local real a
        local real x
        local real y
        local group g
        if not GetEventIsAttack() and not GetEventIsRanged() then
            if dmg > 0 and GetOwningPlayer(target) != Player(0) and GetOwningPlayer(target) != Player(4) and GetOwningPlayer(target) != Player(8) and GetOwningPlayer(source) != Player(12) then
                call SetEventDamage(dmg * 0.75)
                set dmg = GetEventDamage()
            endif
        
            if dmg > 0 and GetUnitAbilityLevel(source, 'B01G') > 0 then
                call SetEventDamage(dmg * 1.1)
                set dmg = GetEventDamage()
            endif
        
            if dmg > 0 and GetUnitAbilityLevel(target, 'B001') > 0 then
                if UnitHasItemOfTypeBJ(target, 'I04I') then
                    set vdmg = dmg * 0.75
                elseif UnitHasItemOfTypeBJ(target, 'I02C') then
                    set vdmg = dmg * 0.8
                elseif UnitHasItemOfTypeBJ(target, 'I02B') then
                    set vdmg = dmg * 0.85
                else
                    set vdmg = dmg * 0.9
                endif
                call SetEventDamage(vdmg)
                set dmg = GetEventDamage()
            endif
        
            if dmg > 0 and GetUnitAbilityLevel(target, 'B01E') > 0 then
                set vdmg2 = LoadReal(ht, StringHash("cloud") , GetHandleId(target))
                if vdmg2 > 0 then
                    if dmg >= vdmg2 then
                        call UnitRemoveAbility(target, 'A051')
                        call UnitRemoveAbility(target, 'B01E')
                        call SetEventDamage(dmg - vdmg2)
                        set dmg = GetEventDamage()
                    else
                        set vdmg2 = vdmg2 - dmg
                        call SaveReal(ht, StringHash("cloud") , GetHandleId(target) , vdmg2)
                        call SetEventDamage(0)
                        set dmg = GetEventDamage()
                    endif
                else 
                    call UnitRemoveAbility(target, 'A051')
                    call UnitRemoveAbility(target, 'B01E')
                endif
            endif
        endif
    
        set z = null
        set source = null
        set target = null
        set g = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DAMAGED, function action)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DAMAGING, function action2)
    endfunction
endscope