//
//  Network.swift
//  OtriumApp
//
//  Created by Rizvi on 3/5/21.
//





import Foundation
import Apollo
import ApolloSQLite

class Network {
    
    static let shared = Network()
            
    /* ==================================================
     Used to request network call in GraphQL
     ================================================== */
    private(set) lazy var apollo: ApolloClient = {
        let token = Constant.App.TOKEN
        let url = URL(string: Constant.App.BASE_URL)!
        let header = ["Authorization": "Bearer  \(token)"]
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: interceptionProvider(), endpointURL: url, additionalHeaders: header)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store())
      }()
    
    /* ==================================================
     Used to setup Apollo Store
     ================================================== */
    private func store() -> ApolloStore {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("otrium_app_db.sqlite")

        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        return ApolloStore(cache: sqliteCache)
    }
    
    /* ==================================================
     Used to setup Provider
     ================================================== */
    private func interceptionProvider() -> LegacyInterceptorProvider {
        let client = URLSessionClient()
        return LegacyInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store())
    }
    
    
    
}

