//
//  Network.swift
//  OtriumApp
//
//  Created by Rizvi on 3/5/21.
//





import Foundation
import Apollo
import ApolloWebSocket

class Network {
    
    static let shared = Network()
        
    //private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.github.com/graphql")!)
    
    /* ==================================================
     Used to request network call in GraphQL
     ================================================== */
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        
        let provider = LegacyInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store)
        
        let url = URL(string: Constant.App.BASE_URL)!
        let header = ["Authorization": "Bearer 3b062f9d92bfde30acffebf801862d8ee9797946"]
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url, additionalHeaders: header)
  
        return ApolloClient(networkTransport: requestChainTransport, store: store)
      }()
    
    

    
}

