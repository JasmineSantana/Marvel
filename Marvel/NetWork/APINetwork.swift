//
//  APINetwork.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import Foundation

// Criar um enumerados mensgens de erros
enum APIError{
    case endpointError
    case requestError
    case parseError
}

class APINetwork {
  
    // Uma função que recebe outra função de retorno
    //Começamos criando uma função chamada getHeroes
    // Dentro da função estamos colocando dois parametros
    // Parametro Completion: recebe Hero que não executada nada (void não executa nada)
    //@escaping função assicrona demora a retorna uma informação, estamos colocando essa função para aguarda o carregamento antes de apresentar a informação
    // Em hero alteramos com o [] para apresentar um Array de heroes
    
    func getHeroes (completion: @escaping ([Hero]) -> Void, onError: @escaping (APIError) -> Void){
        
        // URL endpoint (chamada da pagina)
        //Estamos executando uma função e caso ele não encontre a URL ele vai chamar a mensagem de error (uma das formas do Optional)
        guard let endpoint = URL(string: "") else {
            onError(.endpointError)
            return
        }
        
        // Criando uma váriavel que irá usar minha URLSession.
        //With é um parametro
        //Dentro do paramentro ele também recebe uma função
        // Criamo uma função anonima
        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            /* Uma opção de fazer, porém se repete muitas vezes:
            // crio um If referente ao erro se eu não tomar nenhum erro eu sigo caso contrário eu apresento o erro
            if error != nil{
                onError(.requestError)
                return
            }
            // Realizar o tratamento da Resposta
            guard let response = response as? HTTPURLResponse else {
                onError(.requestError)
                return
            }
            //Crio um IF referente a reponsta se não for 200
            if response.statusCode != 200{
                onError(.requestError)
                return
            }*/
            
            guard let data,
                  let response = response as? HTTPURLResponse,
                  error == nil,
                  response.statusCode == 200 else {
                onError(.requestError)
                return
            }
            
        }
        
        task.resume()
    }
}
