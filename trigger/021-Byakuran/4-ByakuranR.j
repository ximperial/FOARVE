//TESH.scrollpos=96
//TESH.alwaysfold=0
function Trig_ByakuranR_Func001 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real x
  local real y
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Byakuran_4.mp3")
    call SetUnitAnimationByIndex(c, 0)
    call Effect("war3mapImported\\harmonizeeffect.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 2.5, 255, 255, 255, 255)
    call Effect("war3mapImported\\shinratensei.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(60))
    call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
  endif
  if count >= 40 and count <= 70 then
    if dist > 140 then
      call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
      call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
    else
      call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
      call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
  endif
  if count == 60 then
    call SetUnitAnimationByIndex(c, 1)
  endif
  if count == 70 then
    call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetUnitX(t), GetUnitY(t), 120, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
  endif
  if count == 80 then
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0AK')) * GetHeroStr(c, true))
    call knockbackUnit(t, 600, a, 0.6)
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

function Trig_ByakuranR_Func002 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real x
  local real y
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Byakuran_4-1.mp3")
    call SetUnitAnimationByIndex(c, 6)
    call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    call Effect("war3mapImported\\DarkBreathDamage.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 3, 255, 255, 255, 255)
    call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(50))
    call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
  endif
  if count >= 25 and count <= 105 then
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 10 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call SetUnitX(c, PolarX(GetUnitX(t), 140, randomAngle()))
      call SetUnitY(c, PolarY(GetUnitY(t), 140, randomAngle()))
      set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
      call SetUnitFacingEx(c, a, true)
      call SetUnitAnimationByIndex(c, 11)
      call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
      call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
      call Effect("war3mapImported\\ShadowSlash.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
  endif
  if count == 105 then
    call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 2, 2, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
  endif
  if count == 120 then
    call SetUnitAnimationByIndex(c, 11)
    call Effect("war3mapImported\\fireworksblack.mdl", GetUnitX(t), GetUnitY(t), 60, a, 0, 0, 4, 2, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 120, a, - 90, 0, 2, 1, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
  endif
  if count == 130 then
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, ((0.2 * GetUnitAbilityLevel(c, 'A0AJ')) + (6 + 2 * GetUnitAbilityLevel(c, 'A0AK'))) * GetHeroStr(c, true))
    call knockbackUnit(t, 600, a, 0.6)
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

function Trig_ByakuranR_Func003 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 0)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  if not IsUnitInvulnerable(t) then 
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
  endif
  if count >= 50 or not IsUnitAlive(t) or GetUnitAbilityLevel(t, 'B00Q') == 0 then 
    call UnitRemoveAbility(t, 'A0I1')
    call UnitRemoveAbility(t, 'B00Q')
    call FlushChildHashtable(ht, GetHandleId(z)) 
    call PauseTimer(z)
    call DestroyTimer(z)
  endif
  set z = null
  set t = null
endfunction

function Trig_ByakuranR_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0AK' then
    if t != c then
      set z = CreateTimer()
      call PauseUnit(t, true)
      call SetUnitInvulnerable(t, true)
      call PauseUnit(c, true)
      call SetUnitInvulnerable(c, true)
      call SaveUnitHandle(ht, GetHandleId(z), 0, c)
      call SaveUnitHandle(ht, GetHandleId(z), 1, t)
      call SaveInteger(ht, GetHandleId(z), 0, 0)
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      if GetUnitAbilityLevel(c, 'B00Y') > 0 then
        call TimerStart(z, 0.02, true, function Trig_ByakuranR_Func002)
      else
        call TimerStart(z, 0.02, true, function Trig_ByakuranR_Func001)
      endif
  else
      set z = CreateTimer()
      call SoundStart("war3mapImported\\Byakuran_4-2.mp3")
      call UnitAddAbility(t, 'A0I1')
      call UnitMakeAbilityPermanent(t, true, 'A0I1')
      call SaveUnitHandle(ht, GetHandleId(z), 0, t)
      call SaveInteger(ht, GetHandleId(z), 0, 0)
      call TimerStart(z, 0.1, true, function Trig_ByakuranR_Func003)
  endif
  endif
  set z = null
  set c = null
  set t = null
endfunction
  
//===========================================================================
function InitTrig_ByakuranR takes nothing returns nothing
  set gg_trg_ByakuranR = CreateTrigger(  )
  call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddCondition( gg_trg_ByakuranR, Condition(function Trig_ByakuranR_Actions ))
endfunction