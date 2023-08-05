//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_TohkaD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 6, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapimported\\blue-guagnzhu-special.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 0.9, 1, 255, PercentTo255(60), 255, PercentTo255(60))
        call Effect("war3mapimported\\A(BlackPink).mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 7, 255, 255, 255, 255)
        call Effect("war3mapimported\\TohkaEnergy.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.9, 7, 255, 255, 255, PercentTo255(30))
        call Effect("war3mapimported\\TohkaEf3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.75, 7, 255, PercentTo255(60), 255, PercentTo255(80))
    endif
    if count == 70 or count == 90 or count == 110 or count == 120 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.85, 1, 255, PercentTo255(60), 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.15, 1, 255, PercentTo255(60), 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c), 100, a)
        set y = PolarY(GetUnitY(c), 100, a)
        call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, 100, a, - 90, 0, 0.6, 1, 255, PercentTo255(60), 255, PercentTo255(60))
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapimported\\CF2.mdx", x, y, 25, a, 0, 0, 0.6, 1, 255, PercentTo255(60), 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 95 then
        call SoundStart("war3mapImported\\Tohka_7-1.mp3")
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count <= 320 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\[DoFT]az-zise-toushewu.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 7, 1, 255, PercentTo255(60), 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), GetRandomReal(50, 100), randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, PercentTo255(60), 255, PercentTo255(80))
        endif
    endif
    if count <= 350 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.6)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 350 then
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
        call Effect("war3mapimported\\bymutou-hongse-pink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[DoFT]PurpleAz-hit.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\FadeSpearPurple.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[DoFT]purple-shoot.mdx", GetUnitX(c), GetUnitY(c), 50, a, - 270, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 3.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\[A]t_icesparks.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 2.5, 1, 255, PercentTo255(40), 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count >= 350 and count <= 420 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c) , (count - 350) * 17, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(c), (count - 350) * 15, i * 40)
                set y = PolarY(GetUnitY(c), (count - 350) * 15, i * 40)
                call Effect("war3mapimported\\[DoFT]PurpleAz-hit.mdx", x, y, 25, i * 40, - 90, 0, 4, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapimported\\FadeSpearPurple.mdx", x, y, 25, i * 40, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapimported\\[DoFT]az-zise-toushewu.mdx", x, y, 25, i * 40, 0, 0, 9, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                set i = i + 1
            endloop
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, (count - 350) * 0.06, 1, 255, PercentTo255(60), 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
        endif
    endif
    if count == 420 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_TohkaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A090' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_TohkaD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_TohkaD takes nothing returns nothing
    set gg_trg_TohkaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_TohkaD, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_TohkaD, function Trig_TohkaD_Actions )
endfunction