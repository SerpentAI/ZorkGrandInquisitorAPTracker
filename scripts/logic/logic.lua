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
function canActivateZorkRocks()
    return canReachGUETech() and has("zork_rocks") and has("pouch_of_zorkmids") and has("hotspot_soda_machine_buttons") and has("hotspot_soda_machine_coin_slot")
end

function canDestroyDam()
    return canReachSubwayFloodControlDam() and has("spell_rezrov") and has("hotspot_flood_control_buttons") and has("hotspot_flood_control_doors")
end

function canLoosenZorkRocks()
    return canReachGUETech() and has("pouch_of_zorkmids") and has("hotspot_candy_machine_buttons") and has("hotspot_candy_machine_coin_slot")
end

function canMailLetter()
    return canReachWhiteHouse() and (has("totem_griff") or has("totem_lucy")) and has("hotspot_mailbox_door") and has("hotspot_mailbox_flag")
end

function canObtainBeburtt()
    return canReachSpellLab() and has("hotspot_blank_scroll_box") and has("hotspot_spell_checker")
end

function canObtainObidil()
    return canReachSpellLab() and canReachGUETech() and has("pouch_of_zorkmids") and has("hotspot_frozen_treat_machine_coin_slot") and has("hotspot_frozen_treat_machine_doors") and has("hotspot_spell_checker")
end

function canObtainSnavig()
    return canReachSpellLab() and canReachDMLairInterior() and has("hotspot_mirror") and has("scroll_fragment_ans") and has("scroll_fragment_giv") and has("hotspot_spell_checker")
end

function canObtainYastard()
    return canReachDMLairInterior() and has("flatheadia_fudge") and has("hungus_lard") and has("jar_of_hotbugs") and has("quelbee_honeycomb") and has("moss_of_mareilon") and has("mug")
end

function canOpenLockers()
    return canReachGUETech() and has("pouch_of_zorkmids") and has("hotspot_candy_machine_buttons") and has("hotspot_candy_machine_coin_slot")
end

function canReachCrossroads()
    return canReachPortFoozleJacksShop() and has("rope") and has("hotspot_well")
end

function canReachDMLair()
    return canReachDMLairFront() or canReachDMLairBack()
end

function canReachDMLairBack()
    return canReachCrossroads() and has("map") and has("teleporter_destination_dungeon_masters_lair")
end

function canReachDMLairFront()
    return canReachCrossroads() and has("sword") and has("hotspot_dungeon_masters_lair_entrance")
end

function canReachDMLairInterior()
    return canReachDMLair() and has("hotspot_harrys_ashtray") and has("mead_light") and has("zimdor_scroll") and has("hotspot_harrys_bird_bath")
end

function canReachDragonArchipelago()
    return canReachHadesBeyondGates() and has("spell_narwile") and canObtainYastard()
end

function canReachDragonArchipelagoDragon()
    return canReachDragonArchipelago() and has("totem_griff") and has("hotspot_dragon_claw")
end

function canReachGUETech()
    return canReachGUETechFront() or canReachGUETechBack() or canReachGUETechBackWindow()
end

function canReachGUETechBack()
    return canReachCrossroads() and has("map") and has("teleporter_destination_spell_lab")
end

function canReachGUETechBackWindow()
    return canReachCrossroads() and has("map") and has("teleporter_destination_gue_tech")
end

function canReachGUETechFront()
    return canReachCrossroads() and has("spell_rezrov") and has("hotspot_in_magic_we_trust_door")
end

function canReachGUETechHallway()
    return canReachGUETechHallwayFront() or canReachGUETechHallwayBack()
end

function canReachGUETechHallwayBack()
    return canReachCrossroads() and has("map") and has("teleporter_destination_spell_lab")
end

function canReachGUETechHallwayFront()
    return canReachGUETech() and has("spell_igram") and has("hotspot_purple_words")
end

function canReachGUETechOutside()
    return canReachGUETechOutsideBack() or canReachGUETechOutsideFront()
end

function canReachGUETechOutsideBack()
    return canReachCrossroads() and has("map") and has("teleporter_destination_gue_tech")
end

function canReachGUETechOutsideFront()
    return canReachGUETech() and has("hotspot_gue_tech_door")
end

function canReachHades()
    return canReachHadesShore() and has("hotspot_hades_phone_buttons") and has("hotspot_hades_phone_receiver") and has("pouch_of_zorkmids")
end

function canReachHadesBeyondGates()
    return canReachHades() and canObtainSnavig()
end

function canReachHadesShore()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_hades")) or ((canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_hades")) or (canReachMonastery() and has("totemizer_destination_straight_to_hell") and has("hotspot_totemizer_wheels") and has("hotspot_totemizer_switch"))
end

function canReachMonastery()
    return canReachSubwayMonastery() and has("spell_glorf") and has("sword") and has("hotspot_monastery_vent")
end

function canReachMonasteryExhibit()
    return canReachMonastery() and has("totemizer_destination_hall_of_inquisition") and has("hotspot_totemizer_wheels") and has("hotspot_totemizer_switch")
end

function canReachPortFoozleJacksShop()
    return has("lantern") and has("hotspot_jacks_door") and has("hotspot_grand_inquisitor_doll")
end

function canReachPortFoozlePast()
    return canReachMonasteryExhibit() and has("large_telegraph_hammer") and has("hotspot_closing_the_time_tunnels_lever") and has("hotspot_closing_the_time_tunnels_hammer_slot") and has("spell_narwile") and canObtainYastard()
end

function canReachPortFoozlePastTavern()
    return canReachPortFoozlePast() and has("totem_lucy") and has("hotspot_port_foozle_past_tavern_door")
end

function canReachSpellLab()
    return canReachSpellLabBridge() and canDestroyDam() and has("sword") and has("hotspot_rope_bridge") and has("spell_golgatem") and has("hotspot_spell_lab_chasm")
end

function canReachSpellLabBridge()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_spell_lab")) or (canReachGUETechHallway() and has("student_id") and has("hotspot_student_id_machine"))
end

function canReachSubwayAlternate()
    return canReachCrossroads() and has("map") and (has("teleporter_destination_hades") or has("teleporter_destination_monastery"))
end

function canReachSubwayCrossroads()
    return canReachCrossroads() and has("subway_token") and has("hotspot_subway_token_slot")
end

function canReachSubwayFloodControlDam()
    return (canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_flood_control_dam_3")
end

function canReachSubwayMonastery()
    return (canReachCrossroads() and has("map") and has("teleporter_destination_monastery")) or ((canReachSubwayVanilla() or canReachSubwayAlternate()) and has("subway_destination_monastery"))
end

function canReachSubwayVanilla()
    return canReachSubwayCrossroads() and has("spell_kendall")
end

function canReachWhiteHouse()
    return canReachDMLairInterior() and has("hotspot_closet_door") and has("spell_narwile") and canObtainYastard()
end
