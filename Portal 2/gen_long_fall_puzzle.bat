@echo off

echo Generate puzzle file...

rem maximum supported by the compiler
set height=120
set title=Long Fall
set output=long_fall.p2c

(
	echo "portal2_puzzle"
	echo {
	echo 	"AppID"					"644"
	echo 	"Version"				"14"
	echo 	"FileID"				"0x0000000000000000"
	echo 	"Timestamp_Created"		"0x0000000000000000"
	echo 	"Timestamp_Modified"	"0x0000000000000000"
	echo 	"CompileTime"			"0.000000"
	echo 	"Coop"					"0"
	echo 	"Title"					"%title%"
	echo 	"PreviewDirty"			"1"
	echo 	"ChamberSize"			"1 1 %height%"
	echo 	"Voxels"
	echo 	{
	echo 		"Solid"
	echo 		{
)> %output%

set /a height_minus=%height%-1

for /l %%n in (0, 1, %height_minus%) do (
	echo 			"Z%%n"	{ "Y1" "f01" "Y0" "f01" }>> %output%
)

echo 			"Z%height%"	{ "Y1" "f00" "Y0" "f00" }>> %output%

for /l %%p in (0, 1, 2) do (
	(
		echo 		}
		echo 		"Portal%%p"
		echo 		{
	)>> %output%

	for /l %%n in (0, 1, %height%) do (
		echo 			"Z%%n"	{ "Y1" "f00" "Y0" "f00" }>> %output%
	)
)

(
	echo 		}
	echo 	}
	echo 	"Items"
	echo 	{
	echo 		"Item"
	echo 		{
	echo 			"Index"							"0"
	echo 			"Type"							"ITEM_ENTRY_DOOR"
	echo 			"Deletable"						"0"
	echo 			"VoxelPos"						"0 0 %height_minus%"
	echo 			"LocalPos"						"0 0 0"
	echo 			"Angles"						"-90 -90 0"
	echo 			"ITEM_PROPERTY_DOOR_IS_COOP"	"0"
	echo 			"Facing"						"0 0 0"
	echo 			"ConnectionVisiblity"			"0"
	echo 			"DoorInstanceID"				"4.000000"
	echo 			"Enabled"						"1"
	echo 		}
	echo 		"Item"
	echo 		{
	echo 			"Index"							"1"
	echo 			"Type"							"ITEM_COOP_ENTRY_DOOR"
	echo 			"Deletable"						"0"
	echo 			"VoxelPos"						"0 0 %height_minus%"
	echo 			"LocalPos"						"0 0 0"
	echo 			"Angles"						"-90 -90 0"
	echo 			"ITEM_PROPERTY_DOOR_IS_COOP"	"0"
	echo 			"Facing"						"0 0 0"
	echo 			"ConnectionVisiblity"			"0"
	echo 			"DoorInstanceID"				"0.000000"
	echo 			"Enabled"						"0"
	echo 		}
	echo 		"Item"
	echo 		{
	echo 			"Index"								"2"
	echo 			"Type"								"ITEM_EXIT_DOOR"
	echo 			"Deletable"							"0"
	echo 			"VoxelPos"							"0 0 0"
	echo 			"LocalPos"							"0 0 0"
	echo 			"Angles"							"-90 -90 0"
	echo 			"ITEM_PROPERTY_CONNECTION_COUNT"	"0"
	echo 			"ITEM_PROPERTY_START_OPEN"			"1"
	echo 			"ITEM_PROPERTY_DOOR_IS_COOP"		"0"
	echo 			"Facing"							"0 0 0"
	echo 			"ConnectionVisiblity"				"0"
	echo 			"DoorInstanceID"					"3.000000"
	echo 			"Enabled"							"1"
	echo 		}
	echo 		"Item"
	echo 		{
	echo 			"Index"									"3"
	echo 			"Type"									"ITEM_COOP_EXIT_DOOR"
	echo 			"Deletable"								"0"
	echo 			"VoxelPos"								"0 0 0"
	echo 			"LocalPos"								"0 0 0"
	echo 			"Angles"								"-90 90 0"
	echo 			"ITEM_PROPERTY_CONNECTION_COUNT"		"0"
	echo 			"ITEM_PROPERTY_DOOR_IS_COOP"			"0"
	echo 			"ITEM_PROPERTY_COOP_EXIT_STARTS_LOCKED"	"0"
	echo 			"Facing"								"0 0 0"
	echo 			"ConnectionVisiblity"					"0"
	echo 			"DoorInstanceID"						"2.000000"
	echo 			"Enabled"								"0"
	echo 		}
	echo 	}
	echo 	"Connections"
	echo 	{
	echo 		"Connection"
	echo 		{
	echo 			"Sender"		"0"
	echo 			"Receiver"		"1"
	echo 			"Type"			"CONNECTION_BARRIER_ANCHOR_TO_EXTENT"
	echo 		}
	echo 		"Connection"
	echo 		{
	echo 			"Sender"		"2"
	echo 			"Receiver"		"3"
	echo 			"Type"			"CONNECTION_BARRIER_ANCHOR_TO_EXTENT"
	echo 		}
	echo 	}
	echo }
)>> %output%

echo Done.

