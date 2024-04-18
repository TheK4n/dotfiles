return {
    {
        'kana/vim-textobj-lastpat', -- text-object i/, operate under finding
        event = "InsertEnter",
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'sgur/vim-textobj-parameter',
        event = "InsertEnter",
        dependencies = { 'kana/vim-textobj-user' }
    }
}