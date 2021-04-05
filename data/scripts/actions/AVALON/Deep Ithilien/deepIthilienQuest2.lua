local stonepos = {x=761, y=590, z=10, stackpos=1} -- Stone pos

local DPIT2 = Action()

function DPIT2.onUse(cid, item, fromPos, item2, toPos)
    if item.itemid == 1945 then
	doRemoveItem(getThingfromPos(stonepos).uid, 1)
        doTransformItem(item.uid,1946)
        addEvent(onTimer10, 15*60*1000) --15minutes
    end
return true
end

function onTimer10() --creates wall back
    doTransformItem(getThingfromPos({x=766, y=582, z=10, stackpos=1}).uid, 1945)--lever pos
	doCreateItem(1304,1,{x=761, y=590, z=10})-- Stone pos
end

DPIT2:uid(39990)
DPIT2:register()