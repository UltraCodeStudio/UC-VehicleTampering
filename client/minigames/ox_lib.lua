if Config.MiniGames ~= 'ox' then return end

function RunSkillCheck(difficulty)
    difficulty = difficulty or 'easy' -- default to easy if not specified
    local success = lib.skillCheck({difficulty,difficulty,difficulty}, {'w', 'a', 's', 'd'})
    return success
end