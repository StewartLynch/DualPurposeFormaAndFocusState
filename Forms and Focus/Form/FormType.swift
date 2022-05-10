//
// Created for Forms and Focus
// by Stewart Lynch on 2022-05-09
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

enum FormType: Identifiable, View {
    case new
    case update(Contact)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return FormView(viewModel: FormViewModel())
        case .update(let contact):
            return FormView(viewModel: FormViewModel(contact))
        }
    }
}
