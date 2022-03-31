local ls = require'luasnip'

ls.snippets = {
  all = {
    ls.parser.parse_snippet('ent','@Entity()\nexport class $1 extends BaseEntity {\n\t$0\n}'),
    ls.parser.parse_snippet('col','@Column()\n$1: $2;'),
  }
}

