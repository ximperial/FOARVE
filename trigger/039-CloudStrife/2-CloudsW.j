//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_CloudsW_Func001 takes nothing returns nothing
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
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	call PauseUnit(t, true)
	call SetUnitInvulnerable(t, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Cloud_2.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), -600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), -600, a))
		call SetUnitAnimationByIndex(c, 17)
		call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
	endif
	if count == 5 or count == 15 then
		call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
		call Effect("war3mapImported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
		call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
	endif
	if count > 1 and count <= 25 then 
		if dist > 140 then 
			call SetUnitX(c, PolarX(GetUnitX(c), dist / 19, a))
			call SetUnitY(c, PolarY(GetUnitY(c), dist / 19, a))
		else
			call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
			call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
		endif
	endif
	if count == 20 then
        call SetUnitAnimationByIndex(c, 18)
		call Effect("war3mapImported\\daoguang.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
	endif
	if count == 25 then 
		call SoundStart("war3mapImported\\Akame_1-1.mp3")
        call ShakeCamera(1, GetOwningPlayer(c), 5)
        call ShakeCamera(1, GetOwningPlayer(t), 10)
		call Effect("war3mapImported\\Dead Spirit by Deckai2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
		call Effect("war3mapImported\\shunyihuoyan.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
		call Effect("war3mapImported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
		call Effect("war3mapImported\\[A]ZoroEf6.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]slashdigital.mdx", GetUnitX(t), GetUnitY(t), 50, a + 70, 0, 0, 2, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
	endif
	if count == 30 then 
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call PauseUnit(t, false)
		call SetUnitInvulnerable(c, false)
		call SetUnitInvulnerable(t, false)
		call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0ID')) * GetHeroStr(c, true))
		call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
		call IssueTargetOrderById(c, 851983, t)
		call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
		call FlushChildHashtable(ht, GetHandleId(z))
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
	set t = null
endfunction

function Trig_CloudsW_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local unit t = GetSpellTargetUnit()
	if GetSpellAbilityId() == 'A0ID' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call PauseUnit(t, true)
		call SetUnitInvulnerable(t, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveUnitHandle(ht, GetHandleId(z), 1, t)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
		call TimerStart(z, 0.02, true, function Trig_CloudsW_Func001)
	endif
	set z = null
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_CloudsW takes nothing returns nothing
	set gg_trg_CloudsW = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_CloudsW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_CloudsW, function Trig_CloudsW_Actions )
endfunction