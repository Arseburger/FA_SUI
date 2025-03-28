import SwiftUI

struct ContentView: View {
    @State var status: StatusResult? = nil
    var service: BaseService = .init()
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center, spacing: 16) {
                Image(decorative: "bal", bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 300, alignment: .center)
                
                //name
                if let status = status {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("First name: ")
                                .bold()
                            Text(status.account.firstName)
                        }
                        .padding(4)
                        
                        HStack {
                            Text("Last name: ")
                                .bold()
                            Text(status.account.lastName)
                        }
                        .padding(4)
                        
                        //email
                        HStack {
                            Text("E-mail: ")
                                .bold()
                            Text(status.account.email)
                        }
                        .padding(4)
                        
                        //subs
                        HStack {
                            Text("Subscription plan: ")
                                .bold()
                            Text(status.subscription.plan)
                        }
                        .padding(4)
                        
                        HStack {
                            Text("End date: ")
                                .bold()
                            
                            Text(formatDate(status.subscription.endDate))
                            
                        }
                        .padding(4)
                        
                        //requests
                        HStack {
                            Text("Requests used: ")
                                .bold()
                            Text("\(status.requests.current) / \(status.requests.dailyLimit)")
                        }
                        .padding(4)
                    }
                    
                }
                
            }
            .onAppear {
                service.loadStatus { res in
                    status = res.response
                }
            }
        }
        .navigationBarHidden(false)
        .statusBar(hidden: false)
        .navigationTitle("Status")
        .background(.red)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    var service: BaseService = .init()
//    var status: StatusResult?
//
//    static var previews: some View {
//        ContentView()
//    }
//}
