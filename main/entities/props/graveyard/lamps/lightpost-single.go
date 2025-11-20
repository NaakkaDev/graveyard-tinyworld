components {
  id: "bulb"
  component: "/light_and_shadows/bulb.script"
  properties {
    id: "color"
    value: "0.9, 0.7, 0.2, 1.0"
    type: PROPERTY_TYPE_VECTOR4
  }
  properties {
    id: "power"
    value: "60.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "direct"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "angle"
    value: "-180.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "smoothness"
    value: "0.5"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "offset"
    value: "-7.0, -19.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
  properties {
    id: "num"
    value: "5.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/models/props/graveyard/lamps/lightpost-single.glb\"\n"
  "name: \"{NAME}\"\n"
  "materials {\n"
  "  name: \"colormap\"\n"
  "  material: \"/light_and_shadows/materials/model/skinned/model_skinned_instanced.material\"\n"
  "  textures {\n"
  "    sampler: \"tex0\"\n"
  "    texture: \"/assets/models/props/graveyard/colormap.png\"\n"
  "  }\n"
  "  textures {\n"
  "    sampler: \"tex1\"\n"
  "    texture: \"/assets/models/props/graveyard/colormap.png\"\n"
  "  }\n"
  "}\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"lantern\"\n"
  "material: \"/light_and_shadows/materials/fog_sprite/fog_sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  position {
    y: 20.95
    z: 6.5
  }
  scale {
    x: 0.7
    y: 0.75
  }
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"lantern\"\n"
  "material: \"/light_and_shadows/materials/fog_sprite/fog_sprite.material\"\n"
  "size {\n"
  "  x: 2.0\n"
  "  y: 4.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  position {
    x: -1.35
    y: 20.95
    z: 5.2
  }
  rotation {
    y: 0.70710677
    w: 0.70710677
  }
  scale {
    x: 0.7
    y: 0.75
  }
}
