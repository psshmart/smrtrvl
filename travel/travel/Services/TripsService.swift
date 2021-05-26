//
//  TripsService.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class TripsService {
    
    var lastDocumentSnapshot: DocumentSnapshot!
    
    func doesUsersTripsExist(completion: @escaping ((TripsResponse) -> Void)) {
        let db = Firestore.firestore()
        
        db.collection("usersPublicTrips").getDocuments { (documents, err) in
            if err != nil {
                print("No trips yet")
                completion(.failure("No documents"))
                return
            } else {
                if documents!.documents.isEmpty {
                    completion(.failure("No documents"))
                    return
                } else {
                    for document in documents!.documents {
                        print("\(document.documentID)")
                        completion(.success)
                        return
                    }
                }
            }
        }
    }
    
    func doesTripsExist(completion: @escaping ((TripsResponse) -> Void)) {
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let docRef = db.collection("users").document(userId).collection("trips")
        docRef.getDocuments { (documents, error) in
            if let documents = documents, !documents.isEmpty {
                completion(.success)
                return
            } else {
                completion(.failure("Dosen't exist"))
            }
        }
    }
    
    func getUserTrip() {
        
    }
    
    func getUsersTrip(isEmpty: Bool, completion: @escaping (Result<[Trip], Error>) -> Void) {
        
        var trips: [Trip] = []
        var query: Query!
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
       
        
        if isEmpty {
            query = db.collection("publicTrips").whereField("uid", isNotEqualTo: uid).limit(to: 15)
            print("first 2 loaded")
        } else {
            query = db.collection("publicTrips").whereField("uid", isNotEqualTo: uid).start(afterDocument: lastDocumentSnapshot).limit(to: 15)
            print("other 2 loaded")
        }
        
        query.getDocuments { (snapshot, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            guard let lastSnapshot = snapshot?.documents.last else {
                print("collection is empty")
                return
            }
            
            self.lastDocumentSnapshot = lastSnapshot
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    do {
                        if let trip = try document.data(as: Trip.self) {
                            trips.append(trip)
                            
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
                trips.sort {
                    $0.startDate! < $1.startDate!
                }
                completion(.success(trips))
                
            }
        }
    }
    
    func checkIfLiked(trips: [Trip], completion: @escaping (Result<[Trip], Error>) -> Void) {
        let uid = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        var likedtrips: [Trip] = []
        
        var trips = trips
        
        let docRef = db.collection("users").document(uid!).collection("likedTrips")
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            if let snapshot = snapshot {
                if snapshot.documents.isEmpty {
                    for (index, trip) in trips.enumerated() {
                        var liked = trip
                        liked.isLiked = false
                        likedtrips.append(liked)
                        
                    }
                    likedtrips.sort {
                        $0.startDate! < $1.startDate!
                    }
                    completion(.success(likedtrips))
                    return
                }
                for document in snapshot.documents {
                    for (index, trip) in trips.enumerated() {
                        if trip.id.uuidString == document.documentID {
                            var liked = trip
                            liked.isLiked = true
                            likedtrips.append(liked)
                            trips.remove(at: index)
                        }
                    }
                }
              
                for trip in trips {
                    var liked = trip
                    liked.isLiked = false
                    likedtrips.append(liked)
                }
                
                trips.sort {
                    $0.startDate! < $1.startDate!
                }
                completion(.success(likedtrips))
                return
            }
        }
    }

    
    func getUserTrips(completion: @escaping (Result<[Trip], Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        var trips: [Trip] = []
        
        let docRef = db.collection("users").document(userId).collection("trips")
        docRef.getDocuments { querySnapshot, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    do {
                        if let trip = try document.data(as: Trip.self) {
                            trips.append(trip)
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
                completion(.success(trips))
            }
        }
    }
    
    
    func createDocRef(docId: String) -> DocumentReference? {
        guard let userId = Auth.auth().currentUser?.uid else { return nil }
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(userId).collection("likedTrips").document(docId)
        return docRef
    }
    
    
    
    func saveToLikedTrips(trip: Trip, completion: @escaping (Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(userId).collection("likedTrips").document(trip.id.uuidString)
        
        do {
            try docRef.setData(from: trip)
        } catch {
            completion(error)
            return
        }
    }
    
    func unlikeTrip(trip: Trip) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("likedTrips").document(trip.id.uuidString).delete() { error in
            if let error = error {
                print("Error removing document \(error)")
            } else {
                print("Was successfully unliked")
            }
            
        }
        
    }
    
    func saveTrip(trip: Trip, completion: @escaping (Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        guard let user = Auth.auth().currentUser else { return }
        
        var thisTrip = trip
        thisTrip.username = user.displayName
        thisTrip.uid = userId
        
        let db = Firestore.firestore()
        
        
        let docRef = db.collection("users").document(userId).collection("trips").document(trip.id.uuidString)
        do {
            try docRef.setData(from: thisTrip)
        } catch {
            completion(error)
        }
        
        
        if thisTrip.isPrivate == false {
            let docRefTrips = db.collection("publicTrips").document(trip.id.uuidString)
            do {
                try docRefTrips.setData(from: thisTrip)
            } catch {
                completion(error)
            }
        }
        
    }
    
    func deleteTrip(trip: Trip) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let tripId = trip.id.uuidString
        
        db.collection("users").document(userId).collection("trips").document(tripId).delete() { error in
            if let error = error {
                print("Error removing docemunt \(error)")
            } else {
                print("Document uccessfully removed!")
            }
        }
        db.collection("publicTrips").document(tripId).delete() { error in
            if let error = error {
                print("Error removing document \(error)")
            } else {
                print("Documents has been deleted from public trips")
            }
        }
        
    }
    
    func getLikedTrips(completion: @escaping (Result<[Trip], Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        var trips: [Trip] = []
        
        let docRef = db.collection("users").document(userId).collection("likedTrips")
        docRef.getDocuments { querySnapshot, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    do {
                        if let trip = try document.data(as: Trip.self) {
                            trips.append(trip)
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
                completion(.success(trips))
            }
        }
        
    }
    
}
