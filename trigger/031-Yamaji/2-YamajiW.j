//TESH.scrollpos=216
//TESH.alwaysfold=0
function Trig_YamajiW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 220 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Yamaji_2.mp3")
        call SoundStart("war3mapImported\\Yamaji_2-1.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 10 then
        call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 80 then 
        call SoundStart("war3mapImported\\Yamaji_2-2.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.5) 
        call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 120 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 205 then
        call SetUnitTimeScale(c, 0.85)
    endif
    if count <= 220 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.6, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        endif
    endif
    if count == 220 then 
        call SoundStart("war3mapImported\\Yamaji_2-3.mp3")
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapImported\\[A]earthdom(nocolor).mdl", x, y, 100, a, - 90, 0, 1.7, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\az_hitheavy.mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]hit-white-guangxiao.mdl", x, y, 50, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\qqqqqr.mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0BB')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 220 and count <= 250 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 150, a, - 90, 0, GetRandomReal(0.85, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.2, 1.75))
        endif
    endif
    if count == 250 then 
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_YamajiW_Func003 takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false)
    call UnitApplyTimedLife(GetEnumUnit(), 'BTLF', 13)
endfunction

function Trig_YamajiW_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SaveUnitHandle(ht, GetHandleId(z), 3, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0)) 
        call SoundStart("war3mapImported\\Yamaji_2-4.mp3")
        call SoundStart("war3mapImported\\Yamaji_2-5.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 400, a))
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.75)
        call Effect("war3mapImported\\az_coco_t2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 2.2, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\blink-yellow2.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 110 then
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 0.5) 
    endif
    if count == 1 or count == 40 or count == 80 or count == 120 or count == 160 then
        call Effect("war3mapImported\\[A]Explodeorange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 50 and count <= 170 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(c), GetRandomReal(- 600, 600), randomAngle())
            set bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(c), 'h0FW', x, y, randomAngle())
            call SetUnitAnimation(bj_lastCreatedUnit, "birth")
            call SetUnitScale(bj_lastCreatedUnit, 1.5, 0, 0)
            call SetUnitVertexColor(bj_lastCreatedUnit, PercentTo255(10), PercentTo255(10), PercentTo255(10), 255) 
            call PauseUnit(bj_lastCreatedUnit, true)
            call AddSpecialEffectTarget("war3mapImported\\buff_fire.mdl", bj_lastCreatedUnit, "chest")
            call SetUnitBaseDamageByIndex(bj_lastCreatedUnit, 0, R2I(0.5 * GetHeroStr(c, true)))
            call UnitAddGuard(t, bj_lastCreatedUnit, 0.8, 700, 1000, 1300)
            call GroupAddUnit(g, bj_lastCreatedUnit)
        endif
    endif
    if count == 150 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
    endif
    if count == 154 then 
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
    endif
    if count == 158 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 162 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 166 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 170 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 174 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 178 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 182 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 186 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 190 then
        set x = PolarX(GetUnitX(c), - 200, a)
        set y = PolarY(GetUnitY(c), - 200, a)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 195 then
        call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4, 1.5, 255, PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)  
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 200 then 
        call ForGroup(g, function Trig_YamajiW_Func003)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 3))
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set g = null
endfunction

function Trig_YamajiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0BB' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitTypeId(c) == 'H0FV' then
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call TimerStart(z, 0.02, true, function Trig_YamajiW_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_YamajiW_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_YamajiW takes nothing returns nothing
    set gg_trg_YamajiW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YamajiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_YamajiW, function Trig_YamajiW_Actions )
endfunction