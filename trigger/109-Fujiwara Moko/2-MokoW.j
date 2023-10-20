//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MokoW_Func001 takes nothing returns nothing
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
  if count <= 25 then
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  endif
  if count == 1 then
    call SoundStart("war3mapImported\\Moko_2.mp3")
  endif
  if count == 10 then
    call SoundStart("war3mapImported\\Moko_2-1.mp3")
    call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
    call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
    call SetUnitFacingEx(c, a + 180, true)
    call SetUnitAnimationByIndex(c, 6)
    call SetUnitTimeScale(c, 1.3)
  endif
  if count == 20 then
    call Effect("war3mapimported\\LW11.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    call SaveReal(ht, GetHandleId(z), 0, a)
  endif
  if count == 25 then 
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0HV')) * GetHeroInt(c, true))
    call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
    call IssueTargetOrderById(c, 851983, t)
    call IssueImmediateOrderById(t, 851972)
  endif
  if count >= 25 and count <= 50 then
    set a = LoadReal(ht, GetHandleId(z), 0)
    set x = PolarX(GetUnitX(t), 25, a)
    set y = PolarY(GetUnitY(t), 25, a)
    if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
      call SetUnitX(t, x)
      call SetUnitY(t, y)
    endif
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 5 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapimported\\firebomb.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
      call Effect("war3mapimported\\fire-boom-new.mdx", GetUnitX(t), GetUnitY(t), 120, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
  endif
  if count == 50 then
    call FlushChildHashtable(ht, GetHandleId(z))
    call PauseTimer(z)
    call DestroyTimer(z)
  endif
  set z = null
  set c = null
  set t = null
endfunction

function Trig_MokoW_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0HV' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    call SaveInteger(ht, GetHandleId(z) , 1, 0)
    call TimerStart(z, 0.02, true, function Trig_MokoW_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MokoW takes nothing returns nothing
  set gg_trg_MokoW = CreateTrigger()
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MokoW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction(gg_trg_MokoW, function Trig_MokoW_Actions)
endfunction