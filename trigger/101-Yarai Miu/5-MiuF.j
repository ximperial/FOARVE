//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_MiuF_Func001 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real x
  local real y
  local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local real a2
  local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
  local integer i = 0
  local effect e
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  call PauseUnit(c, true)
  call SetUnitInvulnerable(c, true)
  call PauseUnit(t, true)
  call SetUnitInvulnerable(t, true)
  if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
    call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
  elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
    call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
  endif
  call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
  if count == 1 then
    call SoundStart("war3mapImported\\Miu_6.mp3")
    call VisionArea(GetOwningPlayer(c), 1200, 9, GetUnitX(t), GetUnitY(t))
    call SetUnitAnimationByIndex(c, 9)
    call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 10, 255, 255, 255, 255)
  endif
  if count == 10 or count == 15 or count == 20 or count == 25 or count == 30 or count == 35 or count == 40 or count == 45 or count == 50 or count == 55 or count == 60 or count == 65 or count == 70 or count == 75 or count == 80 or count == 85 or count == 90 or count == 95 or count == 100 then
    set i = LoadInteger(ht, GetHandleId(z), 2)
    set x = PolarX(GetUnitX(t), 800, i * 20)
    set y = PolarY(GetUnitY(t), 800, i * 20)
    set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
    call Effect("war3mapImported\\flames&smoke.mdx", x, y, 25, a2, 0, 0, 1, 10.2 - count * 0.02, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
    call SaveEffectHandle(ht, GetHandleId(z), 10 + i, bj_lastCreatedEffect)
    call SaveInteger(ht, GetHandleId(z), 2, i + 1)
  endif
  if count >= 290 and count <= 490 then
    loop
      exitwhen i > LoadInteger(ht, GetHandleId(z), 2) - 1
      set e = LoadEffectHandle(ht, GetHandleId(z), 10 + i)
      set a = GetSpecialEffectYaw(e)
      set x = PolarX(GetEffectX(e), 4, a)
      set y = PolarY(GetEffectY(e), 4, a)
      call SetEffectX(e, x)
      call SetEffectY(e, y)
      call SetSpecialEffectZ(e, 25 + GetAxisZ(x, y))
          
      set i = i + 1
    endloop
  endif
  if count == 490 then
    call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
  endif
  if count == 500 then 
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call PauseUnit(t, false)
    call SetUnitInvulnerable(c, false)
    call SetUnitInvulnerable(t, false)
    call DamageUnit(c, t, 11 * GetHeroInt(c, true))
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

function Trig_MiuF_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local unit t = GetSpellTargetUnit()
  if GetSpellAbilityId() == 'A0GP' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call SaveUnitHandle(ht, GetHandleId(z), 0, c)
    call SaveUnitHandle(ht, GetHandleId(z), 1, t)
    call SaveInteger(ht, GetHandleId(z), 0, 0)
    call SaveInteger(ht, GetHandleId(z), 1, 0)
    call SaveInteger(ht, GetHandleId(z), 2, 0)
    call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    call TimerStart(z, 0.02, true, function Trig_MiuF_Func001)
  endif
  set z = null
  set c = null
  set t = null
endfunction

//===========================================================================
function InitTrig_MiuF takes nothing returns nothing
  set gg_trg_MiuF = CreateTrigger(  )
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MiuF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction( gg_trg_MiuF, function Trig_MiuF_Actions )
endfunction