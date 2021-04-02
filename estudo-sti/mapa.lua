return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 4,
  nextobjectid = 6,
  properties = {},
  tilesets = {
    {
      name = "RPGpack_sheet",
      firstgid = 1,
      filename = "RPGpack_sheet.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 20,
      image = "Spritesheet/RPGpack_sheet.png",
      imagewidth = 1280,
      imageheight = 832,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 260,
      tiles = {}
    },
    {
      name = "brother",
      firstgid = 261,
      filename = "brother.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 1,
      image = "brother.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      id = 1,
      name = "fundo",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 2, 2, 2, 31, 32, 33, 2, 2, 3,
        21, 22, 22, 22, 31, 32, 33, 22, 22, 23,
        21, 22, 22, 22, 31, 32, 33, 22, 22, 23,
        21, 22, 22, 22, 31, 32, 33, 22, 22, 23,
        21, 22, 22, 22, 31, 32, 33, 22, 22, 23,
        21, 22, 22, 22, 51, 52, 53, 22, 22, 23,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 23,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 23,
        21, 22, 22, 22, 22, 22, 22, 22, 22, 23,
        41, 42, 42, 42, 42, 42, 42, 42, 42, 43
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      id = 3,
      name = "plantas",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 204, 0, 0, 0, 0, 0, 0, 205, 0,
        0, 224, 204, 0, 0, 0, 0, 205, 225, 0,
        0, 205, 224, 0, 0, 0, 204, 225, 205, 0,
        0, 225, 0, 0, 0, 0, 224, 0, 225, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objetos",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 4,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 128,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = "player"
          }
        },
        {
          id = 5,
          name = "moeda",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 128,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = "moeda"
          }
        }
      }
    }
  }
}
