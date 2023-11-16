library Utilities uses lowefflib
    globals
        hashtable ht = InitHashtable()
        boolean array IsPlaying
        real array camZ
        integer array scorekill
        integer array scoredeath
        integer array scoreassist
        string array playerName
        unit gUnit = null
        group gGroup = CreateGroup()
        force team1 = CreateForce()
        force team2 = CreateForce()
        integer playerCount = 0
        string array COLOR
    endglobals

    function B2S takes boolean flag returns string
        if flag then
            return "yes"
        endif

        return "no"
    endfunction
    
    function B2I takes boolean flag returns integer
        if flag then
            return 1
        endif

        return 0
    endfunction

    function UserPlayer takes player p returns boolean
        return IsPlaying[GetPlayerId(p)]
    endfunction

    function DataOnStart takes nothing returns nothing
        local integer i

        call SetMoveSpeedMinAllowed(0)
        call SetMoveSpeedMaxAllowed(550)
        call ForceAddPlayer(team1, Player(0))
        call ForceAddPlayer(team1, Player(1))
        call ForceAddPlayer(team1, Player(2))
        call ForceAddPlayer(team1, Player(3))
        call ForceAddPlayer(team1, Player(4))
        call ForceAddPlayer(team1, Player(5))
        call ForceAddPlayer(team2, Player(6))
        call ForceAddPlayer(team2, Player(7))
        call ForceAddPlayer(team2, Player(8))
        call ForceAddPlayer(team2, Player(9))
        call ForceAddPlayer(team2, Player(10))
        call ForceAddPlayer(team2, Player(11))
        set i = 0
        loop
            exitwhen i > 11
            set camZ[i] = 1650
            set scorekill[i] = 0
            set scoredeath[i] = 0
            set scoreassist[i] = 0
            if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set playerCount = playerCount + 1 
                set IsPlaying[i] = true
                set playerName[i] = GetPlayerName(Player(i))
                call SetPlayerStateBJ(Player(i), PLAYER_STATE_RESOURCE_GOLD, 600)
            endif
            set i = i + 1
        endloop
        set COLOR[0] = "|c00ff0303"
        set COLOR[1] = "|c000042ff"
        set COLOR[2] = "|c001ce6b9"
        set COLOR[3] = "|c00540081"
        set COLOR[4] = "|c00fffc01"
        set COLOR[5] = "|c00ff8000"
        set COLOR[6] = "|c0020c000"
        set COLOR[7] = "|c00e55bb0"
        set COLOR[8] = "|c00959697"
        set COLOR[9] = "|c007ebff1"
        set COLOR[10] = "|c00106246"
        set COLOR[11] = "|c004e2a04"
        if playerCount == 1 then
            call EnableTrigger(resetmode)
        endif
        call GroupEnumUnitsInRect(gGroup, WorldBounds.world, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitTower(gUnit) then
                call SetUnitInvulnerable(gUnit, true)
            endif
        endloop
        call GroupClear(gGroup)
        call SetUnitInvulnerable( gg_unit_o005_0031, false )
        call SetUnitInvulnerable( gg_unit_o005_0033, false )
        call SetUnitInvulnerable( gg_unit_o005_0035, false )
        call SetUnitInvulnerable( gg_unit_o005_0042, false )
        call SetUnitInvulnerable( gg_unit_o005_0040, false )
        call SetUnitInvulnerable( gg_unit_o005_0037, false )
    endfunction

    function PolledWaitEx takes real duration returns nothing
        local timer t 
        local real timeRemaining

        if duration > 0 then
            set t = CreateTimer()
            call TimerStart(t, duration, false, null)
            loop
                set timeRemaining = TimerGetRemaining(t)
                exitwhen timeRemaining <= 0
                if timeRemaining > 2 then
                    call TriggerSleepAction(0.1 * timeRemaining)
                else
                    call TriggerSleepAction(0.1)
                endif
            endloop
            call DestroyTimer(t)
        endif

        set t = null
    endfunction

    function GetDisabledIcon takes string s returns string
        if StringContains(s, "buttons\\BTN", false) then
            return StringReplace(s, "\\BTN", "Disabled\\DISBTN", false)
        endif 
                                                                                                                                                                                                                                                                                                                                                      
        return ""
    endfunction

    function CinematicFilterGenericEx takes player p, real duration, blendmode bmode, string tex, integer red0, integer green0, integer blue0, integer trans0, integer red1, integer green1, integer blue1, integer trans1 returns nothing
        if GetLocalPlayer() == p then
            call SetCineFilterTexture(tex)
            call SetCineFilterBlendMode(bmode)
            call SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
            call SetCineFilterStartUV(0, 0, 1, 1)
            call SetCineFilterEndUV(0, 0, 1, 1)
            call SetCineFilterStartColor(red0, green0, blue0, trans0)
            call SetCineFilterEndColor(red1, green1, blue1, trans1)
            call SetCineFilterDuration(duration)
            call DisplayCineFilter(true)
            call EnableUserUI(true)
        endif
    endfunction

    function FilterGeneral takes unit source, unit target returns boolean
        return IsUnitEnemy(target, GetOwningPlayer(source)) and IsUnitAlive(target) and not IsUnitTower(target) and not IsUnitInvulnerable(target)
    endfunction

    globals
        integer array ShakeCount
    endglobals
                                                                                                                                                                                                                                                                                                                                                                                      
    private function ShakeStop takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local player p = LoadPlayerHandle(ht, GetHandleId(z), 0)
        local integer pid = GetPlayerId(p)

        set ShakeCount[pid] = ShakeCount[pid] - 1
        if ShakeCount[pid] == 0 then
            if GetLocalPlayer() == p then
                call CameraSetSourceNoise(0, 0)
                call CameraSetTargetNoise(0, 0)
            endif
        endif
        call FlushChildHashtable(ht, GetHandleId(z))
        call DestroyTimer(z)

        set z = null
        set p = null
    endfunction
                                                                                                                                                                                                                                                                                                                                                                                          
    function ShakeCamera takes real duration, player p, real magnitude returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real richter = magnitude
        local integer pid = GetPlayerId(p)

        if richter > 5.0 then
            set richter = 5.0
        endif
        if richter < 2.0 then
            set richter = 2.0
        endif
        if GetLocalPlayer() == p then
            call CameraSetTargetNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter) , true)
            call CameraSetSourceNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter) , true)
        endif
        set ShakeCount[pid] = ShakeCount[pid] + 1
        call SavePlayerHandle(ht, zid, 0, p)
        call TimerStart(z, duration, false, function ShakeStop)

        set z = null
    endfunction

    globals
        sound DummySound = null
    endglobals
                                                                                                                                                                                                                                                                                                                                                                                          
    function SoundStart takes string path returns nothing
        set DummySound = CreateSound(path, false, false, false, 10, 10, "Default")
        call SetSoundVolume(DummySound , 127)
        call StartSound(DummySound)
    endfunction
                                                                                                                                                                                                                                                                                                                                                                                          
    function SoundStartPlayer takes string path, player p, boolean IsAlly returns nothing
        set DummySound = CreateSound(path, false, false, false, 10, 10, "Default")
        if IsAlly then
            if IsPlayerAlly(GetLocalPlayer(), p) then
                call SetSoundVolume(DummySound , 127)
            else
                call SetSoundVolume(DummySound , 0)
            endif
        else
            if GetLocalPlayer() == p then
                call SetSoundVolume(DummySound , 127)
            else
                call SetSoundVolume(DummySound , 0)
            endif
        endif
        call StartSound(DummySound)
    endfunction

    function Angle takes real x1, real y1, real x2, real y2 returns real
        return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
    endfunction
                                                                                                                                                                                                                                                                                                                                                                                  
    function Distance takes real x1, real y1, real x2, real y2 returns real
        return SquareRoot((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
    endfunction

    function randomAngle takes nothing returns real
        return GetRandomReal(1, 360)
    endfunction

    function PolarX takes real x, real dist, real angle returns real
        return x + dist * Cos(angle * bj_DEGTORAD) 
    endfunction
                                                                                                                                                                                                                                                                                                                                                                                  
    function PolarY takes real y, real dist, real angle returns real 
        return y + dist * Sin(angle * bj_DEGTORAD) 
    endfunction
    
    function Slope takes real x1, real y1, real z1, real x2, real y2, real z2 returns real
        local real d = SquareRoot((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
        local real r1 = (z2 - z1) / d
        return bj_RADTODEG * Atan(r1)
    endfunction 
    
    function IsUnitInConeEx takes unit u, real x, real y, real face, real fov returns boolean
        return Acos(Cos((Atan2(GetUnitY(u) - y, GetUnitX(u) - x)) - face * bj_DEGTORAD)) < fov * bj_DEGTORAD / 2
    endfunction
                                      
    function IsUnitInCone takes unit u, real x, real y, real range, real face, real fov returns boolean
        if IsUnitInRangeXY(u, x, y, range) then
            set x = GetUnitX(u) - x
            set y = GetUnitY(u) - y
            set range = x * x + y * y
                                          
            if range > 0. then
                set face = face * bj_DEGTORAD - Atan2(y, x)
                set fov = fov * bj_DEGTORAD / 2 + Asin(32 / SquareRoot(range))
                                          
                return RAbsBJ(face) <= fov or RAbsBJ(face - 2.00 * bj_PI) <= fov
            endif
                                          
            return true
        endif
                                          
        return false
    endfunction

    globals
        rect WalkableRect = Rect(0, 0, 128, 128)
        item WalkableItem = null
        item array WalkableItemEx
        integer WalkableItemCount = 0
    endglobals
                                                                                                                                                                                                                                      
    private function PickItem takes nothing returns nothing
        local item it = GetEnumItem()

        if IsItemVisible(it) then
            call SetItemVisible(it, false)
            set WalkableItemEx[WalkableItemCount] = it
            set WalkableItemCount = WalkableItemCount + 1
        endif

        set it = null
    endfunction
                                                                                                                                                                                                                                      
    function IsTerrainWalkable takes real x, real y returns boolean
        local real x2
        local real y2
        local boolean isWalkable

        if WalkableItem == null then
            set WalkableItem = CreateItem('wtlg', 0, 0)
            call SetItemVisible(WalkableItem , false)
        endif
        call MoveRectTo(WalkableRect, x, y)
        call EnumItemsInRect(WalkableRect, null, function PickItem)
        call SetItemPosition(WalkableItem, x, y)
        set x2 = GetItemX(WalkableItem)
        set y2 = GetItemY(WalkableItem)
        call SetItemVisible(WalkableItem, false)
        loop
            exitwhen WalkableItemCount == 0
            set WalkableItemCount = WalkableItemCount - 1
            call SetItemVisible(WalkableItemEx[WalkableItemCount] , true)
            set WalkableItemEx[WalkableItemCount] = null
        endloop
        set isWalkable = (x2 - x) * (x2 - x) + (y2 - y) * (y2 - y) <= 100 and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)

        return isWalkable
    endfunction

    globals
        unit closestUnit = null
    endglobals
                                                                                                                                                                                                                                                                                                                                                                              
    function GetClosestUnitGroup takes real x, real y, group g returns unit
        local real dx
        local real dy
        local real md = 100000
        local integer i = 0
        local integer size = GroupGetCount(g)
        local unit u

        set closestUnit = null                                                                                                                                                                                                                                                                                                                                                                      
        loop
            exitwhen i == size
            set u = GroupGetUnitByIndex(g, i)
            if IsUnitAlive(u) then
                set dx = GetUnitX(u) - x
                set dy = GetUnitY(u) - y
                                                                                                                                                                                                                                                                                                                                                                                                  
                if(dx * dx + dy * dy) / 100000 < md then
                    set closestUnit = u
                    set md = (dx * dx + dy * dy) / 100000
                endif
            endif
            set i = i + 1
        endloop
                                                                                                                                                                                                                                                                                                                              
        set u = null
        return closestUnit
    endfunction

    globals
        private group dummygroup = CreateGroup()
    endglobals

    function DummyCall takes player p, real x, real y returns unit
        if GroupGetCount(dummygroup) > 0 then
            set bj_lastCreatedUnit = GroupGetUnitByIndex(dummygroup, 0)
            call GroupRemoveUnit(dummygroup, bj_lastCreatedUnit)
            call SetUnitOwner(bj_lastCreatedUnit, p, false)
            call SetUnitX(bj_lastCreatedUnit, x)
            call SetUnitY(bj_lastCreatedUnit, y)
        else
            set bj_lastCreatedUnit = CreateUnit(p, 'h09C', x, y, 0)
        endif

        return bj_lastCreatedUnit
    endfunction

    function DummyRecycle takes unit u returns nothing
        call GroupAddUnit(dummygroup, u)
        call SetUnitOwner(u, Player(15), false)
        call SetUnitX(u, WorldBounds.playMaxX)
        call SetUnitY(u, WorldBounds.playMaxY)
    endfunction

    function VisionArea takes player p, real visionRadius, real visionDuration, real x, real y returns nothing
        local unit u = DummyCall(p, x, y)
        local ability ab

        call UnitAddAbility(u, 'AOfs')
        set ab = GetUnitAbility(u, 'AOfs')
        call SetAbilityRealLevelField(ab, ABILITY_RLF_AREA_OF_EFFECT, 0, visionRadius)
        call SetAbilityRealLevelField(ab, ABILITY_RLF_DURATION_NORMAL, 0, visionDuration)
        call SetAbilityRealLevelField(ab, ABILITY_RLF_DURATION_HERO, 0, visionDuration)
        call CastAbilityGround(ab, x, y)
        call UnitRemoveAbility(u, 'AOfs')
        call DummyRecycle(u)

        set u = null
        set ab = null
    endfunction

    private function UnitGuardMove takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit owner = LoadUnitHandle(ht, zid, 0)
        local unit guard = LoadUnitHandle(ht, zid, 1)
        local real guardRange = LoadReal(ht, zid, 0)
        local real returnRange = LoadReal(ht, zid, 1)
        local real outRange = LoadReal(ht, zid, 2)
        local real time = LoadReal(ht, zid, 3)
        local real rTime = LoadReal(ht, zid, 4)
        local real dist = Distance(GetUnitX(guard) , GetUnitY(guard) , GetUnitX(owner) , GetUnitY(owner))
        local boolean isGuardIdle = GetUnitCurrentOrder(guard) == 0
        local real a
        local real x
        local real y

        if IsUnitAlive(owner) and IsUnitAlive(guard) then
            set time = time - 0.02
            call SaveReal(ht, zid, 3, time)
            if time <= 0 then
                call SaveReal(ht, zid, 3, rTime)
                if dist < guardRange then 
                    if isGuardIdle then 
                        set a = randomAngle()
                        set dist = GetRandomReal(0, guardRange)
                        set x = PolarX(GetUnitX(owner), dist, a)
                        set y = PolarY(GetUnitY(owner), dist, a)
                        call IssuePointOrderById(guard, 851990, x, y)
                    endif
                else
                    if dist < returnRange then
                        if isGuardIdle then 
                            call IssuePointOrderById(guard, 851990, GetUnitX(owner) , GetUnitY(owner))
                        endif
                    else
                        if dist > outRange then 
                            call SetUnitX(guard, GetUnitX(owner))
                            call SetUnitY(guard, GetUnitY(owner))
                        else
                            call IssuePointOrderById(guard, 851986, GetUnitX(owner) , GetUnitY(owner))
                        endif
                    endif
                endif
            endif
        else
            call RemoveSavedInteger(ht, StringHash("guard"), GetHandleId(guard))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
                
        set z = null
        set owner = null
        set guard = null
    endfunction
                                                                                                                                                                                                                                                                                                                      
    function UnitAddGuard takes unit owner, unit guard, real timeout, real guardRange, real returnRange, real outRange returns nothing
        local timer z
        local integer id

        if not HaveSavedInteger(ht, StringHash("guard"), GetHandleId(guard)) then
            set z = CreateTimer()
            call SaveInteger(ht, StringHash("guard"), GetHandleId(guard), 1)
            call SaveUnitHandle(ht, GetHandleId(z), 0, owner)
            call SaveUnitHandle(ht, GetHandleId(z), 1, guard)
            call SaveReal(ht, GetHandleId(z), 0, guardRange)
            call SaveReal(ht, GetHandleId(z), 1, returnRange)
            call SaveReal(ht, GetHandleId(z), 2, outRange)
            call SaveReal(ht, GetHandleId(z), 3, timeout)
            call SaveReal(ht, GetHandleId(z), 4, timeout)
            call TimerStart(z, 0.02, true, function UnitGuardMove)
        endif

        set z = null
    endfunction

    private function destroyEffect takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid, 0)

        call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
        call DestroyEffect(e)
        call FlushChildHashtable(ht, zid)
        call DestroyTimer(z)

        set z = null
        set e = null
    endfunction

    function Effect takes string str, real x, real y, real h, real yaw, real pitch, real roll, real scale, real duration, integer r, integer g, integer b, integer a returns nothing
        local timer z
        local string s = lowEffectCheck(str)

        set bj_lastCreatedEffect = AddSpecialEffect(s, x, y)
        call SetSpecialEffectHeight(bj_lastCreatedEffect, h)
        call SetSpecialEffectOrientation(bj_lastCreatedEffect, yaw, pitch, roll)
        call SetSpecialEffectScale(bj_lastCreatedEffect, scale)
        call SetSpecialEffectVertexColour(bj_lastCreatedEffect, r, g, b, a)
        if duration > 0 then
            set z = CreateTimer()
            call SaveEffectHandle(ht, GetHandleId(z), 0, bj_lastCreatedEffect)
            call TimerStart(z, duration, false, function destroyEffect)
        endif

        set z = null
    endfunction

    function GetEffectX takes effect e returns real
        return GetSpecialEffectX(e)
    endfunction

    function GetEffectY takes effect e returns real
        return GetSpecialEffectY(e)
    endfunction

    function GetEffectHeight takes effect e returns real
        return GetSpecialEffectHeight(e)
    endfunction

    function SetEffectXY takes effect e, real x, real y, integer pathing returns nothing
        if pathing == 1 then
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetSpecialEffectPosition(e, x, y)
            endif
            return
        endif
        if pathing == 2 then
            if IsTerrainWalkable(x, y) then
                call SetSpecialEffectPosition(e, x, y)
            endif
            return
        endif
        call SetSpecialEffectPosition(e, x, y)
    endfunction

    function AnimEffectEnd takes nothing returns nothing 
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid , 0)
        local integer anim = LoadInteger(ht, zid , 0)

        call SetSpecialEffectAnimationByIndex(e , anim)
        call FlushChildHashtable(ht, zid)
        call DestroyTimer(z)

        set z = null
        set e = null
    endfunction
                                                                                                                                                                                                                                                                                                                                                                  
    function AnimEffect takes effect e, integer anim, real duration returns nothing
        local timer z = CreateTimer()

        call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
        call SaveInteger(ht, GetHandleId(z) , 0, anim)
        call TimerStart(z, duration, false, function AnimEffectEnd)

        set z = null
    endfunction

    function AnimEffectExEnd takes nothing returns nothing 
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid , 0)
        local string anim = LoadStr(ht, zid , 1)

        call SetSpecialEffectAnimation(e, anim)
        call FlushChildHashtable(ht, zid)
        call DestroyTimer(z)

        set z = null
        set e = null
    endfunction
                                                                                                                                                                                                                                                                                                                                                                  
    function AnimEffectEx takes effect e, string anim, real duration returns nothing
        local timer z = CreateTimer()

        call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
        call SaveStr(ht, GetHandleId(z) , 1, anim)
        call TimerStart(z, duration, false, function AnimEffectExEnd)

        set z = null
    endfunction

    function TimeScaleEffectEnd takes nothing returns nothing 
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid , 0)
        local real timeScale = LoadReal(ht, zid , 0)

        call SetSpecialEffectTimeScale(e , timeScale)
        call FlushChildHashtable(ht, zid)
        call DestroyTimer(z)

        set z = null
        set e = null
    endfunction
                                                                                                                                                                                                                                                                                                                                                                  
    function TimeScaleEffect takes effect e, real timeScale, real duration returns nothing
        local timer z = CreateTimer()

        call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
        call SaveReal(ht, GetHandleId(z) , 0, timeScale)
        call TimerStart(z, duration, false, function TimeScaleEffectEnd)
        
        set z = null
    endfunction

    function ResetMoveSpeed takes nothing returns nothing
        call SetUnitMoveSpeed(GetEnumUnit() , GetUnitDefaultMoveSpeed(GetEnumUnit()))
    endfunction

    function SetUnitBoundXY takes unit u, rect rects, boolean isRandom returns nothing
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local integer i
        local real margin

        if isRandom then
            set x = GetRandomReal(GetRectMinX(rects), GetRectMaxX(rects))
            set y = GetRandomReal(GetRectMinY(rects), GetRectMaxY(rects))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) and IsTerrainWalkable(x, y) then
                call SetUnitX(u, x)
                call SetUnitY(u, y)
                return
            endif
        endif

        set i = 1
        set margin = 0
        loop
            exitwhen i > 128
            set margin = margin + 32
            if x < GetRectMinX(rects) + margin then
                set x = GetRectMinX(rects) + margin
            elseif x > GetRectMaxX(rects) - margin then
                set x = GetRectMaxX(rects) - margin
            endif
            if y < GetRectMinY(rects) + margin then
                set y = GetRectMinY(rects) + margin
            elseif y > GetRectMaxY(rects) - margin then
                set y = GetRectMaxY(rects) - margin
            endif
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) and IsTerrainWalkable(x, y) then
                call SetUnitX(u, x)
                call SetUnitY(u, y)
                return
            endif
            set i = i + 1
        endloop
    endfunction

    function SetUnitXY takes unit u, real x, real y, integer pathing returns nothing
        if pathing == 1 then
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(u, x)
                call SetUnitY(u, y)
            endif
            return
        endif
        if pathing == 2 then
            if IsTerrainWalkable(x, y) then
                call SetUnitX(u, x)
                call SetUnitY(u, y)
            endif
            return
        endif
        call SetUnitX(u, x)
        call SetUnitY(u, y)
    endfunction
    
    function GetHeroPrimaryStat takes unit c, boolean bonus returns integer
        if GetUnitPrimaryStat(c) == HERO_ATTRIBUTE_STR then
            return GetHeroStr(c, bonus)
        elseif GetUnitPrimaryStat(c) == HERO_ATTRIBUTE_INT then
            return GetHeroInt(c, bonus)
        elseif GetUnitPrimaryStat(c) == HERO_ATTRIBUTE_AGI then
            return GetHeroAgi(c, bonus)
        endif
        return 0
    endfunction

    function GetUnitTotalDamage takes unit u returns integer
        return GetUnitBaseDamageByIndex(u, 0) + GetUnitBonusDamageByIndex(u, 0)
    endfunction

    globals
        real array hpreg
        real array mpreg
        real array hpreg2
        real array mpreg2
    endglobals

    function UnitAddStat takes unit u, integer str, integer int, integer agi returns nothing
        local integer userid = GetUnitUserData(u)
        local real percent

        if str != 0 then
            set hpreg[userid] = hpreg[userid] + str * 0.05
            call SetHeroStr(u, GetHeroStr(u, true) + str, true)
            if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_STR then
                set percent = GetUnitLifePercent(u)
                call SetUnitMaxLife(u, GetUnitMaxLife(u) - str * 5)
                call SetUnitLifePercentBJ(u, percent)
            endif
        endif
        if int != 0 then
            set mpreg[userid] = mpreg[userid] + int * 0.05
            call SetHeroInt(u, GetHeroInt(u, true) + int, true)
            if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_INT then
                set percent = GetUnitManaPercent(u)
                call SetUnitMaxMana(u, GetUnitMaxMana(u) - int * 5)
                call SetUnitManaPercentBJ(u, percent)
            endif
        endif
        if agi != 0 then
            call SetHeroAgi(u, GetHeroAgi(u, true) + agi, true)
            call SetUnitAttackSpeed(u, GetUnitAttackSpeed(u) + agi * 0.02)
        endif

    endfunction

    globals
        constant integer BONUS_HEALTH = 1
        constant integer BONUS_HEALTH_REGEN = 2
        constant integer BONUS_HEALTH_REGEN_PERCENT = 3
        constant integer BONUS_MANA = 4
        constant integer BONUS_MANA_REGEN = 5
        constant integer BONUS_MANA_REGEN_PERCENT = 6
        constant integer BONUS_ATTACK = 7
        constant integer BONUS_ATTACKSPEED = 8
        constant integer BONUS_ARMOR = 9
        constant integer BONUS_MOVESPEED = 10
    endglobals

    function UnitAddBonus takes unit u, integer bonus, real value returns nothing
        local real percent 
        local integer userid = GetUnitUserData(u)

        if bonus == BONUS_HEALTH then
            set percent = GetUnitLifePercent(u)
            call SetUnitMaxLife(u, GetUnitMaxLife(u) + value)
            call SetUnitLifePercentBJ(u, percent)
        elseif bonus == BONUS_HEALTH_REGEN then
            set hpreg[userid] = hpreg[userid] + value
        elseif bonus == BONUS_HEALTH_REGEN_PERCENT then
            set hpreg2[userid] = hpreg2[userid] + value
        elseif bonus == BONUS_MANA then
            set percent = GetUnitManaPercent(u)
            call SetUnitMaxMana(u, GetUnitMaxMana(u) + value)
            call SetUnitManaPercentBJ(u, percent)
        elseif bonus == BONUS_MANA_REGEN then
            set mpreg[userid] = mpreg[userid] + value
        elseif bonus == BONUS_MANA_REGEN_PERCENT then
            set mpreg2[userid] = mpreg2[userid] + value
        elseif bonus == BONUS_ATTACK then
            call SetUnitBaseDamageByIndex(u, 0, GetUnitBaseDamageByIndex(u, 0) + R2I(value))
        elseif bonus == BONUS_ATTACKSPEED then
            call SetUnitAttackSpeed(u, GetUnitAttackSpeed(u) + value)
        elseif bonus == BONUS_ARMOR then
            call SetUnitArmour(u, GetUnitArmour(u) + value)
        elseif bonus == BONUS_MOVESPEED then
            call SetUnitBonusMoveSpeedPercent(u, GetUnitBonusMoveSpeedPercent(u) + value)
        endif
    endfunction

    function MorphUnit takes unit u, integer uid returns nothing
        call MorphUnitToTypeIdEx(u, uid, 0, true, true, 1, 1, true, true, null, true)
    endfunction
    
    function ShowAbilityEx takes unit u, integer aid, boolean flag returns nothing
        local ability ab = GetUnitAbility(u, aid)
        
        if ab != null then
            if IsUnitPaused(u) then
                call PauseUnit(u, false)
                if not flag then 
                    if IsAbilityVisible(ab) then
                        call ShowAbility(ab, false)
                    endif
                else
                    if not IsAbilityVisible(ab) then
                        call ShowAbility(ab, true)
                    endif
                endif
                call PauseUnit(u, true)
            else
                if not flag then 
                    if IsAbilityVisible(ab) then
                        call ShowAbility(ab, false)
                    endif
                else
                    if not IsAbilityVisible(ab) then
                        call ShowAbility(ab, true)
                    endif
                endif
            endif
        endif
        
        set ab = null
    endfunction
    
    function DisableAbilityEx takes unit u, integer aid, boolean hide returns nothing
        local ability ab = GetUnitAbility(u, aid)
        
        if ab != null then
            if IsUnitPaused(u) then
                call PauseUnit(u, false)
                if IsAbilityEnabledEx(ab) then
                    call SetAbilityEnabledEx(ab, false)
                endif
                if hide and IsAbilityVisible(ab) then
                    call ShowAbility(ab, false)
                endif
                call PauseUnit(u, true)
            else
                if IsAbilityEnabledEx(ab) then
                    call SetAbilityEnabledEx(ab, false)
                endif
                if hide and IsAbilityVisible(ab) then
                    call ShowAbility(ab, false)
                endif
            endif
        endif
        
        set ab = null
    endfunction
    
    function EnableAbilityEx takes unit u, integer aid, boolean show returns nothing
        local ability ab = GetUnitAbility(u, aid)
        
        if ab != null then
            if IsUnitPaused(u) then
                call PauseUnit(u, false)
                if not IsAbilityEnabledEx(ab) then
                    call SetAbilityEnabledEx(ab, true)
                endif
                if show and not IsAbilityVisible(ab) then
                    call ShowAbility(ab, true)
                endif
                call PauseUnit(u, true)
            else
                if not IsAbilityEnabledEx(ab) then
                    call SetAbilityEnabledEx(ab, true)
                endif
                if show and not IsAbilityVisible(ab) then
                    call ShowAbility(ab, true)
                endif
            endif
        endif
        
        set ab = null
    endfunction

    function DamageUnit takes unit u, unit t, real dmg returns nothing
        set dmg = MathRealCeil(dmg)
        if dmg > 0 and FilterGeneral(u, t) then
            call UnitDamageTarget(u, t, dmg, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, null)
        endif
    endfunction
endlibrary