//
//  AccountForm.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

enum AccountFormField: Int, RawRepresentable, Hashable, CaseIterable {
    case name = 0, age
    var label: String {
        switch self {
        case .name:
            return "Name"
        case .age:
            return "Age"
        }
    }
}

struct AccountForm: View {
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false

    @FocusState private var currentFocus: AccountFormField?
    
    var body: some View {
        // Note, this would typically be a Form/List, but the form does not work. Feedback filed.
        VStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Name", text: $name)
                    .focused($currentFocus, equals: .name)
                Divider()
                TextField("Age", text: $age)
                    .focused($currentFocus, equals: .age)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .foregroundColor(.white)
            )
            
            Button(action: onTapNext) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.accentColor)
            
            Spacer()
        }
        .padding()
        .background(Color(uiColor: .systemGroupedBackground))
        .navigationTitle("Profile")
        .alert(alertMessage, isPresented: $showAlert, actions: {
            Button("Ok, got it.", role: .cancel) {}
        })
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: { onTapNext() }, label: {
                    Image(systemName: "chevron.down")
                })
                Button(action: { onTapPrevious() }, label: {
                    Image(systemName: "chevron.up")
                })
                Spacer()
                
                Text(currentFocus?.label ?? "")
                    .foregroundColor(.accentColor)
                    .font(.headline)
                
                Spacer()
                
                Button(action: { currentFocus = nil }, label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                        .padding()
                })
                .background(.yellow, in: RoundedRectangle(cornerRadius: 4, style: .circular))
            }
        }
    }
    
    // If we get another field, shift to that, otherwise, clear focus
    func onTapNext() {
        guard let currentFocus = currentFocus,  let currentFieldIndex = AccountFormField.allCases.firstIndex(of: currentFocus) else {
            return
        }
        if AccountFormField.allCases.indices.contains(currentFieldIndex + 1) {
            self.currentFocus = AccountFormField.allCases[currentFieldIndex + 1]
        } else {
            self.currentFocus = nil
            performValidation()
            
        }
    }
    
    func onTapPrevious() {
        guard let currentFocus = currentFocus,  let currentFieldIndex = AccountFormField.allCases.firstIndex(of: currentFocus) else {
            return
        }
        if AccountFormField.allCases.indices.contains(currentFieldIndex - 1) {
            self.currentFocus = AccountFormField.allCases[currentFieldIndex - 1]
        }
    }
    
    func performValidation() {
        if !name.isEmpty && !age.isEmpty {
            alertMessage = "You're good to go!"
            showAlert = true
        } else {
            alertMessage = "You must add your name and age."
            showAlert = true
        }
    }
}

struct AccountForm_Previews: PreviewProvider {
    static var previews: some View {
        AccountForm()
    }
}
