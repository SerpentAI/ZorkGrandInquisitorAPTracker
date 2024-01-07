ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")


CURRENT_INDEX = -1


function onClear(slotData)
    CURRENT_INDEX = -1

    -- Reset Locations
    for _, layoutLocationPath in pairs(LOCATION_MAPPING) do
        if layoutLocationPath[1] then
            local layoutLocationObject = Tracker:FindObjectForCode(layoutLocationPath[1])

            if layoutLocationObject then
                if layoutLocationPath[1]:sub(1, 1) == "@" then
                    layoutLocationObject.AvailableChestCount = layoutLocationObject.ChestCount
                else
                    layoutLocationObject.Active = false
                end
            end
        end
    end

    -- Reset Items
    for _, layoutItemData in pairs(ITEM_MAPPING) do
        if layoutItemData[1] and layoutItemData[2] then
            local layoutItemObject = Tracker:FindObjectForCode(layoutItemData[1])

            if layoutItemObject then
                if layoutItemData[2] == "toggle" then
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "progressive" then
                    layoutItemObject.CurrentStage = 0
                    layoutItemObject.Active = false
                elseif layoutItemData[2] == "consumable" then
                    layoutItemObject.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: Unknown item type %s for code %s", layoutItemData[2], layoutItemData[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: Could not find object for code %s", layoutItemData[1]))
            end
        end
    end

    -- Reset Settings
    print(slotData['goal'])
    print(slotData['early_rope_and_lantern'])
    print(slotData['deathsanity'])

    Tracker:FindObjectForCode("goal_three_artifacts").Active = false

    if slotData['goal'] then
        local goalValue = slotData['goal']
        local goalTrackerKey = nil

        if goalValue == 0 then
            goalTrackerKey = "goal_three_artifacts"
        end

        if goalTrackerKey then
            local goalTrackerObject = Tracker:FindObjectForCode(goalTrackerKey)
            goalTrackerObject.Active = true
        end
    end

    Tracker:FindObjectForCode("setting_deathsanity").Active = false

    if slotData['deathsanity'] then
        local deathsanityValue = slotData['deathsanity']
        local deathsanityTrackerKey = nil

        if deathsanityValue == 1 then
            deathsanityTrackerKey = "setting_deathsanity"
        end

        if deathsanityTrackerKey then
            local deathsanityTrackerObject = Tracker:FindObjectForCode(deathsanityTrackerKey)
            deathsanityTrackerObject.Active = true
        end
    end

    Tracker:FindObjectForCode("setting_early_rope_and_lantern").Active = false

    if slotData['early_rope_and_lantern'] then
        local earlyRopeAndLanternValue = slotData['early_rope_and_lantern']
        local earlyRopeAndLanternTrackerKey = nil

        if earlyRopeAndLanternValue == 1 then
            earlyRopeAndLanternTrackerKey = "setting_early_rope_and_lantern"
        end

        if earlyRopeAndLanternTrackerKey then
            local earlyRopeAndLanternTrackerObject = Tracker:FindObjectForCode(earlyRopeAndLanternTrackerKey)
            earlyRopeAndLanternTrackerObject.Active = true
        end
    end
end


function onItem(index, itemId, itemName, playerNumber)
    if index <= CURRENT_INDEX then
        return
    end

    CURRENT_INDEX = index

    local itemObject = ITEM_MAPPING[itemId]
    
    if not itemObject or not itemObject[1] then
        return
    end

    local trackerItemObject = Tracker:FindObjectForCode(itemObject[1])

    if trackerItemObject then
        if itemObject[2] == "toggle" then
            trackerItemObject.Active = true
        elseif itemObject[2] == "progressive" then
            if trackerItemObject.Active then
                trackerItemObject.CurrentStage = trackerItemObject.CurrentStage + 1
            else
                trackerItemObject.Active = true
            end
        elseif itemObject[2] == "consumable" then
            trackerItemObject.AcquiredCount = trackerItemObject.AcquiredCount + trackerItemObject.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: Unknown item type %s for code %s", itemObject[2], itemObject[1]))
        end
    else
        print(string.format("onItem: Could not find object for code %s", itemObject[1]))
    end
end


function onLocation(locationId, locationName)
    local locationObject = LOCATION_MAPPING[locationId]

    if not locationObject or not locationObject[1] then
        return
    end

    local trackerLocationObject = Tracker:FindObjectForCode(locationObject[1])

    if trackerLocationObject then
        if locationObject[1]:sub(1, 1) == "@" then
            trackerLocationObject.AvailableChestCount = trackerLocationObject.AvailableChestCount - 1
        else
            trackerLocationObject.Active = false
        end
    else
        print(string.format("onLocation: Could not find object for code %s", locationObject[1]))
    end
end


Archipelago:AddClearHandler("Clear", onClear)
Archipelago:AddItemHandler("Item", onItem)
Archipelago:AddLocationHandler("Location", onLocation)