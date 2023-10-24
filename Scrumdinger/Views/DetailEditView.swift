import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinuteAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                            .accessibilityValue("\(scrum.lenghtInMinutes) minutes")
                    }
                    Spacer()
                    Text("\(scrum.lenghtInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }

            Section(header: Text("Attendee")) {
                ForEach(scrum.attendees) { attendee in
                    Text("\(attendee.name)")
                }
                .onDelete { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                }

                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(newAttendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Preview: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
