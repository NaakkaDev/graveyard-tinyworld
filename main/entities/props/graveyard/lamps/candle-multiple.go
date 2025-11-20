embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/models/props/graveyard/lamps/candle-multiple.glb\"\n"
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
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  position {
    x: -1.0
    y: 5.5
    z: 0.5
  }
  scale {
    x: 0.02
    y: 0.02
    z: 0.02
  }
}
embedded_components {
  id: "sprite1"
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
    x: 1.25
    y: 4.9
    z: -1.5
  }
  scale {
    x: 0.02
    y: 0.02
    z: 0.02
  }
}
embedded_components {
  id: "sprite2"
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
    x: 1.25
    y: 3.8
    z: 1.5
  }
  scale {
    x: 0.02
    y: 0.02
    z: 0.02
  }
}
