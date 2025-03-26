def on [note_title?: string] {
    if ($note_title | is-empty) {
        return "Usage: obsidian-new.nu <note title>"
    }

    let file_name = ($note_title | str replace -a ' ' '-')
    let formatted_file_name = $"(date now | format date '%Y-%m-%d')_($file_name).md"

    cd $"($env.HOME)/obsidian-vault"
    touch $"000-RoughNotes/($formatted_file_name)"
    nvim $"000-RoughNotes/($formatted_file_name)"
}
