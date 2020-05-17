//
//  Task.swift
//  ListProject
//
//  Created by Alyaa AlOstad on 5/16/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var toDoItems = String()
}

class TaskStored : ObservableObject{
    @Published var tasks = [Task]()
}
