//
//  ContentView.swift
//  Barcode
//
//  Created by Julian Martinez on 12/23/20.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissedButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceIntput = AlertItem(title: "Invalid Devide Input",
                                               message: "Something is wrong with the camera. We are unable to capture the input",
                                               dismissedButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type",
                                               message: "The value scanned is not valid. This app scans EAN-8 and EAN-13",
                                               dismissedButton: .default(Text("OK")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
                Button {
                } label: {
                    Text("Tap Me")
                }
                
            }
            
            .navigationTitle("Navigation Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissedButton)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
