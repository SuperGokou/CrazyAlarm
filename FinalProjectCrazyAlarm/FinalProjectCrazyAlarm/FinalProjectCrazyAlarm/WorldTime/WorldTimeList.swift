//
//  WorldTimeList.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI
import Foundation
import Combine


struct CityName {
    let id = UUID()
    let city: String
    let country: String
    let TimeZone: String
}

struct timezoneCityList{
    static let partCities = [
        CityName(city: "Alofi", country: "Niue", TimeZone: "UTC-11"),
        CityName(city: "Honolulu",country: "United States", TimeZone: "UTC-10"),
        CityName(city: "East Honolulu",country: "United States", TimeZone: "UTC-10"),
        CityName(city: "Pearl City",country: "United States", TimeZone: "UTC-10"),
        CityName(city: "Hilo",country: "United States", TimeZone: "UTC-10"),
        CityName(city: "Kailua",country: "United States", TimeZone: "UTC-10"),
        CityName(city: "Avarua",country: "Cook Islands", TimeZone: "UTC-10"),
        CityName(city: "Faaa",country: "French Polynesia", TimeZone: "UTC-10"),
        CityName(city: "Papeete",country: "French Polynesia", TimeZone: "UTC-10"),
        CityName(city: "Punaauia",country: "French Polynesia", TimeZone: "UTC-10"),
        CityName(city: "Pirae",country: "French Polynesia", TimeZone: "UTC-10"),
        CityName(city: "Mahina",country: "French Polynesia", TimeZone: "UTC-10"),
        CityName(city: "Taiohae",country: "French Polynesia", TimeZone: "UTC-9:30"),
        CityName(city: "Anchorage",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Fairbanks",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Eagle River",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Badger",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Knik-Fairview",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Juneau",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Sitka",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Ketchikan",country: "United States", TimeZone: "UTC-9"),
        CityName(city: "Los Angeles",country: "United States", TimeZone: "UTC-8"),
        CityName(city: "San Diego",country: "United States", TimeZone: "UTC-8"),
        CityName(city: "San Jose",country: "United States", TimeZone: "UTC-8"),
        CityName(city: "San Francisco",country: "United States", TimeZone: "UTC-8"),
        CityName(city: "Seattle",country: "United States", TimeZone: "UTC-8"),
        CityName(city: "Tijuana",country: "Mexico", TimeZone: "UTC-8"),
        CityName(city: "Mexicali",country: "Mexico", TimeZone: "UTC-8"),
        CityName(city: "Ensenada",country: "Mexico", TimeZone: "UTC-8"),
        CityName(city: "Rosarito",country: "Mexico", TimeZone: "UTC-8"),
        CityName(city: "Tecate",country: "Mexico", TimeZone: "UTC-8"),
        CityName(city: "Vancouver",country: "Canada", TimeZone: "UTC-8"),
        CityName(city: "Surrey",country: "Canada", TimeZone: "UTC-8"),
        CityName(city: "Okanagan",country: "Canada", TimeZone: "UTC-8"),
        CityName(city: "Victoria",country: "Canada", TimeZone: "UTC-8"),
        CityName(city: "Burnaby",country: "Canada", TimeZone: "UTC-8"),
        CityName(city: "Adamstown",country: "Pitcairn", TimeZone: "UTC-8"),
        CityName(city: "Boise",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Meridian",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Nampa",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Idaho Falls",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Pocatello",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Chihuahua",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Ciudad Delicias",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Cuauhtémoc",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Parral",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Nuevo Casas Grandes",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Fort St. John",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Dawson Creek",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Denver",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "El Paso",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Albuquerque",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Colorado Springs",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Aurora",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Calgary",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Edmonton",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Fort McMurray",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Red Deer",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Lethbridge",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Hermosillo",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Ciudad Obregón",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Nogales",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "San Luis Río Colorado",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Navojoa",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Culiacán",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Mazatlán",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Tepic",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Los Mochis",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "La Paz",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Ciudad Juárez",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Manuel Ojinaga",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Ojinaga",country: "Mexico", TimeZone: "UTC-7"),
        CityName(city: "Phoenix",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Tucson",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Mesa",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Chandler",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Gilbert",country: "United States", TimeZone: "UTC-7"),
        CityName(city: "Whitehorse",country: "Canada", TimeZone: ""),
        CityName(city: "Yellowknife",country: "Canada", TimeZone: "UTC-7"),
        CityName(city: "Mezcales",country: "Mexico", TimeZone: "UTC-6"),
        CityName(city: "San Vicente",country: "Mexico", TimeZone: "UTC-6"),
        CityName(city: "Bucerías",country: "Mexico", TimeZone: "UTC-6"),
        CityName(city: "Valle de Banderas",country: "Mexico", TimeZone: "UTC-6"),
        CityName(city: "Belize City",country: "Belize", TimeZone: "UTC-6"),
        CityName(city: "San Ignacio",country: "Belize", TimeZone: "UTC-6"),
        CityName(city: "Orange Walk",country: "Belize", TimeZone: "UTC-6"),
        CityName(city: "Belmopan",country: "Belize", TimeZone: "UTC-6"),
        CityName(city: "Dangriga",country: "Belize", TimeZone: "UTC-6"),
        CityName(city: "Chicago",country: "United States", TimeZone: "UTC-6"),
        CityName(city: "Houston",country: "United States", TimeZone: "UTC-6"),
        CityName(city: "San Antonio",country: "United States", TimeZone: "UTC-6"),
        CityName(city: "Dallas",country: "United States", TimeZone: "UTC-6"),
        CityName(city: "Austin",country: "United States", TimeZone: "UTC-6"),
//San José, Limón, San Francisco, Alajuela, Liberia
        CityName(city: "San José",country: "Costa Rica", TimeZone: "UTC-6")
    ]
}
