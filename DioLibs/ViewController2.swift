//
//  ViewController2.swift
//  DioLibs
//
//  Created by Rodolfo Navarro on 17/08/21.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController2: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.startAnimating()
        activity.isHidden = true
        
    }
    
    private func makePokemonSearch(with text: String) {
        activity.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            AF.request("https://pokeapi.co/api/v2/pokemon/\(text)").validate().responseDecodable(of: Pokemon.self) {
                response in
                self.activity.isHidden = true
                guard let pokemon = response.value else { return }
                self.imageView.kf.setImage(with: URL(string: pokemon.sprites.frontDefault)!)
                self.label.text = pokemon.name
            }
        }
    }
}

extension ViewController2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true}
        view.endEditing(false)
        makePokemonSearch(with: text)
        return true
    }
}
