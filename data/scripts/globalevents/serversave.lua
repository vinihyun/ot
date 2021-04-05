local serversave = GlobalEvent("save")

function serversave.onThink(interval)
    saveServer()
    SaveHirelings()
    print("Saving server and Hirelins...")
    return true
end

serversave:interval(1 * 60 * 60 * 1000) -- 1 hour interval
serversave:register()