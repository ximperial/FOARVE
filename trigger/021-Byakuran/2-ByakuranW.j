//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ByakuranW_Func001 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real x
  local real y
  local effect e
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Byakuran_2.mp3")
    call SetUnitAnimationByIndex(c, 1)
    call Effect("war3mapImported\\SuperShinyThingy.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\WhiteXMissile.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    call SaveReal(ht, GetHandleId(z), 0, dist)
  endif
  if count <= 25 then
    set e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set dist = LoadReal(ht, GetHandleId(z), 0)
    if dist > 400 then
      set x = PolarX(GetEffectX(e), dist / 25, a)
      set y = PolarY(GetEffectY(e), dist / 25, a)
      call SetEffectXY(e, x, y, 0)
      call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
    else
      set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
      if dist > 140 then
        set x = PolarX(GetEffectX(e), dist / 15, a)
        set y = PolarY(GetEffectY(e), dist / 15, a)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
      else
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
          call SetUnitX(t, x)
          call SetUnitY(t, y)
        endif
        call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
      endif
    endif
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 3 then 
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
      call Effect("war3mapImported\\WhiteXMissile.mdl", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
      call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
  endif
  if count == 25 then
    call Effect("war3mapImported\\FiragaWhite.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\SuperShinyThingy.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    call SetSpecialEffectAnimationByIndex(e, 0)
  endif
  if count == 30 then
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0AI')) * GetHeroStr(c, true))
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
  set e = null
endfunction

function Trig_ByakuranW_Func002 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real x
  local real y
  local real dmg = 0.2 * GetUnitAbilityLevel(c, 'A0AJ')
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Byakuran_2-1.mp3")
    call SetUnitAnimationByIndex(c, 5)
    call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
  endif
  if count == 5 or count == 10 or count == 15 or count == 20 or count == 25 then
    call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.55), 1.5, 255, 255, 255, 255)
    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
  endif
  if count == 25 then
    call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    call Effect("war3mapImported\\blackblink.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitX(c, PolarX(GetUnitX(t), 500, a))
    call SetUnitY(c, PolarY(GetUnitY(t), 500, a))
    set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    call SetUnitFacingEx(c, a, true)
    call SetUnitAnimationByIndex(c, 12)
  endif
  if count == 25 or count == 35 or count == 45 then
    call Effect("war3mapImported\\punchshot.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
  endif
  if count >= 25 and count <= 55 then
    set dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    if dist > 140 then
      call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
      call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
    else
      call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
      call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
  endif
  if count == 50 then
    call SetUnitAnimationByIndex(c, 11)
  endif
  if count == 60 then
    call SoundStart("war3mapImported\\Byakuran_2-2.mp3")
    call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\fireworksblack.mdl", GetUnitX(t), GetUnitY(t), 60, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
    call Effect("war3mapImported\\bymutou_huozhu_siwang.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
  endif
  if count == 65 then
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, (dmg + 1 + GetUnitAbilityLevel(c, 'A0AI')) * GetHeroStr(c, true))
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

function Trig_ByakuranW_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0AI' then
    set z = CreateTimer()
    if GetUnitAbilityLevel(c, 'B00Y') == 0 then
      call PauseUnit(t, true)
      call SetUnitInvulnerable(t, true)
      call PauseUnit(c, true)
      call SetUnitInvulnerable(c, true)
      call SaveUnitHandle(ht, GetHandleId(z), 0, c)
      call SaveUnitHandle(ht, GetHandleId(z), 1, t)
      call SaveInteger(ht, GetHandleId(z), 0, 0)
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call TimerStart(z, 0.02, true, function Trig_ByakuranW_Func001)
    else
      call PauseUnit(t, true)
      call SetUnitInvulnerable(t, true)
      call PauseUnit(c, true)
      call SetUnitInvulnerable(c, true)
      call SaveUnitHandle(ht, GetHandleId(z), 0, c)
      call SaveUnitHandle(ht, GetHandleId(z), 1, t)
      call SaveInteger(ht, GetHandleId(z), 0, 0)
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call TimerStart(z, 0.02, true, function Trig_ByakuranW_Func002)
    endif
  endif
  set z = null
  set c = null
  set t = null
endfunction
  
//===========================================================================
function InitTrig_ByakuranW takes nothing returns nothing
  set gg_trg_ByakuranW = CreateTrigger(  )
  call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction( gg_trg_ByakuranW, function Trig_ByakuranW_Actions )
endfunction