//
// FormExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Ignite

struct FormExamples: StaticPage {
    var title = "Forms"
    var description = """
    Learn about Ignite's native search and newsletter subscription forms, \
    or create custom forms with text fields, buttons, and control groups.
    """

    var body: some HTML {
        Text("Forms")
            .font(.title1)

        Text(markdown: "Create everything from simple newsletter signups to complex data entry forms.")
            .font(.lead)

        Text("Basic form elements")
            .font(.title2)

        Text(markdown: "The `Form` element lets you create custom forms with any combination of inputs, buttons, and `FormItem`:")

        #LiveExample(previewMargin: .xLarge) {
            Form {
                TextField("Name", prompt: "Enter your name")
                    .type(.text)
                    .width(1)

                Button("Submit")
                    .type(.submit)
                    .role(.primary)
                    .width(1)
            }
            .columns(2)
        }

        Text("Label styles")
            .font(.title2)

        Text(markdown: "Forms support three different label styles:")

        Text("floating")
            .font(.title4)
            .smallCaps()

        Text(markdown: "Floating labels animate when focused, providing a modern and space-efficient interface.")

        #LiveExample(previewMargin: .large) {
            Form {
                TextField("Name", prompt: "Enter your name")
                    .type(.text)

                Button("Submit")
                    .type(.submit)
                    .role(.primary)
            }
            .labelStyle(.floating)
        }

        Text("leading")
            .font(.title4)
            .smallCaps()

        Text(markdown: "Leading labels appear to the left of inputs, providing a traditional form layout.")

        #LiveExample(previewMargin: .large) {
            Form {
                TextField("Name", prompt: "Enter your name")
                    .type(.text)

                Button("Submit")
                    .type(.submit)
                    .role(.primary)
            }
            .labelStyle(.leading)
        }

        Text("hidden")
            .font(.title4)
            .smallCaps()

        Text(markdown: "Hidden labels are accessible to screen readers but not visible, creating a clean interface.")

        #LiveExample(previewMargin: .large) {
            Form {
                TextField("Name", prompt: "Enter your name")
                    .type(.text)

                Button("Submit")
                    .type(.submit)
                    .role(.primary)
            }
            .labelStyle(.hidden)
        }

        Text("Control groups")
            .font(.title2)

        Text(markdown: "Use `ControlGroup` to combine related form elements into a single visual unit:")

        #LiveExample(previewMargin: .xLarge) {
            Form {
                ControlGroup("Username") {
                    Span("@")
                    TextField("Username", prompt: "Choose a username")
                }

                ControlGroup("Password") {
                    TextField("Password", prompt: "Enter your password")
                        .type(.password)
                    Button("Unlock", systemImage: "key-fill")
                    .role(.primary)
                }
            }
        }

        Text("Built-in Forms")
            .font(.title2)

        Text(markdown: "Ignite includes specialized forms for common use cases like newsletter subscriptions.")

        Text("Newsletter subscriptions")
            .font(.title3)

        Text(markdown: "The `SubscribeForm` makes it easy to collect email addresses for newsletters:")

        #LiveExample(previewMargin: .xLarge) {
            SubscribeForm(.buttondown("yourusername"))
                .emailFieldLabel("Your email address")
                .subscribeButtonLabel("Join our newsletter")
                .formStyle(.stacked)
        }
    }
}
