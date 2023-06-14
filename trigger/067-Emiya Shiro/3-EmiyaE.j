//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_EmiyaE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    if count <= 400 then
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
    else
        if not IsUnitInvulnerable(c) then
            set count = count + 1
            call SaveInteger(ht, GetHandleId(z), 0, count)
        endif
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Emiya_3.mp3")
        call SaveSoundHandle(ht, GetHandleId(z), 3, dummySound)
    endif
    if count <= 400 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\lb_hdg.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 400 then
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        set bj_lastCreatedEffect = AddSpecialEffect("war3mapimported\\RhoAias.mdx", x, y)
        call SetSpecialEffectZ(bj_lastCreatedEffect, 50 + GetAxisZ(x, y))
        call SetSpecialEffectOrientation(bj_lastCreatedEffect, a, 0, 0)
        call SetSpecialEffectScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call SaveReal(ht, StringHash("EmiyaE"), GetHandleId(c), (8 + GetUnitAbilityLevel(c, 'A0D8')) * GetHeroAgi(c, true))
    endif
    if count >= 400 and count <= 650 then
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectOrientation(e, a, 0, 0) 
    endif
    if count == 650 or (count > 400 and LoadReal(ht, StringHash("EmiyaE"), GetHandleId(c)) <= 0) or not IsUnitAlive(c) then
        call RemoveSavedReal(ht, StringHash("EmiyaE"), GetHandleId(c))
        call StopSound(LoadSoundHandle(ht, GetHandleId(z), 3), true, false)
        call DestroyEffect(e)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_EmiyaE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0D8' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_EmiyaE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_EmiyaE takes nothing returns nothing
    set gg_trg_EmiyaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_EmiyaE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_EmiyaE, function Trig_EmiyaE_Actions )
endfunction