ENABLE_DEBUG_LOG = false

ScriptHost:LoadScript("scripts/logic/logic.lua")

Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")

Tracker:AddLayouts("layouts/tabs.json")
Tracker:AddLayouts("layouts/subway.json")
Tracker:AddLayouts("layouts/teleporter.json")
Tracker:AddLayouts("layouts/totemizer.json")
Tracker:AddLayouts("layouts/hotspots.json")
Tracker:AddLayouts("layouts/goals.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/spells.json")
Tracker:AddLayouts("layouts/totems.json")

Tracker:AddLayouts("layouts/tracker.json")

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
