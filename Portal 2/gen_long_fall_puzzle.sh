#!/bin/sh

height=120  # maximum supported by the compiler
title="Long Fall"
output="long_fall.p2c"

cat <<EOF> "$output"
"portal2_puzzle"
{
	"AppID"		"644"
	"Version"		"14"
	"FileID"		"0x0000000000000000"
	"Timestamp_Created"		"0x0000000000000000"
	"Timestamp_Modified"		"0x0000000000000000"
	"CompileTime"		"0.000000"
	"Coop"		"0"
	"Title"		"$title"
	"PreviewDirty"		"1"
	"ChamberSize"		"1 1 $height"
	"Voxels"
	{
		"Solid"
		{
EOF

for n in $(seq 0 $(($height - 1))); do
cat <<EOF>> "$output"
			"Z$n"	{ "Y1" "f01" "Y0" "f01" }
EOF
done

cat <<EOF>> "$output"
			"Z$height"	{ "Y1" "f00" "Y0" "f00" }
EOF

for p in 0 1 2; do
  cat <<EOF>> "$output"
		}
		"Portal$p"
		{
EOF
  for n in $(seq 0 $height); do
    cat <<EOF>> "$output"
			"Z$n"	{ "Y1" "f00" "Y0" "f00" }
EOF
  done
done

cat <<EOF>> "$output"
		}
	}
	"Items"
	{
		"Item"
		{
			"Index"		"0"
			"Type"		"ITEM_ENTRY_DOOR"
			"Deletable"		"0"
			"VoxelPos"		"0 0 $(($height - 1))"
			"LocalPos"		"0 0 0"
			"Angles"		"-90 -90 0"
			"ITEM_PROPERTY_DOOR_IS_COOP"		"0"
			"Facing"		"0 0 0"
			"ConnectionVisiblity"		"0"
			"DoorInstanceID"		"4.000000"
			"Enabled"		"1"
		}
		"Item"
		{
			"Index"		"1"
			"Type"		"ITEM_COOP_ENTRY_DOOR"
			"Deletable"		"0"
			"VoxelPos"		"0 0 $(($height - 1))"
			"LocalPos"		"0 0 0"
			"Angles"		"-90 -90 0"
			"ITEM_PROPERTY_DOOR_IS_COOP"		"0"
			"Facing"		"0 0 0"
			"ConnectionVisiblity"		"0"
			"DoorInstanceID"		"0.000000"
			"Enabled"		"0"
		}
		"Item"
		{
			"Index"		"2"
			"Type"		"ITEM_EXIT_DOOR"
			"Deletable"		"0"
			"VoxelPos"		"0 0 0"
			"LocalPos"		"0 0 0"
			"Angles"		"-90 -90 0"
			"ITEM_PROPERTY_CONNECTION_COUNT"		"0"
			"ITEM_PROPERTY_START_OPEN"		"1"
			"ITEM_PROPERTY_DOOR_IS_COOP"		"0"
			"Facing"		"0 0 0"
			"ConnectionVisiblity"		"0"
			"DoorInstanceID"		"3.000000"
			"Enabled"		"1"
		}
		"Item"
		{
			"Index"		"3"
			"Type"		"ITEM_COOP_EXIT_DOOR"
			"Deletable"		"0"
			"VoxelPos"		"0 0 0"
			"LocalPos"		"0 0 0"
			"Angles"		"-90 90 0"
			"ITEM_PROPERTY_CONNECTION_COUNT"		"0"
			"ITEM_PROPERTY_DOOR_IS_COOP"		"0"
			"ITEM_PROPERTY_COOP_EXIT_STARTS_LOCKED"		"0"
			"Facing"		"0 0 0"
			"ConnectionVisiblity"		"0"
			"DoorInstanceID"		"2.000000"
			"Enabled"		"0"
		}
	}
	"Connections"
	{
		"Connection"
		{
			"Sender"		"0"
			"Receiver"		"1"
			"Type"		"CONNECTION_BARRIER_ANCHOR_TO_EXTENT"
		}
		"Connection"
		{
			"Sender"		"2"
			"Receiver"		"3"
			"Type"		"CONNECTION_BARRIER_ANCHOR_TO_EXTENT"
		}
	}
}

EOF



