//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_AliceT_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
	local real a = LoadReal(ht, GetHandleId(z) , 0)
	local integer count = LoadInteger(ht, GetHandleId(z) , 0)
	local real x
	local real y
    local real ux
    local real uy
	local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
	local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local group g2
    local integer i = 0
    local real randomA
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z) , 0, count)
	call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Alice_5.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\AliceT.tga", 255, 255, 255, 0, 255, 255, 255, 255)
		call VisionArea(GetOwningPlayer(c), 1500, 3, GetUnitX(c), GetUnitY(c))
        call ShakeCamera(1.5, GetOwningPlayer(c), 15)
		call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 6, 255, 255, 255, PercentTo255(70))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
		call Effect("war3mapImported\\moonwrath-yellow.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapImported\\AliceBurstSFXbyvalk.mdx", x , y , 200, a, 0, 0, 2.5, 7, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call AnimEffect(bj_lastCreatedEffect, 1, 1)
        call TimeScaleEffect(bj_lastCreatedEffect, 1, 1)
        call AnimEffect(bj_lastCreatedEffect, 2, 6)
        set ux = GetUnitX(c)
        set uy = GetUnitY(c)
        loop
            exitwhen i > 7
            set x = PolarX(ux, 300, i * 45)
            set y = PolarY(uy, 300, i * 45)
            call Effect("war3mapImported\\SFXBreakGround.mdx", x , y , GetRandomReal(25, 50), randomAngle() , 0, 0, 0.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(2, 4))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            
            set i = i + 1
        endloop
	endif
    if count == 10 then
        call Effect("war3mapImported\\zxd2.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , -90, 0, 3.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\zxd2.mdx", GetUnitX(c) , GetUnitY(c) , 0, randomAngle() , -90, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 15 then
        call Effect("war3mapImported\\XZDL.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 1 or count == 20 or count == 30 or count == 50 then
        call Effect("war3mapImported\\AliceSpinDustYellow.mdx", GetUnitX(c) , GetUnitY(c) , 100, randomAngle() , 0, 0, GetRandomReal(1.2, 1.5), 1.5, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
    endif
    if count == 50 then
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapImported\\AliceKameSFX3.mdx", x , y , 200, a , 0, 0, 0.95, 5.4, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
    endif
	if count >= 60 and count <= 300 then
        set ux = PolarX(GetUnitX(c), 20, a)
        set uy = PolarY(GetUnitY(c), 20, a)
        set g2 = CreateGroup()
        set iterator = iterator + 1
		call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        loop
            exitwhen i > 10
            set x = PolarX(ux , 140 * i, a)
            set y = PolarY(uy , 140 * i, a)
            call GroupEnumUnitsInRange(g2, x , y , 300, null)
            loop
                set gUnit = GroupForEachUnit(g2)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then
                    if not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(c, gUnit, 15 * GetHeroAgi(c, true) / 230)
                        call GroupAddUnit(g, gUnit)
                    endif
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            if count == 60 or iterator == 20 then
                call Effect("war3mapImported\\valkexp2.mdx", x , y , 25, randomAngle() , 0, 0, GetRandomReal(0.85, 1.25), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(70, 90)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 0.9))
            endif
            
            set i = i + 1
        endloop
        call GroupClear(g)
        call DestroyGroup(g2)
        
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.7))
        endif
	endif
	if count == 305 then
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
    set g2 = null
endfunction

function Trig_AliceT_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
	if GetSpellAbilityId() == 'A0I8' then
		set z = CreateTimer()
		call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
		call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
		call SaveReal(ht, GetHandleId(z) , 0, a)
		call SaveInteger(ht, GetHandleId(z) , 0, 0)
		call SaveInteger(ht, GetHandleId(z) , 1, 0)
		call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
		call TimerStart(z, 0.02, true, function Trig_AliceT_Func001)
	endif
	set z = null
	set c = null
endfunction
    
//===========================================================================
function InitTrig_AliceT takes nothing returns nothing
	set gg_trg_AliceT = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_AliceT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction(gg_trg_AliceT, function Trig_AliceT_Actions)
endfunction