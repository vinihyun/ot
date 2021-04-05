local stonepos = {x=784, y=590, z=10, stackpos=1} -- Stone pos


local DPIT3 = Action()

function DPIT3.onUse(cid, item, fromPos, item2, toPos)
    if item.itemid == 1945 then
	doRemoveItem(getThingfromPos(stonepos).uid, 1)
        doTransformItem(item.uid,1946)
        addEvent(onTimer11, 15*60*1000) --15minutes
    end
return true
end

function onTimer11() --creates wall back
    doTransformItem(getThingfromPos({x=785, y=586, z=10, stackpos=1}).uid, 1945)--lever pos
	doCreateItem(1304,1,{x=784, y=590, z=10})-- Stone pos
end

DPIT3:uid(39991)
DPIT3:register()