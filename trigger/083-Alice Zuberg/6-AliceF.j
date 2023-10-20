//TESH.scrollpos=10
//TESH.alwaysfold=0
globals
    integer AliceFHash = StringHash("AliceF")
endglobals

function Trig_AliceF_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	if not IsUnitInvulnerable(c) then 
		set count = count + 1
		call SaveInteger(ht, GetHandleId(z), 0, count)
	endif
	if count >= 50 or not IsUnitAlive(c) or GetUnitAbilityLevel(c, 'B00U') == 0 then 
        if not HaveSavedBoolean(ht, AliceFHash, GetHandleId(c)) then
            call StopSound(LoadSoundHandle(ht, GetHandleId(z), 1), true, false)
        else
            call RemoveSavedBoolean(ht, AliceFHash, GetHandleId(c))
        endif
		call UnitRemoveAbility(c, 'A0IA')
		call UnitRemoveAbility(c, 'B00U')
		call FlushChildHashtable(ht, GetHandleId(z)) 
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
endfunction

function Trig_AliceF_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	if GetSpellAbilityId() == 'A0I9' then
		set z = CreateTimer()
        call SoundStart("war3mapImported\\Alice_6.mp3")
        call SaveSoundHandle(ht, GetHandleId(z), 1, dummySound)
		call UnitAddAbility(c, 'A0IA')
		call UnitMakeAbilityPermanent(c, true, 'A0IA')
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveBoolean(ht, AliceFHash, GetHandleId(c), true)
		call TimerStart(z, 0.1, true, function Trig_AliceF_Func001)
	endif
	set z = null
	set c = null
endfunction

//===========================================================================
function InitTrig_AliceF takes nothing returns nothing
	set gg_trg_AliceF = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_AliceF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_AliceF, function Trig_AliceF_Actions )
endfunction