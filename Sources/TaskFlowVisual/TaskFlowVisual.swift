
import Gtk

let status = Application.run(startupHandler: nil) { app in
    let window = ApplicationWindowRef(application: app)

    window.title = "TaskFlow"
    window.setDefaultSize(width: 600, height: 450)

    // Área principal da interface
    let layout = BoxRef(orientation: .vertical, spacing: 12)
    layout.set(marginTop: 24)
    layout.set(marginBottom: 24)
    layout.set(marginStart: 24)
    layout.set(marginEnd: 24)

    // Cabeçalho
    let title = LabelRef(str: "TaskFlow")
    layout.append(child: title)

    let subtitle = LabelRef(str: "Organize suas tarefas")
    layout.append(child: subtitle)

    // Campo para digitar tarefas
    let entry = EntryRef()
    entry.set(placeholderText: "Digite uma nova tarefa...")
    layout.append(child: entry)

    // Lista visual de tarefas
    let tasks = BoxRef(orientation: .vertical, spacing: 8)

    let button = ButtonRef(label: "Adicionar tarefa")

    button.onClicked {
        let text = entry.text.trimmingCharacters(in: .whitespacesAndNewlines)

        if !text.isEmpty {
            let taskLabel = LabelRef(str: "☐ " + text)
            tasks.append(child: taskLabel)
            entry.text = ""
        }
    }

    layout.append(child: button)
    layout.append(child: tasks)

    window.set(child: layout)
    window.set(visible: true)
}

guard let status = status else {
    fatalError("Could not create Application")
}

guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
