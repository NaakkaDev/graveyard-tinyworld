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
    value: "80.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "static"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "direct"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "angle"
    value: "10.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "smoothness"
    value: "0.3"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "static_spot"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "offset"
    value: "0.0, -3.0, 1.0"
    type: PROPERTY_TYPE_VECTOR3
  }
  properties {
    id: "candle_sway"
    value: "0.5"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "num"
    value: "1.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/models/props/graveyard/lamps/lantern-candle.glb\"\n"
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
  data: "default_animation: \"firea\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 79.0\n"
  "  y: 169.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  position {
    y: 4.8
  }
  scale {
    x: 0.02
    y: 0.02
    z: 0.02
  }
}
