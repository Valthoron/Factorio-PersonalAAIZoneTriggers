local function on_player_changed_position(event)
    local player = game.get_player(event.player_index)

    if not player.character then
        return
    end

    local current_zone = ""
    local current_zone_data = remote.call("aai-zones", "get_zone_for_position", player)

    if current_zone_data ~= nil then
        current_zone = current_zone_data.type
    end

    if current_zone ~= global.current_zone then
        if global.current_zone ~= "" then
            -- Exiting zone
        end

        if current_zone ~= "" then
            -- Entering zone
            if current_zone == "zone-plus-green" and player.character_personal_logistic_requests_enabled == false then
                player.character_personal_logistic_requests_enabled = true

                player.create_local_flying_text({
                    text = "Personal logistic requests enabled!",
                    position = player.position,
                    color = { r = 0.2, g = 0.8, b = 0.2 }
                })
            end

            if current_zone == "zone-plus-red" and player.character_personal_logistic_requests_enabled == true then
                player.character_personal_logistic_requests_enabled = false

                player.create_local_flying_text({
                    text = "Personal logistic requests disabled!",
                    position = player.position,
                    color = { r = 0.9, g = 0.2, b = 0.1 }
                })
            end
        end

        global.current_zone = current_zone
    end
end

-- local function on_player_cursor_stack_changed(event)
--     local selection = zone_get_player_selection(player.index)
--     local player = game.players[event.player_index]

--     if player.cursor_stack and player.cursor_stack.valid and player.cursor_stack.valid_for_read then
--         if player.cursor_stack.name == "zone-planner" then
--             player.create_local_flying_text({
--                 text = "GUI on",
--                 position = player.position,
--                 color = { r = 1, g = 1, b = 1 }
--             })

--             local frame = player.gui.left.zone

--             frame.zone_colour_table.add {
--                 type = "sprite-button",
--                 name = "Personal Triggers",
--                 sprite = "virtual-signal/zone-logistics-enable",
--                 tooltip = { "colour-green" },
--                 style = colour == selection.colour and "zone-button-active" or "zone-button",
--             }
--         end
--     end
-- end

script.on_event(defines.events.on_player_changed_position, on_player_changed_position)
--script.on_event(defines.events.on_player_cursor_stack_changed, on_player_cursor_stack_changed)
