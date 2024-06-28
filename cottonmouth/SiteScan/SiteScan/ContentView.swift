//
//  ContentView.swift
//  SiteScan
//
//  Created by Martin Gregory on 6/22/24.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    
    @State private var showSecurityScannerView = false
    @State private var isScanningPossible = false
    @State private var showScanningNotPossibleAlert = false
    @State private var scanResults: String = ""
    @State private var positiveResult = false
    
    var body: some View {
        VStack {
            Text("SiteScan")
                .font(Font.largeTitle)
            //            .font(Font.custom("AvenirNext-Regular", size: 18))
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
            Text(
                positiveResult ?
                "Possible exposed password detected" :
                    "")
            .font(Font.headline)
            //            .font(Font.custom("AvenirNext-Regular", size: 18))
            .foregroundColor(.red)
            .padding()
            
            if positiveResult {
                Button {
                    
                } label: {
                    Text("Log this Incidence")
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
            
            Button {
                if isScanningPossible {
                    self.showSecurityScannerView = true
                } else {
                    self.showScanningNotPossibleAlert = true
                }
            } label: {
                Text("Tap to Scan")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        
        .onChange(of: scanResults) {
            positiveResult = scanResults.lowercased().contains("password")
        }
        
        .sheet(isPresented: $showSecurityScannerView) {
            SecurityScannerView(startScanning: $showSecurityScannerView, scanResult: $scanResults)
        }
        
        .alert("Scanner is unavailable or not supported on this device", isPresented: $showScanningNotPossibleAlert, actions: {})
        
        .onAppear {
            isScanningPossible = (DataScannerViewController.isSupported &&
                                  DataScannerViewController.isAvailable)
        }
    }
}

#Preview {
    ContentView()
}
