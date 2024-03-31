//
//  StoreDetailView.swift
//  Assignment3
//
//  Created by user250993 on 3/30/24.
//

import SwiftUI
import MapKit

struct StoreDetailView: View {
    
    @ObservedObject var viewModel: StoreListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                if let store = viewModel.selectedStore {
                    
                    Text("\(store.address.addressLine1) \(store.address.city) \(store.address.state)")
                        .font(.system(size: 17,weight: .medium))
                        .frame(maxWidth: 240, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.leading, 17)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                    if let cameraPosition = viewModel.selectedStoreCameraPosition {
                        Map(coordinateRegion: cameraPosition, annotationItems: [store]) { store in
                            MapMarker(coordinate: CLLocationCoordinate2D(latitude: store.geolocation.latitude, longitude: store.geolocation.longitude))
                        }
                        .frame(height: 280)
                    }
                    
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 2))
                        Text(store.phone)
                            .foregroundColor(.black)
                            .font(.callout)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 12))
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: 1.5)
                    )
                    .padding(EdgeInsets(top: 2, leading: 12, bottom: 1, trailing: 0))
                    
                } else {
                    Text("No store selected")
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("Kroger Store \(viewModel.selectedStore?.storeNumber ?? "-")"))
        }
    }
}


struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = StoreListViewModel()
        
        return StoreDetailView(viewModel: viewModel)
    }
}
