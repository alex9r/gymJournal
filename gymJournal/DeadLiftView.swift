//
//  Page1View.swift
//  gymJournal
//
//  Created by Alexandra Roszczenko on 2025-03-01.
//

import SwiftUI

struct DeadLiftView: View {
    @State private var sets: [WorkoutSet] = []
    @State private var nextSetNumber: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Dead Lift")
                    .font(.largeTitle)
                    .padding(.vertical, 20)
                
                // Centered table container
                VStack(spacing: 0) {
                    // Header row (centered)
                    HStack(spacing: 20) {
                        Text("Set")
                            .frame(width: 50, alignment: .center)
                        
                        Text("Reps")
                            .frame(width: 100, alignment: .center)
                        
                        Text("Weight")
                            .frame(width: 100, alignment: .center)
                        
                        Button(action: addSet) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 32)
                    }
                    .font(.headline)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color(.systemGray6))
                    
                    // List of sets (centered)
                    List {
                        ForEach($sets) { $workoutSet in
                            HStack(spacing: 20) {
                                Text("\(workoutSet.setNumber)")
                                    .frame(width: 50, alignment: .center)
                                
                                Picker("Reps", selection: $workoutSet.reps) {
                                    ForEach(1...100, id: \.self) { num in
                                        Text("\(num)").tag(num)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 100, height: 100)
                                
                                TextField("lbs", text: $workoutSet.weight)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 100)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Spacer()
                                    .frame(width: 32)
                            }
                            .padding(.vertical, 8)
                        }
                        .onDelete(perform: deleteSet)
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(maxWidth: 400) // Constrain width for better centering
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .onAppear {
                if sets.isEmpty { addSet() }
            }
        }
    }
    
    private func addSet() {
        let newSet = WorkoutSet(setNumber: nextSetNumber, reps: 8, weight: "")
        sets.append(newSet)
        nextSetNumber += 1
    }
    
    private func deleteSet(at offsets: IndexSet) {
        sets.remove(atOffsets: offsets)
        for (index, _) in sets.enumerated() {
            sets[index].setNumber = index + 1
        }
        nextSetNumber = sets.count + 1
    }
}

struct WorkoutSet: Identifiable {
    let id = UUID()
    var setNumber: Int
    var reps: Int
    var weight: String
}

struct DeadLiftView_Previews: PreviewProvider {
    static var previews: some View {
        DeadLiftView()
    }
}
