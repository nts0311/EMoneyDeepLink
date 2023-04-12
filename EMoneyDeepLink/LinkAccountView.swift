//
//  LinkAccountView.swift
//  EMoneyDeepLink
//
//  Created by son on 21/03/2023.
//

import SwiftUI

struct LinkAccountView: View {
    @State var partnerCode: String = "PASSAPP"
    @State var accountPartnerId: String = "855312594354"
    @State var phonePartner: String = "855312594354"
    
    var deepLink: String {
        return "eMoneyEU://link_account?partnerCode=\(partnerCode)&accountPartnerId=\(accountPartnerId)&phonePartner=\(phonePartner)"
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("partnerCode:")
                        .foregroundColor(.gray)
                    TextField("partnerCode", text: $partnerCode)
                }
                
                HStack {
                    Text("accountPartnerId:")
                        .foregroundColor(.gray)
                    TextField("accountPartnerId", text: $accountPartnerId)
                }
                
                HStack {
                    Text("phonePartner:")
                        .foregroundColor(.gray)
                    TextField("phonePartner", text: $phonePartner)
                }
                
            } header: {
                Text("Deeplink Inputs")
            }
            
            Section {
                Text(deepLink)
                    .textSelection(.enabled)
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

struct LinkAccountView_Previews: PreviewProvider {
    static var previews: some View {
        LinkAccountView()
    }
}
