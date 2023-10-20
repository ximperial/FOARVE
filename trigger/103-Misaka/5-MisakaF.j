//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_MisakaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real a = GetUnitFacing(c)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    local effect e
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Misaka_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.1, 2.3, 125, 175, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.1, 2.3, 125, 175, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.1, 2.3, 125, 175, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.1, 2.3, 125, 175, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
    endif
    if count == 10 or count == 30 or count == 50 then
        loop
            exitwhen i > 7
            set x = PolarX(GetUnitX(c), count * 17, i * 45)
            set y = PolarY(GetUnitY(c), count * 17, i * 45)
            call Effect("war3mapimported\\MomijiThunder.mdx", x, y, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count <= 75 then
        set i = 0
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.04)
            set i = i + 1
        endloop
        set dmg = 0.3 * GetUnitAbilityLevel(c, 'B00S')
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), count * 15, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call stunUnit(gUnit, 0.5)
                call DamageUnit(c, gUnit, (11 + dmg) * GetHeroInt(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 75 then
        set i = 0
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set i = i + 1
        endloop
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
    set e = null
endfunction

function Trig_MisakaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0EG' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_MisakaF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MisakaF takes nothing returns nothing
    set gg_trg_MisakaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_MisakaF, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_MisakaF, function Trig_MisakaF_Actions )
endfunction