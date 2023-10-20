//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MystoF_Func001 takes nothing returns nothing
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
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z) , 0, count)
  if count <= 50 then
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
  endif
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Mysto_6.mp3")
    call SetUnitAnimationByIndex(c, 6)
    call UnitAddAbility(t, 'Amrf')
    call UnitRemoveAbility(t, 'Amrf')
    call SetUnitFacing(t, a + 180)
    call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
    call SaveReal(ht, GetHandleId(z), 0, a)
  endif
  if count == 10 then
    call Effect("war3mapimported\\OrbitalRay.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1.5, 178, 102, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    call Effect("war3mapimported\\Almagest.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 2, 178, 102, 255, 255)
    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
  endif
  if count == 50 then
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call SetUnitInvulnerable(c, false)
    call IssueImmediateOrderById(c, 851972)
  endif
  if count >= 20 and count <= 300 then
    if count <= 170 then
      call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 6, 0)
    endif
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 10 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapimported\\SuperShinyThingy33.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 50, randomAngle(), 0, 0, GetRandomReal(0.8, 1.35), 1, 255, 255, 255, PercentTo255(90))
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.1))
      if count <= 130 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 10, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1.5, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
      else
        call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(0.85, 1.2), 1.5, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 1))
      endif
    endif
  endif
  if count == 300 then
    set a = LoadReal(ht, GetHandleId(z), 0)
    set x = PolarX(GetUnitX(t), - 200, a)
    set y = PolarY(GetUnitY(t), - 200, a)
    call Effect("Units\\Demon\\felhound\\felhound.mdx", x, y, 900, a, 0, 0, 2, 2, 255, 255, 255, 255)
    call AnimEffect(bj_lastCreatedEffect, 3, 0.6)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
  endif
  if count == 360 then
    call Effect("war3mapimported\\bloodex.mdx", GetUnitX(t), GetUnitY(t), 920, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
  endif
  if count >= 370 and count <= 420 then
    call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 18, 0)
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 5 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) - 10, randomAngle(), - 180, 0, GetRandomReal(1, 1.35), 1.5, 255, 255, 255, PercentTo255(70))
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
    endif
  endif
  if count == 420 then
    call SoundStart("war3mapImported\\Mysto_6-1.mp3")
    call SetUnitFlyHeight(t, 0, 0)
    call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
  endif
  if count == 430 then 
    call PauseUnit(t, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, 11 * GetHeroInt(c, true))
    call IssueImmediateOrderById(t, 851972)
    call FlushChildHashtable(ht, GetHandleId(z))
    call PauseTimer(z)
    call DestroyTimer(z)
  endif
  set z = null
  set c = null
  set t = null
endfunction

function Trig_MystoF_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0DT' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    call SaveInteger(ht, GetHandleId(z) , 1, 0)
    call TimerStart(z, 0.02, true, function Trig_MystoF_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MystoF takes nothing returns nothing
  set gg_trg_MystoF = CreateTrigger()
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction(gg_trg_MystoF, function Trig_MystoF_Actions)
endfunction