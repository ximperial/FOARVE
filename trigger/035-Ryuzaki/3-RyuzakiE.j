//TESH.scrollpos=48
//TESH.alwaysfold=0
function Trig_RyuzakiE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local real cd = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryuzaki_3.mp3" )
        call SoundStart( "war3mapImported\\Ryuzaki_3-1.mp3" )
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.6, 1.5, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 10 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 800, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitAlly(gUnit, GetOwningPlayer(c)) and IsUnitHero(gUnit) and IsUnitAlive(gUnit) then
                call UnitAddAbility(gUnit, 'A0G8')
                call UnitMakeAbilityPermanent(gUnit, true, 'A0G8')
                call LinkSpell(gUnit, 'A0G8', 8, true)
                call LinkSpell(gUnit, 'B00L', 8, true)
            endif
        endloop
        call GroupClear(gGroup)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_RyuzakiE_Actions takes nothing returns nothing
    local timer z = null
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0G7' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RyuzakiE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_RyuzakiE takes nothing returns nothing
    set gg_trg_RyuzakiE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyuzakiE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyuzakiE, function Trig_RyuzakiE_Actions )
endfunction