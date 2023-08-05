//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MokoF_Func001 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
  local integer count = LoadInteger(ht, GetHandleId(z) , 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
  local real x
  local real y
  local real z2
  local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
  local real a2
  local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
  local real dist2
  local integer i = 0
  local effect e
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z) , 0, count)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Moko_6.mp3")
    call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
    call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    call SetUnitAnimationByIndex(c, 2)
    call SaveReal(ht, GetHandleId(z), 0, 120)
    call SaveReal(ht, GetHandleId(z), 1, GetUnitFacing(c))
  endif
  if count == 10 or count == 50 or count == 130 then
    call SoundStart("war3mapImported\\Moko_2-1.mp3")
  endif
  if count <= 90 then
    set dist2 = LoadReal(ht, GetHandleId(z), 0)
    set a2 = LoadReal(ht, GetHandleId(z), 1)
    call SaveReal(ht, GetHandleId(z), 0, dist2 + 7)
    call SaveReal(ht, GetHandleId(z), 1, a2 + 7)
    set x = PolarX(GetUnitX(t), dist2, a2)
    set y = PolarY(GetUnitY(t), dist2, a2)
    call SetUnitX(c, x)
    call SetUnitY(c, y)
    call SetUnitFacingEx(c, a + 90, true)
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 5 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapimported\\fireleaf.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 0)
    endif
  endif
  if count == 100 then
    call UnitAddAbility(c, 'Amrf')
    call UnitRemoveAbility(c, 'Amrf')
    call SetUnitAnimationByIndex(c, 9)
    call SetUnitFacing(c, a)
    call SaveReal(ht, GetHandleId(z), 0, dist)
  endif
  if count >= 100 and count <= 130 then
    call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + dist / 30, 0)
  endif
  if count == 130 then
    call SoundStart("war3mapImported\\Moko_6-1.mp3")
    call SetUnitAnimationByIndex(c, 4)
    call SetUnitTimeScale(c, 1.4)
    call Effect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, - 45, 0, 5, 1.5, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
  endif
  if count >= 130 and count <= 150 then
    set dist2 = LoadReal(ht, GetHandleId(z), 0)
    set e = LoadEffectHandle(ht, GetHandleId(z), 3)
    call SetEffectX(e, PolarX(GetEffectX(e), dist2 / 20, a))
    call SetEffectY(e, PolarY(GetEffectY(e), dist2 / 20, a))
    set z2 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e), GetEffectY(e))
    call SetSpecialEffectZ(e, z2 - dist2 / 20)
  endif
  if count == 150 then
    set e = LoadEffectHandle(ht, GetHandleId(z), 3)
    call SetSpecialEffectAnimation(e, "death")
    call SetUnitAnimationByIndex(c, 8)
    call Effect("war3mapimported\\[a]flame burst2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
    call Effect("war3mapimported\\Dota_Effect_lina_longpozhan.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, - 45, 0, 2, 1.5, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
  endif
  if count >= 160 and count <= 175 then
    set dist2 = LoadReal(ht, GetHandleId(z), 0)
    call SetUnitX(c, PolarX(GetUnitX(c), dist2 / 15, a))
    call SetUnitY(c, PolarY(GetUnitY(c), dist2 / 15, a))
    call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - dist2 / 15, 0)
    set e = LoadEffectHandle(ht, GetHandleId(z), 4)
    call SetEffectX(e, GetUnitX(c))
    call SetEffectY(e, GetUnitY(c))
    call SetSpecialEffectZ(e, 10 + GetUnitFlyHeight(c) + GetAxisZ(GetUnitX(c), GetUnitY(c)))
  endif
  if count == 175 then
    set e = LoadEffectHandle(ht, GetHandleId(z), 4)
    call SoundStart("war3mapImported\\Moko_5-2.mp3")
    call SetSpecialEffectAnimation(e, "death")
    call SetSpecialEffectTimeScale(e, 0.8)
    call SetUnitFlyHeight(c, 0, 0)
    call SetUnitFlyHeight(t, 0, 0)
    loop
      exitwhen i > 7
      set x = PolarX(GetUnitX(t), 300, i * 45)
      set y = PolarY(GetUnitY(t), 300, i * 45)
      call Effect("war3mapimported\\firebbic.mdx", x, y, 25, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
      set x = PolarX(GetUnitX(t), 600, i * 45)
      set y = PolarY(GetUnitY(t), 600, i * 45)
      call Effect("war3mapimported\\firebbic.mdx", x, y, 25, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
      set i = i + 1
    endloop
  endif
  if count == 180 then 
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, 11 * GetHeroInt(c, true))
    call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
  set e = null
endfunction

function Trig_MokoF_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0HZ' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    call SaveInteger(ht, GetHandleId(z) , 1, 0)
    call TimerStart(z, 0.02, true, function Trig_MokoF_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MokoF takes nothing returns nothing
  set gg_trg_MokoF = CreateTrigger()
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MokoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction(gg_trg_MokoF, function Trig_MokoF_Actions)
endfunction