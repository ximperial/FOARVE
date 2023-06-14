//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_YugiD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local integer i = 1
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Yugi_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        set x = PolarX(GetUnitX(c), 200, a)
        set y = PolarY(GetUnitY(c), 200, a)
        call Effect("war3mapimported\\exodia.mdx", x, y, 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\AZ_Rune31.mdx", x, y, 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
    endif
    if count <= 30 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + R2I(255/30) )
        call SetSpecialEffectVertexColour(e, 255, 255, 255, LoadInteger(ht, GetHandleId(z), 2))
    endif
    if count == 30 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 2)
        call SetSpecialEffectTimeScale(e, 1.6)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Yugi_7-1.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        loop
            exitwhen i > 10
            set x = PolarX(GetEffectX(e), 160 * i, a)
            set y = PolarY(GetEffectY(e), 160 * i, a)
            call GroupEnumUnitsInRange(gGroup, x, y, 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            call Effect("war3mapimported\\SZBYAFB2.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 50 then
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
    set g = null
    set e = null
endfunction

function Trig_YugiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A07P' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z) , 2, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_YugiD_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_YugiD takes nothing returns nothing
    set gg_trg_YugiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YugiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_YugiD, function Trig_YugiD_Actions)
endfunction