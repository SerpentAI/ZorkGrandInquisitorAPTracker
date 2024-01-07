function has(item)
    return Tracker:ProviderCountForCode(item) > 0
end

function has_not(item)
    return Tracker:ProviderCountForCode(item) == 0
end


-- Visibility Rules
function hasSettingDeathsanity()
    return has("setting_deathsanity")
end


-- Access Rules
function canReachCrossroads()
    return has("rope") and has("lantern")
end

function canReachDMLair()
    return canReachCrossroads() and has("sword")
end

function canReachDMLairBackwards()
    return canReachCrossroads() and has("map") and has("teleporter_destination_dungeon_masters_lair")
end

function canReachDMLairInterior()
    return (canReachDMLair() or canReachDMLairBackwards()) and has("mead_light") and has("zimdor_scroll")
end

function canReachDragonArchipelago()
    return canReachHadesBeyondGates() and has("spell_narwile") and has("spell_yastard")
end

function canReachGUETech()
    return canReachCrossroads() and (has("spell_rezrov") or (has("map") and has("teleporter_destination_gue_tech")))
end

function canReachGUETechBackwards()
    return canReachCrossroads() and has("map") and has("teleporter_destination_spell_lab")
end

function canReachGUETechHallway() -- This function seems redundant, but when you have the activated zork rocks, you can only enter the hallway the vanilla way
    return (canReachGUETech() or canReachGUETechBackwards()) and has("spell_igram")
end

function canReachGUETechHallwayBackwards()
    return canReachGUETechBackwards()
end

function canReachHades()
    return canReachHadesShore() and has("pouch_of_zorkmids")
end

function canReachHadesBeyondGates()
    return canReachHades() and canObtainSnavig()
end

function canReachHadesShore()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_hades")) or ((canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_hades")) or canReachMonastery()
end

function canReachMonastery()
    return canReachSubwayMonastery() and has("spell_glorf") and has("sword")
end

function canReachPortFoozleJacksShop()
    return has("lantern")
end

function canReachPortFoozlePast()
    return canReachMonastery() and has("large_telegraph_hammer") and has("spell_narwile") and has("spell_yastard")
end

function canReachSpellLab()
    return canReachSpellLabBridge() and has("sword") and has("spell_golgatem") and canReachSubwayFloodControlDam() and has("spell_rezrov")
end

function canReachSpellLabBridge()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_spell_lab")) or (canReachGUETechHallway() and has("student_id"))
end

function canReachSubwayVanilla()
    return canReachSubwayCrossroads() and has("spell_kendall")
end

function canReachSubwayAlternate()
    return canReachCrossroads() and has("map") and (has("teleporter_destination_hades") or has("teleporter_destination_monastery"))
end

function canReachSubwayCrossroads()
    return canReachCrossroads() and has("subway_token")
end

function canReachSubwayFloodControlDam()
    return (canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_flood_control_dam_3")
end

function canReachSubwayMonastery()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_monastery")) or ((canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_monastery"))
end

function canReachWhiteHouse()
    return canReachDMLairInterior() and has("spell_narwile") and has("spell_yastard")
end

function canObtainSnavig()
    return canReachDMLairInterior() and has("spell_throck") and has("snapdragon") and has("hammer") and canReachSubwayFloodControlDam() and has("spell_rezrov") and canReachSpellLab()
end
