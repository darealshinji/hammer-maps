// Created by Crowbar 0.33.0.0

$ModelName "dm_longest_yard\tracksign08_edited.mdl"

$StaticProp

$BodyGroup "Body"
{
	studio "tracksign08_reference.smd"
}


$SurfaceProp "metalvent"

$Contents "solid"

$CDMaterials "models\props_trainstation\"

$CBox 0 0 0 0 0 0

$BBox -10.34 -23.333 -25.299 11.907 23.431 25.091


$Sequence "idle" {
	"tracksign08_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}
