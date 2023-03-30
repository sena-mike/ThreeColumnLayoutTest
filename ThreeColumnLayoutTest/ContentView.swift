import SwiftUI

struct ColumnView: View {
  let color: Color
  let name: String
  var body: some View {
    ZStack {
      color
      Text(name)
    }
  }
}

struct ContentView: View {
  @State var columnVisibility: NavigationSplitViewVisibility = .all
  @State var inspectorVisible: Bool = true
  var body: some View {
    NavigationSplitView {
      ColumnView(color: .yellow, name: "Navigator")
        .ignoresSafeArea()
    } detail: {
      HSplitView {
        ColumnView(color: .green, name: "Canvas")
          .ignoresSafeArea()
        if inspectorVisible {
          ColumnView(color: .blue, name: "Inspector")
            .ignoresSafeArea()
            .frame(maxWidth: 300)
        }
      }
      .toolbar {
        ToolbarItem {
          Button {
            inspectorVisible.toggle()
          } label: {
            Image(systemName: "sidebar.right")
          }
        }
      }
    }
    .font(.title)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
