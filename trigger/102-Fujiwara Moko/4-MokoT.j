//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MokoT_Func001 takes nothing returns nothing
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
    call SoundStart("war3mapImported\\Moko_5.mp3")
    call SoundStart("war3mapImported\\Moko_2-1.mp3")
    call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
    call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    call SetUnitAnimation(c, "attack")
  endif
  if count >= 5 and count <= 30 then
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
  if count == 35 then
    call SoundStart("war3mapImported\\Moko_2.mp3")
    call SoundStart("war3mapImported\\Moko_2-1.mp3")
    call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
    call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
    call SetUnitFacingEx(c, a + 180, true)
    call SetUnitAnimation(c, "attack")
  endif
  if count >= 45 and count <= 70 then
    set x = PolarX(GetUnitX(t), 20, a)
    set y = PolarY(GetUnitY(t), 20, a)
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
  if count == 70 then
    call SoundStart("war3mapImported\\Moko_2-1.mp3")
  endif
  if count >= 70 and count <= 90 then
    if dist > 140 then
      call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
      call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
    else
      call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
      call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
  endif
  if count == 90 then
    call SetUnitAnimationByIndex(c, 6)
    call UnitAddAbility(c, 'Amrf')
    call UnitRemoveAbility(c, 'Amrf')
    call UnitAddAbility(t, 'Amrf')
    call UnitRemoveAbility(t, 'Amrf')
  endif
  if count >= 90 and count <= 120 then
    set x = PolarX(GetUnitX(t), 20, a)
    set y = PolarY(GetUnitY(t), 20, a)
    if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
      call SetUnitX(t, x)
      call SetUnitY(t, y)
    endif
    call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    set iterator = iterator + 1
    call SaveInteger(ht, GetHandleId(z), 1, iterator)
    if iterator >= 5 then
      call SaveInteger(ht, GetHandleId(z), 1, 0)
      call Effect("war3mapimported\\fire-boom-new.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 20, a, - 45, 0, 1.2, 1, 255, 255, 255, 255)
      call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
  endif
  if count == 100 then
    call SoundStart("war3mapImported\\Moko_5-1.mp3")
  endif
  if count == 110 then
    call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    call SetUnitVertexColor(c, 255, 255, 255, 0)
  endif
  if count == 130 then
    call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\mokoT.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
    call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\mokoT.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
    call SetUnitVertexColor(c, 255, 255, 255, 255)
    call SetUnitX(c, GetUnitX(t))
    call SetUnitY(c, GetUnitY(t))
    call SetUnitFlyHeight(c, 700, 0)
  endif
  if count == 170 then
    call SetUnitAnimationByIndex(c, 5)
  endif
  if count == 190 then
    call SoundStart("war3mapImported\\Moko_5-2.mp3")
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
  if count == 200 then 
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, 15 * GetHeroInt(c, true))
    call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_MokoT_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0HY' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    call SaveInteger(ht, GetHandleId(z) , 1, 0)
    call TimerStart(z, 0.02, true, function Trig_MokoT_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MokoT takes nothing returns nothing
  set gg_trg_MokoT = CreateTrigger()
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MokoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction(gg_trg_MokoT, function Trig_MokoT_Actions)
endfunction