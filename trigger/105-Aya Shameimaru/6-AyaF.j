//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AyaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    local integer i = 0
    local effect e
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Aya_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapImported\\Black.mdl", x, y, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        loop
            exitwhen i > 6
            set x1 = PolarX(x, GetRandomReal(50, 200), randomAngle())
            set y1 = PolarY(y, GetRandomReal(50, 200), randomAngle())
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", x1, y1, 0, randomAngle() , 0, 0, 1 , 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call SaveEffectHandle(ht, GetHandleId(z), 2 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Aya_6-1.mp3")
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Aya_6-2.mp3")
    endif
    if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 then
        call SoundStart("war3mapImported\\Aya_1-1.mp3")
    endif
    if count <= 150 then
        set i = 0
        loop
            exitwhen i > 6
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x1 = PolarX(GetEffectX(e), 25, GetSpecialEffectYaw(e))
            set y1 = PolarY(GetEffectY(e), 25, GetSpecialEffectYaw(e))
            call SetSpecialEffectPositionEx(e, x1, y1, GetAxisZ(x1, y1))
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then 
                    if not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(c, gUnit, 1.8 * GetHeroInt(c, true))
                        call GroupAddUnit(g, gUnit)
                    endif
                    if count > 10 then
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif
                endif 
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator == 20 or iterator == 40 then
            call GroupClear(g)
            if iterator == 40 then
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                set i = 0
                loop
                    exitwhen i > 6
                    set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
                    call SetSpecialEffectYaw(e, randomAngle())
                    set i = i + 1
                endloop
            else
                set i = 0
                loop
                    exitwhen i > 6
                    set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
                    set a = Angle(GetEffectX(e), GetEffectY(e), x, y)
                    call SetSpecialEffectYaw(e, a)
                    set i = i + 1
                endloop
            endif
        endif
    endif
    if count == 150 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_AyaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0F6' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AyaF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_AyaF takes nothing returns nothing
    set gg_trg_AyaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AyaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AyaF, function Trig_AyaF_Actions)
endfunction