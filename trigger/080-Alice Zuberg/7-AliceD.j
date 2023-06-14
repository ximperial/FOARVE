//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AliceD_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
	local real x
	local real y
	local real x1
	local real y1
	local real a = GetUnitFacing(c)
	local integer i = 0
    local effect e
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z), 0, count)
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Alice_7.mp3")
		call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
		call SetUnitAnimationByIndex(c, 10)
		call Effect("war3mapimported\\Black.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
		call Effect("war3mapimported\\oxgz-alice.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.1, 3, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
	endif
    if count <= 50 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 1)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.07)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Alice_7-1.mp3")
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
		loop 
			set gUnit = GroupForEachUnit(gGroup)
			exitwhen gUnit == null
			if FilterGeneral(c, gUnit) then 
				call lockUnit(gUnit, 1, false)
			endif 
		endloop
		call GroupClear(gGroup)
    endif
    if count == 60 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 1)
        call SetSpecialEffectAnimation(e, "death")
        call SetSpecialEffectTimeScale(e, 0.9)
    endif
	if count == 100 then
        call SoundStart("war3mapImported\\Satomi_4-5.mp3")
        call ShakeCamera(1, GetOwningPlayer(c), 5)
		call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        call GroupRemoveUnit(gGroup, c)
		loop
			set gUnit = GroupForEachUnit(gGroup)
			exitwhen gUnit == null
            call ShakeCamera(1, GetOwningPlayer(gUnit), 10)
			if FilterGeneral(c, gUnit) then
				call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true))
			endif
		endloop
		call GroupClear(gGroup)
        call Effect("war3mapimported\\AliceFSFX1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
	endif
	if count == 105 then 
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
    set e = null
endfunction

function Trig_AliceD_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	if GetSpellAbilityId() == 'A0IB' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
		call TimerStart(z, 0.02, true, function Trig_AliceD_Func001)
	endif
	set z = null
	set c = null
endfunction

//===========================================================================
function InitTrig_AliceD takes nothing returns nothing
	set gg_trg_AliceD = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_AliceD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_AliceD, function Trig_AliceD_Actions )
endfunction