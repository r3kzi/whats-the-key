-- Create the addon using AceAddon-3.0 with AceEvent-3.0 for event handling.
local WhatsTheKey = LibStub("AceAddon-3.0"):NewAddon("WhatsTheKey", "AceEvent-3.0")

-- Optional initialization function.
function WhatsTheKey:OnInitialize()
    -- Initialization code can go here.
end

-- Called when the addon is enabled.
function WhatsTheKey:OnEnable()
    -- Register the event fired when joining a group via the LFG system.
    self:RegisterEvent("LFG_LIST_JOINED_GROUP", "OnJoinedGroup")
end

-- Event handler for LFG_LIST_JOINED_GROUP.
function WhatsTheKey:OnJoinedGroup(event, searchResultID, groupName)
    print(event)
    print(searchResultID)
    print(groupName)
end

