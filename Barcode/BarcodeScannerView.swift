//
//  ContentView.swift
//  Barcode
//
//  Created by Julian Martinez on 12/23/20.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text("Not Yet Scanned")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            .navigationTitle("Navigation Scanner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
