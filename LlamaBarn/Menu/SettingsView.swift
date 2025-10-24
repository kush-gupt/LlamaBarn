import ServiceManagement
import SwiftUI

struct SettingsView: View {
  @State private var launchAtLogin = LaunchAtLogin.isEnabled
  @State private var showQuantizedModels = UserSettings.showQuantizedModels

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("Launch at Login")
        Spacer()
        Toggle(
          "",
          isOn: Binding(
            get: { launchAtLogin },
            set: { newValue in
              if LaunchAtLogin.setEnabled(newValue) {
                launchAtLogin = newValue
              }
            }
          )
        )
        .labelsHidden()
        .toggleStyle(SwitchToggleStyle())
        .controlSize(.mini)
      }
      HStack {
        Text("Show quantized models")
        Spacer()
        Toggle("", isOn: $showQuantizedModels)
          .labelsHidden()
          .toggleStyle(SwitchToggleStyle())
          .controlSize(.mini)
          .onChange(of: showQuantizedModels) { _, newValue in
            UserSettings.showQuantizedModels = newValue
          }
      }
    }
    .padding(EdgeInsets(top: 8, leading: 13, bottom: 8, trailing: 13))
  }
}

#Preview {
  SettingsView()
}
