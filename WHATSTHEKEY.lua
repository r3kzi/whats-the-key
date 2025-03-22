-- Create the addon using AceAddon-3.0 with AceEvent-3.0 for event handling.
local WhatsTheKey = LibStub("AceAddon-3.0"):NewAddon("WhatsTheKey", "AceEvent-3.0")

-- Optional initialization function.
function WhatsTheKey:OnInitialize()
    -- Initialization code can go here.
end

-- Called when the addon is enabled.
function WhatsTheKey:OnEnable()
    -- Register the event fired when joining a group via the LFG system.
    -- https://warcraft.wiki.gg/wiki/LFG_LIST_JOINED_GROUP
    self:RegisterEvent("LFG_LIST_JOINED_GROUP", "OnJoinedGroup")
end

-- Event handler for LFG_LIST_JOINED_GROUP.
function WhatsTheKey:OnJoinedGroup(event, searchResultID, groupName)
    -- Check if searchResultID exists and is not an empty string.
    if searchResultID and searchResultID ~= "" then
        -- Retrieve additional information about the search result.
        -- https://warcraft.wiki.gg/wiki/API_C_LFGList.GetSearchResultInfo
        local searchResultInfo = C_LFGList.GetSearchResultInfo(searchResultID)
	print("searchResultInfo")
	for k,v in pairs(searchResultInfo) do
  	    print( k,v )
	end

        -- Check if the returned info exists and has a list of activityIDs.
        if searchResultInfo and searchResultInfo.activityIDs then
            -- Loop through each activityID
            for index, activityID in ipairs(searchResultInfo.activityIDs) do
                -- Call GetActivityInfo with activityID
                -- https://warcraft.wiki.gg/wiki/API_C_LFGList.GetActivityInfoTable
                local activityInfo = C_LFGList.GetActivityInfoTable(activityID)
                
		-- Check if the activity info indicates a Mythic Plus activity.
		print("activityInfo")
		for k,v in pairs(activityInfo) do
   		    print( k,v )
		end
                if activityInfo and activityInfo.isMythicPlusActivity then
                    print(activityInfo)
                end
            end
        end
    end
end

return WhatsTheKey
