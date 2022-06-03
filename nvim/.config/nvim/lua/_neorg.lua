require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Notes/work",
                    home = "~/Notes/home",
                }
            }
        },
        ['core.norg.journal'] = {
            config = {
                strategy = 'flat',
            }
        },
        ['core.norg.concealer'] = {
            config = {
                icon_preset = 'varied',
            }
        }
    }
}
