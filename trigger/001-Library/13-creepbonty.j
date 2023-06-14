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
            call SetTextTagPosUnit(tt, u, 0)
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
        
        if tid == 'e002' or tid == 'e003' or tid == 'e004' or tid == 'e005' or tid == 'e006' or tid == 'e007' or tid == 'e008' or tid == 'e009' or tid == 'e00A' then
            set bounty1 = GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_BASE) + GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_NUMBER_OF_DICE)
            set bounty2 = bounty1 + GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_NUMBER_OF_DICE) * GetUnitIntegerField(t, UNIT_IF_GOLD_BOUNTY_AWARDED_SIDES_PER_DIE)
            set bountyCalc = GetRandomInt(bounty1, bounty2)
            if GetOwningPlayer(u) != Player(0) and GetOwningPlayer(u) != Player(4) and GetOwningPlayer(u) != Player(8) then 
                call text1(t, GetOwningPlayer(u), bountyCalc)
            endif
            call PolledWaitEx(2.0)
            call RemoveUnit(t)
        endif
        
        set u = null
        set t = null
    endfunction
    
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()
        
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function action)

        set t = null
    endfunction
endscope