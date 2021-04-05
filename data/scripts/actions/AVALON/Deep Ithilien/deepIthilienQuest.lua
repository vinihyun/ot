local stonepos = {x=770, y=566, z=10, stackpos=1} -- Stone pos

local DPIT = Action()

function DPIT.onUse(cid, item, fromPos, item2, toPos)
    if item.itemid == 1945 then
	doRemoveItem(getThingfromPos(stonepos).uid, 1)
        doTransformItem(item.uid,1946)
        addEvent(onTimer9, 15*60*1000) --15minutes
    end
return true
end

function onTimer9() --creates wall back
    doTransformItem(getThingfromPos({x=752, y=575, z=10, stackpos=1}).uid, 1945)--lever pos
	doCreateItem(1026,1,{x=770, y=566, z=10})-- Stone pos
end

DPIT:uid(39989)
DPIT:register()