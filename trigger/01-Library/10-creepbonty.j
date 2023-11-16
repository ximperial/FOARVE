scope creepbonty initializer init

    private function text1 takes unit u, player p, integer gold returns nothing
        local string s = ""
        local texttag tt

        call AdjustPlayerStateBJ(gold, p, PLAYER_STATE_RESOURCE_GOLD)
        if gold < 0 then 
            set s = I2S(gold)
        else
            set s = "+" + I2S(gold)
        endif
        if GetLocalPlayer() == p then
            set tt = CreateTextTag()
            call SetTextTagText(tt, s, 0.0253)
            call SetTextTagPos(tt, GetUnitX(u), GetUnitY(u), 0)
            call SetTextTagColor(tt, 255, 220, 0, 255)
            call SetTextTagVelocity(tt, 0, 0.03)
            call SetTextTagLifespan(tt, 1)
            call SetTextTagPermanent(tt, false)
        endif

        set tt = null
    endfunction
    
    private function action takes nothing returns nothing
        local unit u = GetKillingUnit()
        local unit t = GetTriggerUnit()
        local integer tid = GetUnitTypeId(t)
        local integer bounty1
        local integer bounty2
        local integer bountyCalc
        local group g
        
        if tid == 'e002' or tid == 'e003' or tid == 'e004' or tid == 'ndqn' then
            set bounty1 = GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_BASE) + GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_NUMBER_OF_DICE)
            set bounty2 = bounty1 + GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_NUMBER_OF_DICE) * GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_SIDES_PER_DIE)
            set bountyCalc = GetRandomInt(bounty1, bounty2)
            if GetOwningPlayer(u) != Player(0) and GetOwningPlayer(u) != Player(6) and GetOwningPlayer(t) != Player(12) then 
                call text1(t, GetOwningPlayer(u), bountyCalc)
            endif
            set g = CreateGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(t), GetUnitY(t), 1200, null)
            call GroupRemoveUnit(g, u)
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                if IsUnitAlly(gUnit, GetOwningPlayer(u)) and GetOwningPlayer(gUnit) != Player(0) and GetOwningPlayer(gUnit) != Player(6) and GetOwningPlayer(gUnit) != GetOwningPlayer(u) then
                    call text1(t, GetOwningPlayer(gUnit), bountyCalc / 2)
                endif
            endloop
            call DestroyGroup(g)
            call PolledWaitEx(3.0)
            call RemoveUnit(t)
        endif
        
        set u = null
        set t = null
        set g = null
    endfunction
    
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function action)

        set t = null
    endfunction
endscope