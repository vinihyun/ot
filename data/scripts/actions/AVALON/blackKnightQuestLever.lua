local stonepos = {x=478, y=801, z=7, stackpos=1} -- Stone pos

local BKLever = Action()
function BKLever.onUse(cid, item, fromPos, item2, toPos)
    if item.itemid == 1945 then
	doRemoveItem(getThingfromPos(stonepos).uid, 1)
        doTransformItem(item.uid,1946)
        addEvent(onTimer8, 15*60*1000) --30minutes
    end
return true
end

function onTimer8() --creates wall back
    doTransformItem(getThingfromPos({x=488, y=794, z=7, stackpos=1}).uid, 1945)--lever pos
	doCreateItem(2721,1,{x=478, y=801, z=7})-- Stone pos
end

BKLever:register()