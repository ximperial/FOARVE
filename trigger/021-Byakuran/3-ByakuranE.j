//TESH.scrollpos=26
//TESH.alwaysfold=0
function Trig_ByakuranE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 30 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Byakuran_3.mp3")
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 30 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call AddUnitAnimationProperties(c, "alternate", true)
        call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\bymutou_huozhu_siwang.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 30 and (GetUnitAbilityLevel(c, 'B00Y') == 0 or not IsUnitAlive(c)) then
        call AddUnitAnimationProperties(c, "alternate", false)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_ByakuranE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0AJ' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call TimerStart(z, 0.02, true, function Trig_ByakuranE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ByakuranE takes nothing returns nothing
    set gg_trg_ByakuranE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ByakuranE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_ByakuranE, function Trig_ByakuranE_Actions )
endfunction