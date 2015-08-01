-- Hi all! This is my first Project *lua for GOS i don't know how to code. I learn it myself
-- If it has error, please feedback, and help me if u can. Thank everybody so much!
-- Sejuani by Luri
if GetObjectName(GetMyHero()) == "Sejuani" then
--Show Menu
Config = scriptConfig("Sejuani", "Sejuani.lua")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))
-- Begin
PrintChat("Sejuani v0.01")
OnLoop(function(myHero)
-- This line will add Auto smite champion or AutoIgnite soon
	if Config.Combo then
		local target = GetTarget(1175)
		if target then
-- Sejuani Q ArcticAssault
			if Config.Q and ValidTarget(target,650) then
				local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,0,650,70,false,true)
				if CanUseSpell(myHero,_Q) == READY and QPred.HitChance == 1 then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
-- Sejuani W FlaioftheNorthernWinds
			if Config.W and ValidTarget(target,350) then
				if CanUseSpell(myHero,_W) == READY and IsObjectAlive(myHero) then
				CastTargetSpell(myHero, _W)
				end
			end
-- Sejuani E Permafrost << Need to calculate DMG to active but i don't know how to
			if Config.E and ValidTarget(target,1000) then
				if CanUseSpell(myHero,_E) == READY and IsObjectAlive(myHero) then
					CastTargetSpell(myHero, _E)
				end
			end
-- Sejuani R GlacialPrison
			if Config.R and ValidTarget(target,1175) then -- Max range R
				local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,250,1175,110,true,true)
				if CanUseSpell(myHero,_R) == READY and RPred.HitChance == 1 then
					CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
				end
			end
		end
	end
end
)
end
