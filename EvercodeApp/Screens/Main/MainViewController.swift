import UIKit

final class MainViewController: UIViewController {

    private lazy var mainView: MainView = {

        let mainView = MainView()
        return mainView
    }()
    
    let service = Service()

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Evercode App"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        service.fetchData { items in
            
            DispatchQueue.main.async {
                
                if let items = items {
                    
                    self.mainView.updateView(items: items)
                }
            }
        }
        
    }

    override func loadView() {
        self.view = mainView
    }
}
