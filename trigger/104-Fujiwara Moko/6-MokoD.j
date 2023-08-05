//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MokoD_Func001 takes nothing returns nothing
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
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  if count == 1 then
    call SoundStart("war3mapImported\\Moko_7.mp3")
    call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
    call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
    call SetUnitAnimationByIndex(c, 2)
    call SetUnitFacingEx(c, a, true)
    call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 2.2, 255, PercentTo255(80), PercentTo255(80), 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.3)
    call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2.2, 255, 255, 255, PercentTo255(40))
    call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
  endif
  if count <= 100 then
    set x = PolarX(GetUnitX(c), 10, GetUnitFacing(c))
    set y = PolarY(GetUnitY(c), 10, GetUnitFacing(c))
    if dist <= 400 then
      if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
        call SetUnitX(c, x)
        call SetUnitY(c, y)
      endif
    else
      call SetUnitX(c, x)
      call SetUnitY(c, y)
    endif
  endif
  if count == 110 then
    call SoundStart("war3mapImported\\Moko_1-1.mp3")
    call Effect("war3mapimported\\BY_Wood_Decade_RiderKick_Explode.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
    loop
      exitwhen i > 7
      call Effect("war3mapimported\\fireleaf.mdx", GetUnitX(t), GetUnitY(t), 25 + i * 140, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
      set i = i + 1
    endloop
  endif
  if count == 120 then 
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, 8 * GetHeroInt(c, true))
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
endfunction

function Trig_MokoD_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0I0' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    call SaveInteger(ht, GetHandleId(z) , 1, 0)
    call TimerStart(z, 0.02, true, function Trig_MokoD_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MokoD takes nothing returns nothing
  set gg_trg_MokoD = CreateTrigger()
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MokoD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction(gg_trg_MokoD, function Trig_MokoD_Actions)
endfunction