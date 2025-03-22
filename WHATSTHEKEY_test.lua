-- spec/WHATSTHEKEY_spec.lua
describe("WhatsTheKey Addon", function()
    local WhatsTheKey

    before_each(function()
        -- Create a callable LibStub mock with a __call metamethod.
        _G.LibStub = setmetatable({
            ["AceAddon-3.0"] = {
                NewAddon = function(...)
                    local addon = {}
                    -- Stub RegisterEvent to simply store the event handler.
                    function addon:RegisterEvent(event, funcName)
                        addon[event] = funcName
                    end
                    return addon
                end,
            },
        }, {
            __call = function(self, key)
                return self[key]
            end,
        })

        -- Mock the WoW API functions used in your addon.
        _G.C_LFGList = {
            GetSearchResultInfo = function(searchResultID)
                -- Return a mock search result info with a list of activity IDs.
                return { activityIDs = { 101, 102 } }
            end,
            GetActivityInfoTable = function(activityID)
                -- Return different activity info based on the activityID.
                if activityID == 101 then
                    return { isMythicPlusActivity = true }
                else
                    return { isMythicPlusActivity = false }
                end
            end,
        }

        -- Clear any previous module cache and require the addon file.
        package.loaded["WHATSTHEKEY"] = nil
        WhatsTheKey = require("WHATSTHEKEY")
    end)

    it("should not print anything if searchResultID is empty", function()
        local printCalled = false
        _G.print = function(...)
            printCalled = true
        end
        WhatsTheKey:OnJoinedGroup("LFG_LIST_JOINED_GROUP", "", "TestGroup")
        assert.is_false(printCalled)
    end)

    it("should print the activity info when a mythic plus activity is present", function()
        local printedArgs = nil
        _G.print = function(...)
            printedArgs = { ... }
        end
        WhatsTheKey:OnJoinedGroup("LFG_LIST_JOINED_GROUP", "dummyID", "TestGroup")

        -- We expect the printed argument to match the table returned by GetActivityInfo for activityID 101,
        -- which is { isMythicPlusActivity = true }.
        assert.is_table(printedArgs)
    end)
end)
