//
//  PersonViewModel.swift
//  Pridicate_Macro
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/25.
//

import Foundation

class PersonViewModel {

    private var persons: [Person] = []
    private var datum: [Datum] = []

    init() {
        loadData()
    }

    func loadData(completion: (() -> Void)? = nil) {
        let url = URL(string: "https://umayadia-apisample.azurewebsites.net/api/persons")
        APIManager.shred.callAPI(url: url, type: Person.self) { result in
            switch result {
            case .success(let persons):
                if let persons = persons {
                    self.persons = [persons]
                    self.datum = persons.data
                    completion?()
                }
            case .failure(let failure):
                completion?()
                print("エラー", failure)
            }
        }
    }
    
    func pridicate(underNYearsOld: Int, complision: ([Datum]) -> Void) {
        let personPridicate = #Predicate<Datum> { person in
            return person.age < underNYearsOld
        }

        do {
            if #available(iOS 17, *) {
                let person = try datum.filter(personPridicate)
                complision(person)
            } else {

            }
        } catch {

        }
    }


}
