//TESH.scrollpos=0
//TESH.alwaysfold=0
scope TohkaF
    private struct Missile extends Missiles
    
    unit c
    boolean b
        
    method onHit takes unit hit returns boolean
        local real x = GetUnitX(hit)
        local real y = GetUnitY(hit)
        if FilterGeneral(c, hit) then
            call Effect("war3mapimported\\toonboomblue.mdx", x , y , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\tenshi swr explode.mdx", x , y , 25, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x , y , 400, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then 
                    call DamageUnit(c, gUnit, 0.6 * GetHeroInt(c, true))
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            set b = true
            return true
        endif

        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        if not b then
            call Effect("war3mapimported\\toonboomblue.mdx", .x , .y , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\tenshi swr explode.mdx", .x , .y , 25, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        set c = null
    endmethod
        
endstruct
function Trig_TohkaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_6.mp3")
        call SetUnitTimeScale(c, 2)
        call VisionArea(GetOwningPlayer(c), 1200, 5, GetUnitX(c), GetUnitY(c))
    endif
    if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then
        call SoundStart("war3mapImported\\Tohka_2-1.mp3")
    endif
    if count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SetUnitAnimation(c, "attack")
            set x = PolarX(GetUnitX(c), 1300, a + GetRandomReal(- 40, 40))
            set y = PolarY(GetUnitY(c), 1300, a + GetRandomReal(- 40, 40))
            set move = Missile.create(GetUnitX(c), GetUnitY(c), GetRandomReal(50, 150), x, y, GetRandomReal(50, 150))
            set move.c = c
            set move.duration = 0.6
            set move.model = "war3mapImported\\valkkame4.mdx"
            set move.scale = 1.5
            set move.curve = GetRandomReal(- 10, 10)
            set move.collision = 300
            set move.b = false
            call move.launch()
        endif
    endif
    if count == 155 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction
endscope

function Trig_TohkaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A083' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TohkaF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_TohkaF takes nothing returns nothing
    set gg_trg_TohkaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohkaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_TohkaF, function Trig_TohkaF_Actions)
endfunction