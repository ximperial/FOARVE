//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_CloudsR_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
	local real x
	local real y
    local real randomA
	local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local integer i = 0
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z), 0, count)
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	call PauseUnit(t, true)
	call SetUnitInvulnerable(t, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Cloud_4.mp3")
		call SetUnitAnimationByIndex(c, 27)
        call SetUnitTimeScale(c, 1.5)
		call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
	endif
	if count == 10 or count == 25 or count == 40 or count == 55 or count == 70 or count == 85 then
        set randomA = randomAngle()
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        call SetUnitX(c, PolarX(x, 140, randomA))
        call SetUnitY(c, PolarY(y, 140, randomA))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimation(c, "attack")
        
		call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(c), -50, a)
        set y = PolarY(GetUnitY(c), -50, a)
		call Effect("war3mapImported\\daoguang-blue-hengsao.mdx", x, y, 50, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
		call Effect("war3mapImported\\blue-blink.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\blue-toushewu.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        
        call ShakeCamera(0.3, GetOwningPlayer(c), 5)
        call ShakeCamera(0.3, GetOwningPlayer(t), 10)
	endif
	if count >= 10 and count <= 120 then 
        set x = PolarX(GetUnitX(t), 15, a)
        set y = PolarY(GetUnitY(t), 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
	endif
    if count == 110 or count == 120 then
		call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
		call Effect("war3mapImported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
		call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
	endif
    if count == 100 then
        call SetUnitAnimationByIndex(c, 17)
    endif
	if count >= 100 and count <= 130 then 
		if dist > 140 then 
			call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
			call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
		else
			call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
			call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
		endif
	endif
    if count == 125 then
        call SetUnitAnimationByIndex(c, 18)
    endif
	if count == 130 then 
        call ShakeCamera(1, GetOwningPlayer(c), 10)
        call ShakeCamera(1, GetOwningPlayer(t), 15)
		call Effect("war3mapImported\\BluefireBolt.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
		call Effect("war3mapImported\\HelGate1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
		call Effect("war3mapImported\\by_wood_effect_yuanbanlin_sand2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        loop
            exitwhen i > 8
            set x = PolarX(GetUnitX(t), 350, i * 40)
            set y = PolarY(GetUnitY(t), 350, i * 40)
            call Effect("war3mapImported\\blue-blink.mdx", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            
            set i = i + 1
        endloop
	endif
	if count == 140 then 
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call PauseUnit(t, false)
		call SetUnitInvulnerable(c, false)
		call SetUnitInvulnerable(t, false)
		call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0IF')) * GetHeroStr(c, true))
		call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
		call IssueTargetOrderById(c, 851983, t)
		call IssueImmediateOrderById(t, 851972)
		call FlushChildHashtable(ht, GetHandleId(z))
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
	set t = null
endfunction

function Trig_CloudsR_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local unit t = GetSpellTargetUnit()
	if GetSpellAbilityId() == 'A0IF' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call PauseUnit(t, true)
		call SetUnitInvulnerable(t, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveUnitHandle(ht, GetHandleId(z), 1, t)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
		call TimerStart(z, 0.02, true, function Trig_CloudsR_Func001)
	endif
	set z = null
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_CloudsR takes nothing returns nothing
	set gg_trg_CloudsR = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_CloudsR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_CloudsR, function Trig_CloudsR_Actions )
endfunction