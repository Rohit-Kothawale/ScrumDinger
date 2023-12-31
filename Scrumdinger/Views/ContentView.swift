import SwiftUI
import AVFoundation


struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    private var player: AVPlayer {
        AVPlayer.sharedDingPlayer
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                VStack {
                    // Meeting Header View
                    MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                      secondsRemaining: scrumTimer.secondsRemaining,
                                      theme: scrum.theme)

                    // Circle
                    Circle()
                        .strokeBorder(lineWidth: 24)

                    // Meeting Footer View
                    MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                }
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lenghtInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }

    func endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
