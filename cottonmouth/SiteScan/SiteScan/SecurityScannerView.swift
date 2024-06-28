//
//  SecurityScannerView.swift
//  SiteScan
//
//  Created by Martin Gregory on 6/22/24.
//

import SwiftUI

struct SecurityScannerView: View {
    @Binding var startScanning: Bool
    @Binding var scanResult: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            CameraScannerViewController(startScanning: $startScanning, scanResult: $scanResult)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            scanResult = ""
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
                .onChange(of: scanResult) {
                    self.presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

#Preview {
    SecurityScannerView(startScanning: .constant(true), scanResult: .constant(""))
}
