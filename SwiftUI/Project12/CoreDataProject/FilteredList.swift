//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Anuj Rajput on 18/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, sortDescriptor: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptor, predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey , filterValue))
        self.content = content
    }
}
