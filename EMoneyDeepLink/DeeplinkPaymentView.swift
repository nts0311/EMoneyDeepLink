//
//  DeeplinkPaymentView.swift
//  EMoneyDeepLink
//
//  Created by son on 21/03/2023.
//

import SwiftUI

struct DeeplinkPaymentView: View {
    
    private let currencies = ["USD", "KHR"]
    
    @State var refId: String = "PASSAPPTEST"
    @State var partnerCode: String = "PASSAPP"
    @State var accountPartnerId: String = "855312594354"
    @State var amount = "10.0"
    @State var currency: String = "USD"
    @State var phonePartner: String = "855312594354"
    
    var deepLink: String {
        let selectedCurrency = (currency == "USD") ? 0 : 1
        
        return "eMoneyEU://deeplink_payment?refId=\(refId)&partnerCode=\(partnerCode)&accountPartnerId=\(accountPartnerId)&amount=\(amount)&currency=\(selectedCurrency)&phonePartner=\(phonePartner)"
    }
    
    var body: some View {
        Form {
            Section {
                
                HStack {
                    Text("refId:")
                        .foregroundColor(.gray)
                    TextField("refId", text: $refId)
                }
                
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
                
                HStack {
                    Text("amount:")
                        .foregroundColor(.gray)
                    
                    TextField("accountPartnerId", text: $amount)
                    
//                    TextField("amount", value: $amount, format: .currency(code: ""))
//                        .keyboardType(.decimalPad)
                    
                }
                
                HStack {
                    Text("currency:")
                        .foregroundColor(.gray)
                    
                    Picker("currency", selection: $currency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
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

struct DeeplinkPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        DeeplinkPaymentView()
    }
}
