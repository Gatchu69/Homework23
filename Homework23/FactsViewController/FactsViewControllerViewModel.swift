//
//  ViewControllerViewModel.swift
//  Homework23
//
//  Created by Nodiko Gachava on 03.05.24.
//

import Foundation
import NetworkServiceB

protocol FactsViewModelDelegate: AnyObject {
    func factsFetched(_ facts: [Facts])
}


final class FactsViewModel {
    weak var delegate: FactsViewModelDelegate?
    private var factsArray: [Facts] = []
    var urlString = "https://catfact.ninja/facts?max_length=50&limit=50"

    func getInfo(completion: @escaping (Result<CatInfo,Error>) ->(Void)) {
        NetworkService().getData(urlString: urlString, completion: completion)
    }
}
