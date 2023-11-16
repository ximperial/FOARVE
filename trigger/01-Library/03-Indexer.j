library Indexer
    /* ------------------------ Indexer v1.1 by Chopinski ----------------------- */
    // Simple unit indexer for version 1.31+
    // Simply copy and paste to import
    /* ----------------------------------- END ---------------------------------- */
    
    /* -------------------------------------------------------------------------- */
    /*                                   System                                   */
    /* -------------------------------------------------------------------------- */
    struct Indexer
        private static integer ability = 'Adef'
        private static integer array array
        private static integer key = -1
        private static integer id = -1
        readonly static integer mid = 0
        readonly static unit unit
        readonly static trigger onIndex = CreateTrigger()
        readonly static trigger onDeindex = CreateTrigger()
        
        private static method index takes unit source returns nothing
            local integer nid
            if GetUnitUserData(source) == 0 and not IsUnitTower(source) then
                set unit = source
                
                if key > - 1 then
                    set nid = array[key]
                    set array[key] = 0
                    set key = key - 1
                else
                    set id = id + 1
                    set nid = id
                    set mid = id
                endif
                
                if GetUnitAbilityLevel(unit, ability) == 0 then
                    call UnitAddAbility(unit, ability)
                    call UnitMakeAbilityPermanent(unit, true, ability)
                    call DisableAbility(GetUnitAbility(unit, ability), true, true)
                endif
                call SetUnitUserData(unit, nid)
                call TriggerEvaluate(onIndex)
                
                set unit = null
            endif
        endmethod
    
        private static method onOrder takes nothing returns nothing
            if GetIssuedOrderId() == 852056 then
                if GetUnitAbilityLevel(GetTriggerUnit(), ability) == 0 then
                    set unit = GetTriggerUnit()
                    call TriggerEvaluate(onDeindex)
                    set key = key + 1
                    set array[key] = GetUnitUserData(unit)
                    set unit = null
                endif
            endif
        endmethod
    
        private static method onEnter takes nothing returns nothing
            call index(GetFilterUnit())
        endmethod
    
        private static method onInit takes nothing returns nothing
            local trigger t = CreateTrigger()
            local region r = CreateRegion()
            local rect map = GetWorldBounds()
            local integer i = 0
            
            call RegionAddRect(r, map)
            call RemoveRect(map)
            call TriggerRegisterEnterRegion(CreateTrigger(), r, Filter(function thistype.onEnter))
            loop
                exitwhen i == bj_MAX_PLAYER_SLOTS
                    call GroupEnumUnitsOfPlayer(bj_lastCreatedGroup, Player(i), null)
                    loop
                        set unit = GroupForEachUnit(bj_lastCreatedGroup)
                        exitwhen unit == null
                        call index(unit)
                    endloop
                    call GroupClear(bj_lastCreatedGroup)
                    call TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_ISSUED_ORDER, null)
                set i = i + 1
            endloop
            call TriggerAddCondition(t, Filter(function thistype.onOrder))
            
            set t = null
            set r = null
            set map = null
        endmethod
    endstruct
    
    /* -------------------------------------------------------------------------- */
    /*                                  JASS API                                  */
    /* -------------------------------------------------------------------------- */
    function RegisterUnitIndexEvent takes code c returns nothing
        call TriggerAddCondition(Indexer.onIndex, Filter(c))
    endfunction
    
    function RegisterUnitDeindexEvent takes code c returns nothing
        call TriggerAddCondition(Indexer.onDeindex, Filter(c))
    endfunction
    
    function GetIndexUnit takes nothing returns unit
        return Indexer.unit
    endfunction
    
    function GetCurrentIndexer takes nothing returns integer
        return Indexer.mid
    endfunction
endlibrary