//
//  MachineLearningManager.swift
//  ML
//
//  Created by Arteezy on 6/18/22.
//

import Foundation

enum SafeOrSpamEnum {
    case spam
    case safe
}


class MachineLearningManager {
        
    static let sharedInstance = MachineLearningManager()
    
    func runMachineLearningModelOnText(text: String,completion: @escaping (SafeOrSpamEnum) -> Void) {
        
        GeneralRequestManager.sharedInstance.generatePOSTServerRequest(url: AWSAPIGatewayURLs.ML_MachineLearningDetection, body: ["text": text]) { data in
            guard let data = data else {
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(MachineLearningDetectionResponse.self, from: data) {
                
                print("DecodedResponse: \(decodedResponse)")
                
                if decodedResponse.spam == 0 {
                    completion(.safe)
                }else{
                    completion(.spam)
                }
                
            }
            
        }
        
        
        
    }
    
    
}
