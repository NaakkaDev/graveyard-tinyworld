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
    value: "100.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "static"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "static_spot"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "offset"
    value: "0.0, -5.0, 1.0"
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
  data: "mesh: \"/assets/models/props/graveyard/lamps/lantern-glass.glb\"\n"
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
