//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MystoT_Func001 takes nothing returns nothing
  local timer z = GetExpiredTimer()
  local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
  local integer count = LoadInteger(ht, GetHandleId(z), 0)
  local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
  local real x = LoadReal(ht, GetHandleId(z), 0)
  local real y = LoadReal(ht, GetHandleId(z), 1)
  local real x1
  local real y1
  local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
  local integer i = 0
  local effect e
  local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
  set count = count + 1
  call SaveInteger(ht, GetHandleId(z), 0, count)
  if count <= 200 then
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
  endif
  if count == 1 then
    call SoundStart("war3mapImported\\Mysto_5.mp3")
    call VisionArea(GetOwningPlayer(c), 1200, 5, GetUnitX(c), GetUnitY(c))
    call SetUnitAnimationByIndex(c, 8)
    call Effect("war3mapImported\\Black.mdl", x, y, 25, a, 0, 0, 2, 5, 255, 255, 255, PercentTo255(70))
    call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    loop
      exitwhen i > 11
      set x1 = PolarX(x, 200, i * 30)
      set y1 = PolarY(y, 200, i * 30)
      call Effect("war3mapImported\\mindfog_2.mdl", x1, y1, 800, randomAngle(), 0, 0, 1.4, 5.5, 255, 255, 255, 255)
      set x1 = PolarX(x, 500, i * 30)
      set y1 = PolarY(y, 500, i * 30)
      call Effect("war3mapImported\\mindfog_2.mdl", x1, y1, 800, randomAngle(), 0, 0, 1.4, 5.5, 255, 255, 255, 255)
      set x1 = PolarX(x, 800, i * 30)
      set y1 = PolarY(y, 800, i * 30)
      call Effect("war3mapImported\\mindfog_2.mdl", x1, y1, 800, randomAngle(), 0, 0, 1.4, 5.5, 255, 255, 255, 255)
      set i = i + 1
    endloop
    call GroupEnumUnitsInRange(gGroup, x, y, 1200, null)
    loop 
      set gUnit = GroupForEachUnit(gGroup)
      exitwhen gUnit == null
      if FilterGeneral(c, gUnit) and IsUnitInRangeXY(gUnit, x, y, 700) then 
        call lockUnit(gUnit, 3, true)
      endif 
    endloop
    call GroupClear(gGroup)
  endif
  if count == 170 then
    call Effect("war3mapImported\\hehehehehe33.mdl", x, y, 25, a, 0, 0, 1, 3, 255, 255, 255, PercentTo255(90))
    call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
  endif
  if count >= 170 and count <= 230 then
    set e = LoadEffectHandle(ht, GetHandleId(z), 2)
    call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.05)
    call GroupEnumUnitsInRange(gGroup, x, y, 300 + (count - 170) * 10, null)
    loop 
      set gUnit = GroupForEachUnit(gGroup)
      exitwhen gUnit == null
      if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then 
        call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true))
        call GroupAddUnit(g, gUnit)
      endif 
    endloop
    call GroupClear(gGroup)
  endif
  if count == 200 then
    call SetUnitTimeScale(c, 1)
    call PauseUnit(c, false)
    call SetUnitInvulnerable(c, false)
    call IssueImmediateOrderById(c, 851972)
  endif
  if count == 250 then
    set e = LoadEffectHandle(ht, GetHandleId(z), 2)
    call SetSpecialEffectAnimation(e, "death")
    call DestroyGroup(g)
    call FlushChildHashtable(ht, GetHandleId(z))
    call PauseTimer(z)
    call DestroyTimer(z)
  endif
  set z = null
  set c = null
  set g = null
  set e = null
endfunction

function Trig_MystoT_Actions takes nothing returns nothing
  local timer z
  local unit c = GetTriggerUnit()
  local real x = GetSpellTargetX()
  local real y = GetSpellTargetY()
  local real x1 = GetUnitX(c)
  local real y1 = GetUnitY(c)
  if GetSpellAbilityId() == 'A0DS' then 
    set z = CreateTimer()
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call SaveUnitHandle(ht, GetHandleId(z), 0, c)
    call SaveInteger(ht, GetHandleId(z), 0, 0)
    call SaveInteger(ht, GetHandleId(z), 1, 0)
    call SaveReal(ht, GetHandleId(z), 0, x)
    call SaveReal(ht, GetHandleId(z), 1, y)
    call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
    call TimerStart(z, 0.02, true, function Trig_MystoT_Func001)
  endif
  set z = null
  set c = null
endfunction

//===========================================================================
function InitTrig_MystoT takes nothing returns nothing
  set gg_trg_MystoT = CreateTrigger(  )
  call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
  call TriggerAddAction( gg_trg_MystoT, function Trig_MystoT_Actions )
endfunction