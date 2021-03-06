local ls = require'luasnip'

local S = ls.snippet
local T = ls.text_node
local I = ls.insert_node

ls.add_snippets('typescript', {
  S('ent', {
    T({
      'import { BaseEntity } from "src/utils/BaseEntity";',
      'import { Entity, Column } from "typeorm";'}),
      T({'','@Entity()'}),
      T({'','export class '}), I(1), T({' extends BaseEntity {'}),
      T({'', '  '}), I(0),
      T({'', '}'})
    }),

    S('col', {
      T({'@Column()', ''}),
      I(1), T(': '), I(2), T({';', '', ''}), I(0)
    })
  })
