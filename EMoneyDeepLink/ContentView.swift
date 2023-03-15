//
//  ContentView.swift
//  EMoneyDeepLink
//
//  Created by son on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var msisdn: String = ""
    @State var partnerCode: String = ""
    @State var accountPartnerId: String = ""
    
    var deepLink: String {
        return "eMoneyEU://link_passapp?msisdn=\(msisdn)&partnerCode=\(partnerCode)&accountPartnerId=\(accountPartnerId)"
    }
    
    var body: some View {
        Form {
            Section {
                TextField("msisdn", text: $msisdn)
                TextField("partnerCode", text: $partnerCode)
                TextField("msisdn", text: $accountPartnerId)
            } header: {
                Text("Deeplink Inputs")
            }
            
            Section {
                Text(deepLink)
            } header: {
                Text("Deeplink preview")
            }
            
            HStack {
                Button("To Emoney", action: invokeEMoneyDeepLink)
                    .buttonStyle(.automatic)
                    .frame(maxWidth: .infinity)
            }
        }
        
    }
    
    func invokeEMoneyDeepLink() {
        
        guard let deepLinkUrl = URL(string: deepLink) else {
            openAppStore()
            return
        }
        
        let isEMoneyEUInstalled = UIApplication.shared.canOpenURL(URL(string: "eMoneyEU://")!)
        
        if isEMoneyEUInstalled {
            UIApplication.shared.open(deepLinkUrl)
        } else {
            openAppStore()
        }
    }
    
    func openAppStore() {
        UIApplication.shared.open(URL(string: "https://apps.apple.com/app/emoney-end-user/id1069866065")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
