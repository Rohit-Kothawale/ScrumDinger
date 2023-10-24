import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            VStack {
                // Progress bar
                ProgressView(value: 5, total: 15)

                // Text
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.tophalf.fill")
                    }
                    Spacer()

                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.bottomhalf.fill")
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time Remaining")
                .accessibilityValue("10 minutes")

                // Circle
                Circle()
                    .strokeBorder(lineWidth: 24)

                HStack {
                    Text("Speaker 1 Of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
