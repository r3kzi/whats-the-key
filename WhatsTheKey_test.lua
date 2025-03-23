-- spec/WHATSTHEKEY_spec.lua

describe("WhatsTheKey Addon", function()
    local WhatsTheKey
    local originalPrint

    -- Helper to mock LibStub
    local function mockLibStub()
        _G.LibStub = setmetatable({
            ["AceAddon-3.0"] = {
                NewAddon = function(...)
                    local addon = {}
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
    end

    -- Helper to mock WoW API for LFG List
    local function mockC_LFGList()
        _G.C_LFGList = {
            GetSearchResultInfo = function(searchResultID)
                -- Adding a name field for more complete test output
                return { name = "+10", activityIDs = { 101, 102 } }
            end,
            GetActivityInfoTable = function(activityID)
                if activityID == 101 then
                    -- Provide a fullName for testing the output string.
                    return { isMythicPlusActivity = true, fullName = "Cinderbrew (Mythic Keystone)" }
                else
                    return { isMythicPlusActivity = false }
                end
            end,
        }
    end

    before_each(function()
        -- Save original print to restore later.
        originalPrint = _G.print

        mockLibStub()
        mockC_LFGList()

        -- Clear any previous module cache and require the addon file.
        package.loaded["WhatsTheKey"] = nil
        WhatsTheKey = require("WhatsTheKey")
    end)

    after_each(function()
        -- Restore globals to avoid side effects.
        _G.print = originalPrint
        _G.LibStub = nil
        _G.C_LFGList = nil
    end)

    it("should not print anything if searchResultID is empty", function()
        local printCalled = false
        _G.print = function(...)
            printCalled = true
        end

        WhatsTheKey:OnJoinedGroup("LFG_LIST_JOINED_GROUP", "", "TestGroup")
        assert.is_false(printCalled)
    end)

    it("should print the expected output when a mythic plus activity is present", function()
        local printedOutput = nil
        _G.print = function(...)
            printedOutput = table.concat({ ... }, " ")
        end

        WhatsTheKey:OnJoinedGroup("LFG_LIST_JOINED_GROUP", "dummyID", "TestGroup")

        -- Expected string is constructed from the mock values.
        local expected = string.format("You joined %s %s", "Cinderbrew (Mythic Keystone)", "+10")
        assert.are.equal(expected, printedOutput)
    end)
end)
