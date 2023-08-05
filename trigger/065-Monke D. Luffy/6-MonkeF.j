//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , 0)) 
        call SoundStart("war3mapImported\\Monke_6-1.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 20 then
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, 100, a, - 90, 0, 0.75, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, - 180, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\EffecthPush.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(70))
    endif
    if count >= 20 and count <= 60 then
        set x = PolarX(GetUnitX(t) , 10, a)
        set y = PolarY(GetUnitY(t) , 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\Monke_6-2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 120, a))
        call SetUnitAnimationByIndex(c, 5)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
    endif
    if count == 60 or count == 100 or count == 150 or count == 200 or count == 250 then
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        if count == 60 then
            set x = PolarX(GetUnitX(t) , - 50, a)
            set y = PolarY(GetUnitY(t) , - 50, a)
            call Effect("war3mapimported\\ArrowSqwirl.mdx", x, y, 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
        endif
    endif
    if count == 60 or count == 64 or count == 68 or count == 72 or count == 76 then
        call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.4, 0.6) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 30)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
    endif
    if count >= 60 and count <= 100 then
        set x = PolarX(GetUnitX(t) , 20, a)
        set y = PolarY(GetUnitY(t) , 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetEffectX(e, PolarX(GetUnitX(t) , - 50, a))
        call SetEffectY(e, PolarY(GetUnitY(t) , - 50, a))
        call SetSpecialEffectZ(e, 150 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        if count <= 80 then
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 80 or count == 90 then
        call Effect("war3mapimported\\icytouch.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
    endif
    if count == 100 then
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SoundStart("war3mapImported\\Monke_6-3.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 120, a))
        call SetUnitAnimationByIndex(c, 11)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
    endif
    if count == 120 then
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", x, y, 150, a, - 45, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\qqqqqr.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\DioSlash.mdx", GetUnitX(t) , GetUnitY(t) , 100, a - 90, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(70))
    endif
    if count == 120 or count == 130 or count == 140 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 45, 0, GetRandomReal(0.75, 1.2) , 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 60))) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
    endif
    if count >= 120 and count <= 150 then
        set x = PolarX(GetUnitX(t) , 10, a)
        set y = PolarY(GetUnitY(t) , 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif 
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Monke_6-4.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 120, a))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitFlyHeight(c, 400, 0)
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 160 then
        call SoundStart("war3mapImported\\Monke_6-5.mp3")
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", x, y, 25, a + 180, - 225, 0, 2, 1, 255, 255, 255, PercentTo255(70)) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\qqqqqr.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\az_hitheavy.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 160 or count == 170 or count == 180 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 45, 0, GetRandomReal(0.75, 1.2) , 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 60))) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
    endif
    if count >= 160 and count <= 190 then
        set x = PolarX(GetUnitX(t) , 10, a)
        set y = PolarY(GetUnitY(t) , 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif  
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 10, 0)
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Monke_6-6.mp3")
    endif
    if count == 190 then
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\zhendi-sand.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 200 then
        call SetUnitX(c, PolarX(GetUnitX(t) , 500, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 500, a))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 12)
        set x = PolarX(GetUnitX(c) , - 20, a)
        set y = PolarY(GetUnitY(c) , - 20, a)
        set x = PolarX(x, 20, a + 90)
        set y = PolarY(y, 20, a + 90)
        call Effect("war3mapimported\\luckmirror_lufeihandqian.mdx", x, y, GetUnitFlyHeight(c)+ 50, a, - 45, 0, 0.3, 1, 255, 255, 255, 255) 
        set x = PolarX(GetUnitX(c) , - 20, a)
        set y = PolarY(GetUnitY(c) , - 20, a)
        set x = PolarX(x, 20, a - 90)
        set y = PolarY(y, 20, a - 90)
        call Effect("war3mapimported\\luckmirror_lufeihandqian.mdx", x, y, GetUnitFlyHeight(c)+ 50, a, - 45, 0, 0.3, 1, 255, 255, 255, 255) 
    endif
    if count == 200 or count == 210 or count == 220 or count == 230 or count == 240 or count == 250 or count == 260 or count == 270 or count == 280 or count == 290 then
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
    endif
    if count == 210 then
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)  
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapimported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 230 then
        call SoundStart("war3mapImported\\Monke_6-7.mp3") 
        call SetUnitX(c, PolarX(GetUnitX(t) , 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 600, a))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitFlyHeight(c, 600, 0)
    endif
    if count == 230 or count == 240 or count == 250 or count == 260 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 45, 0, GetRandomReal(0.75, 1.2) , 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 60))) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
    endif
    if count >= 230 and count <= 300 then
        if count <= 270 then
            call SetUnitX(c, PolarX(GetUnitX(c) , 12, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , 12, a)) 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c)- 15, 0)
        else
            set x = PolarX(GetUnitX(t) , 20, a)
            set y = PolarY(GetUnitY(t) , 20, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif  
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a)) 
        endif
    endif
    if count == 270 or count == 280 or count == 290 or count == 300 then
        call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\qqqqqr.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)  
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, - 90, 0, GetRandomReal(0.75, 1) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70))) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.5))
    endif
    if count == 270 or count == 300 then
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)  
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)  
        call Effect("war3mapimported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 1.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)  
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 310 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z) , 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MonkeF_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local group g2 = LoadGroupHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Monke_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 6, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitTimeScale(c, 0.15)
    endif
    if count == 100 then
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, 0, 0, 0.3, 4, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 100 and count <= 250 then
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c)) 
        call SetSpecialEffectScale(e, 0.3 +(count - 100) * 0.02)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300 +(count - 130) * 10, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call stunUnit(gUnit, 1)
                call DamageUnit(c, gUnit, 11 * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit) 
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count <= 200 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 2500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g2) then 
                call GroupAddUnit(g2, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 200 then
        call ForGroup(g2, function ResetMoveSpeed)
        call DestroyGroup(g2)
    endif
    if count <= 250 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.4, 0.6) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 30)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.3) , 1, 0, 0, 0, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
        endif
    endif
    if count == 250 then 
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set g2 = null
    set e = null
endfunction

function Trig_MonkeF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08X' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        if t != c then
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call TimerStart(z, 0.02, true, function Trig_MonkeF_Func001)
        else
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z) , 2, CreateGroup())
            call TimerStart(z, 0.02, true, function Trig_MonkeF_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MonkeF takes nothing returns nothing
    set gg_trg_MonkeF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MonkeF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MonkeF, function Trig_MonkeF_Actions)
endfunction