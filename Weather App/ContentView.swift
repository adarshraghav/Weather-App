//
//  ContentView.swift
//  Weather App
//
//  Created by Adarsh Raghav on 03/05/21.
//
import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @StateObject private var forecastListVM = ForecastListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $forecastListVM.system, label: Text("System")) {
                    Text("°C").tag(0)
                    Text("°F").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)
                .padding(.vertical)
                HStack {
                    TextField("Enter your location ", text: $forecastListVM.location) .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button{
                        forecastListVM.getWeatherForecast()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill") .font(.title3)
                    }
                }
                List(forecastListVM.forecasts, id: \.day) {day in
                        VStack(alignment: .leading) {
                            Text(day.day)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            HStack(alignment: .center){
                                WebImage(url: day.weatherIconURL)
                                    .resizable()
                                    .placeholder{
                                        Image(systemName: "hourglass")
                                    }
                                    .scaledToFit()
                                    .frame(width: 75)
                                VStack(alignment: .leading){
                                    Text(day.overview)
                                    HStack(){
                                        Text(day.high)
                                        Text(day.low)
                                    }
                                    HStack(){
                                        Text(day.clouds)
                                        Text(day.pop)
                                    }
                                    Text(day.humidity)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
            }
            .padding(.horizontal)
            .navigationTitle("Mobile Weather")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
