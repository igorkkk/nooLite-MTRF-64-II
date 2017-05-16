M={}
M.publ = function(answer, call)
    answerFlag = false
    -- answer.heap = ""..node.heap()
    local answ = {}
    for k, v in pairs(_G.answer) do
            answ[k] = v
    end
    _G.answer = {}
    
    local sendMQ
    local getd = coroutine.create(function()
        for k, v in pairs(answ) do
            sendMQ(k, v)
            -- answ[k] = nil
            coroutine.yield()
        end
            answerFlag = true
            if #_G.answer ~= 0 then 
                publ() 
            end
            if call and #_G.answer == 0 then
                M.publ,sendMQ, getd, M  = nil, nil, nil, nil
                package.loaded["pubmqtt"]=nil
                call()                      
            end
    end)
    sendMQ = function(k, v)
        m:publish("from"..myClient.."/"..k,v,0,0, 
            function(con) 
                coroutine.resume(getd)
        end)
    end
    coroutine.resume(getd)
end
return M
