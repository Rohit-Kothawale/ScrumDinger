import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lenghtInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lenghtInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Preview: PreviewProvider {
    static var sampleScrum: DailyScrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: sampleScrum)
            .background(sampleScrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
