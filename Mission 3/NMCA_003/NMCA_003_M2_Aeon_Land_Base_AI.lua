local BaseManager = import('/lua/ai/opai/basemanager.lua')
local SPAIFileName = '/lua/scenarioplatoonai.lua'
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local ScenarioPlatoonAI = import('/lua/ScenarioPlatoonAI.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local Buff = import('/lua/sim/Buff.lua')
local Difficulty = ScenarioInfo.Options.Difficulty

local M2_Aeon_Land_Base = BaseManager.CreateBaseManager()
local Aeon = 2

function M2_Aeon_Land_Base_Spawn()
	M2_Aeon_Land_Base:Initialize(ArmyBrains[Aeon], 'M2_Aeon_Land_Base', 'M2_Aeon_Land_Base_Marker', 30, {M2_Aeon_Land_Base = 200})
    M2_Aeon_Land_Base:StartNonZeroBase({{3,4,5}, {1,2,2}})
	--M2_Aeon_Land_Base_Land_Patrols()
end

function M2_Aeon_Land_Base_Land_Patrols()
	--local opai = nil
	local Temp = {
		'M2_Aeon_Land_Base_Land_Patrol_Template',
		'NoPlan',
		{ 'xal0203', 1, (4), 'Attack', 'GrowthFormation' },   -- Assault Tank
		{ 'ual0202', 1, (2), 'Attack', 'GrowthFormation' },   -- Flak AA
		{ 'ual0205', 1, (2), 'Attack', 'GrowthFormation' },   -- Flak AA
	}
	local Builder = {
		BuilderName = 'M2_Aeon_Land_Base_Land_Patrol_Builder',
		PlatoonTemplate = Temp,
		InstanceCount = 1,
		Priority = 100,
		PlatoonType = 'Land',
		RequiresConstruction = true,
		LocationType = 'M2_Aeon_Land_Base',
		PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},
		PlatoonData = {
			PatrolChains = {'M2_Aeon_Land_Base_Patrol'}
		},
	}
	ArmyBrains[Aeon]:PBMAddPlatoon( Builder )
end