def on [note_title?: string] {
    if ($note_title | is-empty) {
        return "Usage: on <note title>"
    }

    let file_name = ($note_title | str replace -a ' ' '-')
    let formatted_file_name = $"(date now | format date '%Y-%m-%d')_($file_name).md"

    cd $"($env.HOME)/obsidian-vault"
    touch $"000-RoughNotes/($formatted_file_name)"
    nvim $"000-RoughNotes/($formatted_file_name)"
}

def daily [] {
    let now = date now
    let date_str = ($now | format date '%Y-%m-%d')
    let time_str = ($now | format date '%H:%M')
    let title = $date_str

    let base_path = $"($env.HOME)/obsidian-vault"
    let template_path = $"($base_path)/999-Templates/Diary.md"
    let note_path = $"($base_path)/001-Dairy/($date_str).md"

    mkdir (dirname $note_path)

    if not ($note_path | path exists) {
        let template = open $template_path

        let content = ($template
            | str replace -a '{{title}}' $title
            | str replace -a '{{date}}' $date_str
            | str replace -a '{{time}}' $time_str
        )

        echo $content | save --force $note_path
    }

    nvim $note_path
}
